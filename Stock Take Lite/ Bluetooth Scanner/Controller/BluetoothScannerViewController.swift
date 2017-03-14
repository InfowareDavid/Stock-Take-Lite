//
//  BluetoothScannerViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 4/12/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class BluetoothScannerViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    var         bluetoothView:              BluetoothScannerView!;
    var         dataArray:                  NSMutableArray!;//tableView的数据源
    var         barcodeString:              NSString!;//扫描设备得到的条码字符串
    var         barcodeArray:               NSMutableArray!;
    var         dbManager:                  DataBase!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 6;
        self.barcodeString = "";
        dataArray = NSMutableArray();
        barcodeArray = NSMutableArray();
        dbManager = DataBase();
        self.view.backgroundColor = UIColor.white;
        bluetoothView = BluetoothScannerView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.bluetoothView.tableView.delegate = self;
        self.bluetoothView.tableView.dataSource = self;
        self.bluetoothView.barcodeTextFiled.delegate = self;
        self.view.addSubview(bluetoothView);
        self.addButtonActions();
    }
    
    /**
    为按钮添加处理事件
    */
    
    func addButtonActions(){
        self.bluetoothView.saveButton.addTarget(self, action: #selector(BluetoothScannerViewController.saveAction), for: UIControlEvents.touchUpInside);
        self.bluetoothView.returnButton.addTarget(self, action: #selector(BluetoothScannerViewController.returnAction), for: UIControlEvents.touchUpInside);
        self.bluetoothView.logoutButton.addTarget(self, action: #selector(BluetoothScannerViewController.logoutAction), for: UIControlEvents.touchUpInside);
    }
    
    /**
    保存的处理事件
    */
    
    func saveAction(){
        self.view.endEditing(true);
        MBProgressHUD.showAdded(to: self.view, animated: true);
        self.performSelector(inBackground: #selector(BluetoothScannerViewController.updateDataToDataBase), with: nil);
        MBProgressHUD.hide(for: self.view, animated: true);
    }
    
    /**
    返回的处理事件
    */
    
    func returnAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    /**
    退出的处理事件
    */
    
    func logoutAction(){
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
    }
    
    /**
    将数据更新到数据库中
    */
    
    func updateDataToDataBase(){
        //for var indext = 0; indext < self.dataArray.count; indext = indext + 1{
            for indext in 0 ..< self.dataArray.count{
            let fileDataModel:FileDataModel = self.dataArray[indext] as! FileDataModel;
            fileDataModel.fileDate = self.getCurrentTime();
            self.dbManager.updateFileData(fileDataModel);
        }
    }
    
    //加载扫描条码的商品的详细信息
    
    func loadDataFromDataBaseWithBarcode(_ barcode:String){
        var fileDataModel :FileDataModel;
       fileDataModel =  dbManager.recodeWithBarcode(barcode);
        if fileDataModel.skuCode != nil{
            if !isDataExistInDataArray(fileDataModel){
                self.addOneForCountQty(fileDataModel);
                let temVrianceQty = (fileDataModel.onhandQty?.integerValue)! - (fileDataModel.countQty?.integerValue)!;
                fileDataModel.varianceQty = "\(temVrianceQty)" as NSString?;
                self.dataArray.add(fileDataModel);
            }
            self.updateTopViewLabels(fileDataModel);
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
            self.updateTopViewLabels(tempFileDataModel);
        }
        self.bluetoothView.tableView.reloadData();
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
    更新当前的标签
    */
    //MARK: - 考虑若没有这个条码的情况
    
    func updateTopViewLabels(_ fileDataModel:FileDataModel){
        
        var         onhandQty = 0;
        var         countQty = 0;
        var         varianceQty = 0;

        self.bluetoothView.fileNameTextLabel.text = fileDataModel.fileName as? String;
        let contentArray:NSMutableArray = self.dbManager.contentWithFileName(fileDataModel.fileName!);
        self.bluetoothView.skuNumberTextLabel.text = "\(contentArray.count)";
       
       // for var index = 0; index < self.dataArray.count; index = index + 1{
            for index in 0 ..< self.dataArray.count{
            let model:FileDataModel = self.dataArray[index] as! FileDataModel;
            print("\(model.skuCode)---\(model.countQty)");
            onhandQty = onhandQty + (model.onhandQty?.integerValue)!;
            countQty = countQty + (model.countQty?.integerValue)!;
            varianceQty = onhandQty - countQty;
            self.bluetoothView.onhandTotalLabel.text = "\(onhandQty)";
            self.bluetoothView.countTotalLabel.text = "\(countQty)";
            self.bluetoothView.varianceTotalLabel.text = "\(varianceQty)";

        }
        
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

    //MARK:- TableView代理
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :BluetoothScannerCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? BluetoothScannerCell;
        if cell == nil {
            cell = BluetoothScannerCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[(indexPath as NSIndexPath).row] as! FileDataModel;
        
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyLabel.text = fileModel.countQty as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
        return cell!;

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }

    //MARK:- TextField代理
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "\n" {
            let str = self.barcodeString;
            if str != ""{
                self.barcodeArray.add(str as Any);
            }
            if self.barcodeArray.count != 0{
                self.loadDataFromDataBaseWithBarcode(self.barcodeArray.lastObject as! String);
                //textField只显示当前条码
                textField.text = self.barcodeArray.lastObject as? String;
            }
            print(self.barcodeArray);

            self.barcodeString = "";
        }else{
            self.barcodeString = self.barcodeString.appending(string) as NSString!;
            
        }
        return true;
    }
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if textField.text != ""{
//            self.barcodeArray.addObject(<#T##anObject: AnyObject##AnyObject#>)
//            
//        }
//        
//        return true
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
