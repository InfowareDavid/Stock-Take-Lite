//
//  ScannerViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/3/17.
//  Copyright © 2017年 infoware. All rights reserved.
//



import UIKit
import AVFoundation

/// This ViewControlelr is used for scan barcode

var tip_sound_id:SystemSoundID = 0

class ScannerViewController: BaseViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    /// last VC
    var lastVC:CameraScanViewController?
    
    /// 相机扫描的条码
    var dataArray:NSMutableArray!
    
    /// 捕捉流对话
    var captureSession = AVCaptureSession()
    
    //初始化捕捉设备
    var captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    
    /// 定时器
    var timer:DispatchSourceTimer?
    
    /// 时间间隔
    let timeInterval:DispatchTimeInterval = .seconds(1)
    
    /// 测试的定时器计数器
    var testInt:Int = 0
    
    /// 背景视图，留着待用
    var scanBackgoundView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    /// 数据库管理
    var dbManager:DataBase!
    
    /// 切换扫描状态
    var scanButton:UIButton!
    
    /// 返回上一个页面
    var backButton:UIButton!
    
    /// 闪光灯按钮
    var torchButton:UIButton!
    
    /// 切换摄像头
    var switCameraButton:UIButton!
    
    /// 展示盘点的条目
    var displayTableView:UITableView?
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer?.cancel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        commoninit()
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 添加定时器
    func addTimer(){
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer?.scheduleRepeating(deadline: .now() + timeInterval, interval: timeInterval)
        
        timer?.setEventHandler(handler: {
            self.startScan()
            self.testInt += 1
            print(self.testInt)
        })
        timer?.resume()
    }
    
    func createUI(){
        
        backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self , action: #selector(backToCameraCanView), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        scanButton = UIButton(type: .system)
        scanButton?.setTitle("Stop", for: .normal)
        scanButton.setTitle("Scan", for: .selected)
        scanButton?.addTarget(self , action: #selector(stopScanButtonAction(button:)), for: .touchUpInside)
        self.view.addSubview(scanButton!)
        
        torchButton = UIButton(type: .system)
        torchButton.isEnabled = hasFlash()
        torchButton?.setTitle("Flash On", for: .normal)
        torchButton.setTitleColor(.gray, for: .disabled)
        torchButton?.setTitle("Flash Off", for: .selected)
        torchButton?.setTitle("NO Flash", for: .disabled)

        torchButton?.addTarget(self , action: #selector(turnTorch(btn:)), for: .touchUpInside)
        self.view.addSubview(torchButton!)
        
        switCameraButton = UIButton(type: .system)
        switCameraButton?.setTitle("Front", for: .normal)
        switCameraButton?.setTitle("Rear", for: .selected)

        switCameraButton?.addTarget(self , action: #selector(swapCamera(btn:)), for: .touchUpInside)
        self.view.addSubview(switCameraButton!)
        
        scanButton?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.view.snp.right)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.bottom.equalTo(self.view.snp.centerY).offset(-10)
        })

        backButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.bottom.equalTo(scanButton.snp.top).offset(-10)
        }
        
        
        torchButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(self.view.snp.centerY).offset(10)
        }
        
        switCameraButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(torchButton.snp.bottom).offset(10)
        }
        
        let rect = CGRect(x: 0, y: 64, width: 11*SCREENWIDTH/12.0 , height: 160)//SCREENHEIGHT-64-49
        
        displayTableView = UITableView(frame:rect, style: .plain)
        displayTableView?.backgroundColor = UIColor.clear
        displayTableView?.separatorStyle = UITableViewCellSeparatorStyle.none;

        displayTableView?.delegate = self
        displayTableView?.dataSource = self
        self.scanBackgoundView.addSubview(displayTableView!)
        
        
       
    }
    
    func commoninit(){
        
        previousRow = 9
        
        // 初始化数组
        dataArray = NSMutableArray()
        
        // 初始化数据管理
        dbManager = DataBase()
        
        //设置输出视频的质量
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        let input:AVCaptureDeviceInput
        
        //创建媒体输出流
        let output = AVCaptureMetadataOutput()
        
        //捕捉异常
        do {
            
            input = try AVCaptureDeviceInput(device: captureDevice)
            
            //把输入流添加到对话
            if captureSession.canAddInput(input){
                captureSession.addInput(input)
            }
            
            //把输出流添加到对话
            if captureSession.canAddOutput(output){
                captureSession.addOutput(output)
            }
            
        } catch {
            print("异常")
        }
        
        //创建串行队列
        let dispatchQueue = DispatchQueue(label: "queue")
        
        //设置输出流的代理
        output.setMetadataObjectsDelegate(self , queue: dispatchQueue)
        
        //设置输出媒体的数据类型
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode,
                                      AVMetadataObjectTypeEAN13Code,
                                      AVMetadataObjectTypeEAN8Code,
                                      AVMetadataObjectTypeCode128Code]
        //创建预览图层
        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        //设置预览层的填充方式
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        //设置预览图层的frame
        videoPreviewLayer?.frame = scanBackgoundView.bounds
        
        //将预览图层添加到预览试图上
        scanBackgoundView.layer.insertSublayer(videoPreviewLayer!, at: 0)
        
        //设置扫描范围
        output.rectOfInterest = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        
    }
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        addTimer()
        self.view.addSubview(scanBackgoundView)
    }
    
    // MARK: - 切换扫描状态事件
    func stopScanButtonAction(button:UIButton){
        if button.isSelected{
            timer?.resume()
            startScan()
        }else{
            timer?.suspend()
            stopScan()
        }
        button.isSelected = !button.isSelected
    }
    
    // MARK: - 切换摄像头
    func swapCamera(btn:UIButton){
        
        btn.isSelected = !btn.isSelected
        ///确保对话已经开始
        let inputs:[AVCaptureDeviceInput] = self.captureSession.inputs as! [AVCaptureDeviceInput]
        
        for input in inputs{
            let device = input.device
            if let device = device{
                if device.hasMediaType(AVMediaTypeVideo){
                    let position:AVCaptureDevicePosition = device.position
                    var newCamera:AVCaptureDevice?
                    var newInput:AVCaptureDeviceInput?
                    
                    if position == .front{
                        newCamera = cameramPosition(position: .back)
                    }else{
                        newCamera = cameramPosition(position: .front)
                    }
                    
                    newInput = try! AVCaptureDeviceInput(device: newCamera)
                    
                    self.captureSession.beginConfiguration()
                    self.captureSession.removeInput(input)
                    self.captureSession.addInput(newInput)
                    self.captureSession.commitConfiguration()
                    
                    break;
                }
            }
        }
    }
    
    func cameramPosition(position:AVCaptureDevicePosition)->AVCaptureDevice?{
        let array:[AVCaptureDevice] = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as! [AVCaptureDevice]
        for device:AVCaptureDevice in array {
            if device.position == position{
                return device
            }
        }
        return nil
    }
    
    // MARK: - 打开或者关闭闪光灯
    func turnTorch(btn:UIButton){
        
        let device = self.captureDevice
        //设置前先锁定
        try! device?.lockForConfiguration()
        
        //判断是否有闪光灯
        let  isHasFlash = hasFlash()
        
        if isHasFlash{
            btn.isSelected = !btn.isSelected
            if device?.flashMode == .on {
                device?.torchMode = AVCaptureTorchMode.off
                device?.flashMode = AVCaptureFlashMode.off
            }else if device?.flashMode == .off{
                device?.torchMode = AVCaptureTorchMode.on
                device?.flashMode = AVCaptureFlashMode.on
            }
        }else{
            //MARK: - 设置没有闪光灯的情况
            
        }
        device?.unlockForConfiguration()
    }
    
    ///检测是否有闪光灯
    func hasFlash()->Bool{
        return (self.captureDevice?.hasFlash)!
    }
    
    /// 开始扫描
    func startScan(){
        if !captureSession.isRunning{
            captureSession.startRunning()
        }
    }
    
    /// 停止扫描
    func stopScan(){
        if captureSession.isRunning{
            captureSession.stopRunning()
        }
    }
    
    //MARK: - 播放 滴 声音
    func playSound(){
        let path = Bundle.main.path(forResource: "tip", ofType: "wav")
        if path != nil {
            let url = URL(fileURLWithPath: path!)
            AudioServicesCreateSystemSoundID(url as CFURL ,&tip_sound_id)
            AudioServicesPlaySystemSound(tip_sound_id)
        }
    }
    
    // MARK: - 返回到上一层
    func backToCameraCanView(){
        lastVC!.dataArray = self.dataArray
        self.drawer?.repleaceCenterViewControllerWithViewController(lastVC!)
    }

    
    // MARK: - 刷新表
    func refreshTableviewOnMain(){
        DispatchQueue.main.async(execute: {
            
            self.displayTableView?.reloadData()
            if self.dataArray.count>2{
                let indexPath = IndexPath(row: self.dataArray.count-1, section: 0)
                self.displayTableView?.scrollToRow(at: indexPath, at: .none, animated: true)
            }            
        })
    }
    
    //加载扫描条码的商品的详细信息
    func loadDataFromDataBase(barcode:String){
        
        var fileDataModel :FileDataModel;
        fileDataModel =  dbManager.recodeWithBarcode(barcode);
        
        if fileDataModel.skuCode != nil{
            if !isDataExistInDataArray(fileDataModel){
                self.addOneForCountQty(fileDataModel);
                let temVrianceQty = (fileDataModel.onhandQty?.integerValue)! - (fileDataModel.countQty?.integerValue)!
                fileDataModel.varianceQty = "\(temVrianceQty)" as NSString?
                self.dataArray.add(fileDataModel)
                self.dbManager.updateFileData(fileDataModel)
            }
        }else{
            //该条码不存在，在数据库新增记录
            let tempFileDataModel:FileDataModel = FileDataModel();
            
            tempFileDataModel.barcode = barcode as NSString?;
            tempFileDataModel.skuCode = barcode as NSString?;
            tempFileDataModel.fileDate = getCurrentTime();
            tempFileDataModel.fileName = "Temporary name";
            tempFileDataModel.skuName = "SkuName";
            tempFileDataModel.onhandQty = "0";
            tempFileDataModel.countQty = "1";
            tempFileDataModel.varianceQty = "-1";
            self.setLatestFileName(tempFileDataModel.fileName!);
            self.dataArray.add(tempFileDataModel);
            self.dbManager.addFileData(tempFileDataModel);
            //self.updateTopViewLabels(tempFileDataModel);
        }
        refreshTableviewOnMain()
        
    }
    
    /**
     存储在NSUserDefault中
     
     - parameter fileName: 最后导入文件的名字
     */
    
    func setLatestFileName(_ fileName:NSString){
        
        let defaults:UserDefaults = UserDefaults();
        defaults.setValue(fileName, forKey: "DefaultsFileName");
        defaults.synchronize();
        
    }
    
    /**
     fileDataMode 是否在数据源中存在
     
     - parameter fileDataModel: 需要检测的模型
     
     - returns: true 存在->调用加一  false 不存在
     */
    
    func isDataExistInDataArray(_ fileDataModel:FileDataModel)->Bool{
        if self.dataArray.count>0{
            //   for var indext = 0;indext < self.dataArray.count ; indext = indext + 1{
            for indext in 0 ..< self.dataArray.count {
                let model:FileDataModel = self.dataArray[indext] as! FileDataModel;
                if model.barcode == fileDataModel.barcode{
                    self.addOneForCountQty(model);
                    let temVrianceQty = (model.onhandQty?.integerValue)! - (model.countQty?.integerValue)!;
                    model.varianceQty = "\(temVrianceQty)" as NSString?;
                    //如果存在更新到数据库
                    self.dbManager.updateFileData(model);
                    return true
                }
            }
        }
        return false;
    }
    
    /**
     加一
     */
    
    func addOneForCountQty(_ fileDataModel:FileDataModel){
        let temNum = (fileDataModel.countQty?.integerValue)! + 1;
        fileDataModel.countQty = "\(temNum)" as NSString?;
    }
    
    
    /**
     获取当前时间
     
     - returns: 时间的字符串
     */
    
    func getCurrentTime()->NSString{
        let date:Date = Date();
        let dateFormate:DateFormatter = DateFormatter();
        dateFormate.dateStyle = DateFormatter.Style.none;
        dateFormate.timeStyle = DateFormatter.Style.none;
        dateFormate.locale = Locale.current;
        dateFormate.dateFormat = "dd-MMM-yyyy HH:mm";
        let   timeString = dateFormate.string(from: date);
        return timeString as NSString;
    }
    
    //MARK: - AVCapture Delegate
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count > 0 {
            let metaData : AVMetadataMachineReadableCodeObject = metadataObjects.first as! AVMetadataMachineReadableCodeObject
            
            self.loadDataFromDataBase(barcode: metaData.stringValue!)
            
            refreshTableviewOnMain()
            playSound()
            stopScan()
        }
    }
    
    //MARK: - FOR Test
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //swapCamera()
        //turnTorch()
        // stopScanButtonAction()
       // backToCameraCanView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

