//
//  CameraScanViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 17/12/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit
import AVFoundation

class CameraScanViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    /// 全部的UI界面
    var         cameraView:             CameraView!
    
    /// 数据源
    var         dataArray:              NSMutableArray!
    
    /// 库存总量
    var         onhandTotal:             Int = 0
    
    /// 盘点总量
    var         countTotal:             Int = 0
    
    /// 相差总量
    var         varianceTotal:          Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 7;
        dataArray = NSMutableArray();
        self.view.backgroundColor = UIColor.white;
        cameraView = CameraView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.cameraView.tableView.delegate = self;
        self.cameraView.tableView.dataSource = self;
        self.view.addSubview(cameraView);
        self.addButtonActions();
        self.cameraView.tableView.reloadData();
    }
    
    // MARK: - 更新顶部文件名
    func updateFileName(){
        let defaults:UserDefaults = UserDefaults();
        let defaultsfileName = defaults.object(forKey: "DefaultsFileName")
        if defaultsfileName != nil {
            if defaultsfileName as! String  != ""{
                self.cameraView.fileNameTextLabel.text = defaultsfileName as! String?
            }
        }
    }
    
    // MARK: - 更新SKU总量
    func updateSKUNumber(){
        if self.dataArray.count>0{
            self.cameraView.skuNumberTextLabel.text = "\(self.dataArray.count)"
        }else{
            self.cameraView.skuNumberTextLabel.text = "--"
        }
    }
    
    // MARK: - 计算底部总量展示
    func caculateTotleNumber(){
        for i in 0 ..< self.dataArray.count{
            let mode = self.dataArray[i] as! FileDataModel
            onhandTotal += (mode.onhandQty?.integerValue)!
            countTotal += (mode.countQty?.integerValue)!
        }
        
        varianceTotal = onhandTotal - countTotal
        
        self.cameraView.onhandTotalLabel.text = "\(onhandTotal)"
        self.cameraView.countTotalLabel.text = "\(countTotal)"
        self.cameraView.varianceTotalLabel.text = "\(varianceTotal)"
    }
    
    //MARK:- 添加按钮处理事件
    
    func addButtonActions(){
        self.cameraView.cameraButton.addTarget(self , action: #selector(cameraButtonAction), for: .touchUpInside)
        self.cameraView.returnButton.addTarget(self , action: #selector(returnButtonAction), for: .touchUpInside)
        self.cameraView.logoutButton.addTarget(self , action: #selector(logoutAction), for: .touchUpInside)
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    func returnButtonAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func cameraButtonAction(){
        let permission = cameraPermissions()
        if permission {
            let         scannerVC =             ScannerViewController()
            scannerVC.lastVC = self
            scannerVC.dataArray = self.dataArray
            self.drawer?.repleaceCenterViewControllerWithViewController(scannerVC)
        }else{
            //MARK: - 提示用户打开使用相机的权限
            
            let alertView = UIAlertController(title: "Prompt", message: "Turn on the camera's access permissions", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertView, animated: true, completion: nil )
            
            //let alertView = UIAlertController.creatAlertView(title: "Prompt", message: "Turn on the camera's access permissions", okAction:, cancelAction: <#T##UIAlertAction#>)
        }
        
    }
    
    //判断相机使用权限
    
    func cameraPermissions() -> Bool{
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if(authStatus == AVAuthorizationStatus.denied || authStatus == AVAuthorizationStatus.restricted) {
            return false
        }else {
            return true
        }
        
    }
    
    
    //MARK:- TableView代理
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :BluetoothScannerCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? BluetoothScannerCell;
        if cell == nil {
            cell = BluetoothScannerCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[indexPath.row] as! FileDataModel;
        
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyLabel.text = fileModel.countQty as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
        return cell!;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
        //return 2;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.cameraView.tableView.reloadData()
        updateFileName()
        updateSKUNumber()
        caculateTotleNumber()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
