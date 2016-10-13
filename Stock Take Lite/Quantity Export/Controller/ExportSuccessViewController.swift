//
//  ExportSuccessViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 16/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class ExportSuccessViewController: BaseViewController,UIAlertViewDelegate,UITextFieldDelegate {
    
    var         exportSuccessView:                  ExportSuccessView!;
    var         fileDate:                           NSString!;
    var         skuNum:                             NSString!;
    var         dataArray:                          NSMutableArray!;
    var         dbManager:                          DataBase!;
    var         fileManager:                        NSFileManager!;
    var         filePath:                           NSString!;
    var         fileName:                           NSString!;
    var         server:                             FMServer!;
    var         succesed:                           Bool = false;
    var         ftpManager:                         FTPManager!;
    var         fileHandel:                         NSFileHandle!;
    var         exportAlertView:                    UIAlertView!;
  
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.checkFTPIsSetup();
        
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        dataArray = NSMutableArray();
        dbManager = DataBase();
        fileManager = NSFileManager.defaultManager();
       
        self.view.backgroundColor = UIColor.whiteColor();
        exportSuccessView = ExportSuccessView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.exportSuccessView.fileNameTextField.delegate = self
        self.view.addSubview(exportSuccessView);
        self.updataPromptLabel();
        self.loadDataFromDataBase();
        self.updateTotalLabel();
        self.addButtonAction();
       // self.checkFTPIsSetup();

    }
    
    func checkFTPIsSetup(){
        let currentFTP = CurrentFTP.current();
        if currentFTP.ftpServer == nil{
             exportAlertView = UIAlertView(title: localString("warning"), message: localString("imSetFTPServer"), delegate: self, cancelButtonTitle: localString("ok"));
            exportAlertView.show();
           // self.view.addSubview(exportAlertView);
        }else{
            initFTPServer();
        }
    }
    
    func initFTPServer(){
        let currentFTP = CurrentFTP.current();
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        ftpManager = FTPManager();
    }
    
    /**
    讲文件上传到服务器
    */
    
    func updateCSVFileToServer(){
        succesed = ftpManager.uploadFile(NSURL(string:self.filePath as String), toServer: server);
        if succesed {
            self.removeTempFile();
            self.performSelectorOnMainThread(#selector(ExportSuccessViewController.updateStatusLabelWithString(_:)), withObject: localString("exsExportSuccess") + " \(self.fileName)", waitUntilDone: true);
            self.performSelectorOnMainThread(#selector(ExportSuccessViewController.progressHUDHiden), withObject: nil, waitUntilDone: true);
        }else{
            self.removeTempFile();
            self.performSelectorOnMainThread(#selector(ExportSuccessViewController.updateStatusLabelWithString(_:)), withObject:localString("exsExportFailed") + " \(self.fileName)", waitUntilDone: true);
            self.performSelectorOnMainThread(#selector(ExportSuccessViewController.progressHUDHiden), withObject: nil, waitUntilDone: true);
        }
    }
    
    /**
    从数据库中读取需要导出的内容
    */
    
    func loadDataFromDataBase(){
        self.dataArray = dbManager.recodesWithDate(self.fileDate);
    }
    
    /**
    创建一个临时文件
    */
    
    func createTempCSVFile(){
        let temArray:NSMutableArray = NSMutableArray();
       // for var i = 0;i < self.dataArray.count; i = i+1{
        for i in 0..<self.dataArray.count{
            let fileDataModel:FileDataModel = self.dataArray[i] as! FileDataModel;
            let str = "\(fileDataModel.skuName!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),\(fileDataModel.skuCode!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),\(fileDataModel.onhandQty!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),\(fileDataModel.countQty!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),\(fileDataModel.varianceQty!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),\(fileDataModel.barcode!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))";
            temArray.addObject(str);
        }
        let temStr = temArray.componentsJoinedByString("\n");
        let fileData:NSData = temStr.dataUsingEncoding(NSUTF16StringEncoding)!;
        self.filePath = CSVFILEPATH.stringByAppendingString("/\(self.fileName!)");
        if  !fileManager.fileExistsAtPath(self.filePath as String){
            self.fileManager.createFileAtPath(self.filePath as String, contents: fileData, attributes: nil);
        }
        self.updateCSVFileToServer();
    }
    
    /**
    将临时文件删除
    */
    
    func removeTempFile(){
        try! self.fileManager.removeItemAtPath(self.filePath as String);
    }
    
    /**
    更新提示标签,有关服务器的标签
    */
    
    func updataPromptLabel(){
        self.exportSuccessView.dateTextLabel.text = self.fileDate as String;
        self.exportSuccessView.numberOfSKUTextLabel.text = self.skuNum as String;
        let currentftp = CurrentFTP.current();
        if currentftp.ftpServer != nil {
            self.exportSuccessView.ftpServerTextLabel.text = currentftp.ftpServer as String;
            self.exportSuccessView.ftpUserTextLabel.text = currentftp.ftpUser as String;
        }else{
            self.updateStatusLabelWithString(localString("aexprortPrompt"))
        }
    }
    
    func updateStatusLabelWithString(string :String){
        self.exportSuccessView.exportStateLabel.text = localString(string) ;
    }
    
    /**
    更新提示标签内容,总数量的标签
    */
    
    func updateTotalLabel(){
        var temOhand:Float = 0;
        var temCounted:Float = 0.0;
        var variance:Float = 0.0;
        for i in 0 ..< self.dataArray.count {
            let fileModel:FileDataModel = self.dataArray[i] as! FileDataModel;
            temOhand = Float(temOhand) + Float((fileModel.onhandQty?.floatValue)!);
            temCounted = Float(temCounted) + Float((fileModel.countQty?.floatValue)!);
            variance = Float(variance) + Float((fileModel.varianceQty?.floatValue)!);
        }
        
        self.exportSuccessView.onhandQtyTextLabel.text = String(format: "%0.2f", arguments: [temOhand]);
        self.exportSuccessView.countedQtyTextLabel.text = String(format: "%0.2f", arguments: [temCounted]);
        self.exportSuccessView.varianceQtyTextLabel.text = String(format: "%0.2f", arguments: [variance]);
    }
    
    // MARK: - ButtonAction
    
    func addButtonAction(){
        
        self.exportSuccessView.exprotButton.addTarget(self, action: #selector(ExportSuccessViewController.exprotButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.exportSuccessView.returnButton.addTarget(self, action: #selector(ExportSuccessViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.exportSuccessView.logoutButton.addTarget(self, action: #selector(ExportSuccessViewController.logoutAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    /**
    导出文件事件处理
    */
    
    func exprotButtonAction(){
        if self.exportSuccessView.fileNameTextField.text != ""{
            self.fileName = self.exportSuccessView.fileNameTextField.text?.stringByAppendingString(".csv");
            MBProgressHUD.showHUDAddedTo(self.view , animated: true);
            self.performSelectorInBackground(#selector(ExportSuccessViewController.createTempCSVFile), withObject: nil);
        }else{
            self.createAlertView(localString("warning"), message: localString("inputfileName"))
        }
        
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current();
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    /**
    停止转动
    */
    
    func progressHUDHiden(){
        MBProgressHUD.hideHUDForView(self.view , animated: true);
    }
    
    func returnButtonAction(){
        let quantityVC = QuantityExportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantityVC);
    }
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView == exportAlertView{
            let ftpServerVC = FTPServerConnectionViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(ftpServerVC);
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if DEVICE == .Phone{
            self.showAnimation()
        }
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if DEVICE == .Phone{
            self.hiddenAnimation()
        }
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if DEVICE == .Phone{
            self.hiddenAnimation()
        }
        return true
    }
    
    override func showAnimation() {
        UIView.animateWithDuration(0.25) { 
            self.view.frame = CGRectMake(0, -100, SCREENWIDTH, SCREENHEIGHT)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
