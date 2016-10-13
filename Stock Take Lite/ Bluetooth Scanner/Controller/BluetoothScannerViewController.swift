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
        self.view.backgroundColor = UIColor.whiteColor();
        bluetoothView = BluetoothScannerView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
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
        self.bluetoothView.saveButton.addTarget(self, action: #selector(BluetoothScannerViewController.saveAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.bluetoothView.returnButton.addTarget(self, action: #selector(BluetoothScannerViewController.returnAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.bluetoothView.logoutButton.addTarget(self, action: #selector(BluetoothScannerViewController.logoutAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    /**
    保存的处理事件
    */
    
    func saveAction(){
        self.view.endEditing(true);
        MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        self.performSelectorInBackground(#selector(BluetoothScannerViewController.updateDataToDataBase), withObject: nil);
        MBProgressHUD.hideHUDForView(self.view, animated: true);
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
        let currentUser:CurrentUser = CurrentUser.current();
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
    }
    
    /**
    将数据更新到数据库中
    */
    
    func updateDataToDataBase(){
        for var indext = 0; indext < self.dataArray.count; indext = indext + 1{
            let fileDataModel:FileDataModel = self.dataArray[indext] as! FileDataModel;
            fileDataModel.fileDate = self.getCurrentTime();
            self.dbManager.updateFileData(fileDataModel);
        }
    }
    
    //加载扫描条码的商品的详细信息
    
    func loadDataFromDataBaseWithBarcode(barcode:String){
        var fileDataModel :FileDataModel;
       fileDataModel =  dbManager.recodeWithBarcode(barcode);
        if fileDataModel.skuCode != nil{
            if !isDataExistInDataArray(fileDataModel){
                self.addOneForCountQty(fileDataModel);
                let temVrianceQty = (fileDataModel.onhandQty?.integerValue)! - (fileDataModel.countQty?.integerValue)!;
                fileDataModel.varianceQty = "\(temVrianceQty)";
                self.dataArray.addObject(fileDataModel);
            }
            self.updateTopViewLabels(fileDataModel);
        }else{
            //该条码不存在，在数据库新增记录
            let tempFileDataModel:FileDataModel = FileDataModel();
            
            tempFileDataModel.barcode = barcode;
            tempFileDataModel.skuCode = barcode;
            tempFileDataModel.fileDate = getCurrentTime();
            tempFileDataModel.fileName = "Temporary name";
            tempFileDataModel.skuName = "SkuName";
            tempFileDataModel.onhandQty = "0";
            tempFileDataModel.countQty = "1";
            tempFileDataModel.varianceQty = "-1";
            self.setLatestFileName(tempFileDataModel.fileName!);
            self.dataArray.addObject(tempFileDataModel);
            self.dbManager.addFileData(tempFileDataModel);
            self.updateTopViewLabels(tempFileDataModel);
        }
        self.bluetoothView.tableView.reloadData();
    }
    
    /**
    存储在NSUserDefault中
    
    - parameter fileName: 最后导入文件的名字
    */
    
    func setLatestFileName(fileName:NSString){
        
        let defaults:NSUserDefaults = NSUserDefaults();
        defaults.setValue(fileName, forKey: "DefaultsFileName");
        defaults.synchronize();
        
    }
    
    /**
    fileDataMode 是否在数据源中存在
    
    - parameter fileDataModel: 需要检测的模型
    
    - returns: true 存在->调用加一  false 不存在
    */
    
    func isDataExistInDataArray(fileDataModel:FileDataModel)->Bool{
        if self.dataArray.count>0{
            for var indext = 0;indext < self.dataArray.count ; indext = indext + 1{
                let model:FileDataModel = self.dataArray[indext] as! FileDataModel;
                if model.barcode == fileDataModel.barcode{
                     self.addOneForCountQty(model);
                    let temVrianceQty = (model.onhandQty?.integerValue)! - (model.countQty?.integerValue)!;
                    model.varianceQty = "\(temVrianceQty)";
                    return true
                }
            }
        }
                return false;
    }
    
    /**
        加一
    */
    
    func addOneForCountQty(fileDataModel:FileDataModel){
        let temNum = (fileDataModel.countQty?.integerValue)! + 1;
        fileDataModel.countQty = "\(temNum)";
    }
    
    /**
    更新当前的标签
    */
    //MARK: - 考虑若没有这个条码的情况
    
    func updateTopViewLabels(fileDataModel:FileDataModel){
        
        var         onhandQty = 0;
        var         countQty = 0;
        var         varianceQty = 0;

        self.bluetoothView.fileNameTextLabel.text = fileDataModel.fileName as? String;
        let contentArray:NSMutableArray = self.dbManager.contentWithFileName(fileDataModel.fileName!);
        self.bluetoothView.skuNumberTextLabel.text = "\(contentArray.count)";
       
        for var index = 0; index < self.dataArray.count; index = index + 1{
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
        let date:NSDate = NSDate();
        let dateFormate:NSDateFormatter = NSDateFormatter();
        dateFormate.dateStyle = NSDateFormatterStyle.NoStyle;
        dateFormate.timeStyle = NSDateFormatterStyle.NoStyle;
        dateFormate.locale = NSLocale.currentLocale();
        dateFormate.dateFormat = "dd-MMM-yyyy HH:mm";
        let   timeString = dateFormate.stringFromDate(date);
        return timeString;
    }

    //MARK:- TableView代理
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :BluetoothScannerCell?;
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? BluetoothScannerCell;
        if cell == nil {
            cell = BluetoothScannerCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[indexPath.row] as! FileDataModel;
        
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyLabel.text = fileModel.countQty as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
        return cell!;

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if DEVICE == .Phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }

    //MARK:- TextField代理
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string == "\n" {
            let str = self.barcodeString;
            if str != ""{
                self.barcodeArray.addObject(str);
            }
            if self.barcodeArray.count != 0{
                self.loadDataFromDataBaseWithBarcode(self.barcodeArray.lastObject as! String);
                //textField只显示当前条码
                textField.text = self.barcodeArray.lastObject as? String;
            }
            print(self.barcodeArray);

            self.barcodeString = "";
        }else{
            self.barcodeString = self.barcodeString.stringByAppendingString(string);
            
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
