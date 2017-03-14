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
    var         fileManager:                        FileManager!;
    var         filePath:                           NSString!;
    var         fileName:                           NSString!;
    var         server:                             FMServer!;
    var         succesed:                           Bool = false;
    var         ftpManager:                         FTPManager!;
    var         fileHandel:                         FileHandle!;
    var         exportAlertView:                    UIAlertView!;
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.checkFTPIsSetup();
        
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        dataArray = NSMutableArray();
        dbManager = DataBase();
        fileManager = FileManager.default;
       
        self.view.backgroundColor = UIColor.white;
        exportSuccessView = ExportSuccessView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.exportSuccessView.fileNameTextField.delegate = self
        self.view.addSubview(exportSuccessView);
        self.updataPromptLabel();
        self.loadDataFromDataBase();
        self.updateTotalLabel();
        self.addButtonAction();
       // self.checkFTPIsSetup();

    }
    
    func checkFTPIsSetup(){
        let currentFTP = CurrentFTP.current;
        if currentFTP.ftpServer == nil{
             exportAlertView = UIAlertView(title: localString("warning"), message: localString("imSetFTPServer"), delegate: self, cancelButtonTitle: localString("ok"));
            exportAlertView.show();
           // self.view.addSubview(exportAlertView);
        }else{
            initFTPServer();
        }
    }
    
    func initFTPServer(){
        let currentFTP = CurrentFTP.current;
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        ftpManager = FTPManager();
    }
    
    /**
    讲文件上传到服务器
    */
    
    func updateCSVFileToServer(){
        succesed = ftpManager.uploadFile(URL(string:self.filePath as String), to: server);
        if succesed {
            self.removeTempFile();
            self.performSelector(onMainThread: #selector(ExportSuccessViewController.updateStatusLabelWithString(_:)), with: localString("exsExportSuccess") + " \(self.fileName!)", waitUntilDone: true);
            self.performSelector(onMainThread: #selector(ExportSuccessViewController.progressHUDHiden), with: nil, waitUntilDone: true);
        }else{
            self.removeTempFile();
            self.performSelector(onMainThread: #selector(ExportSuccessViewController.updateStatusLabelWithString(_:)), with:localString("exsExportFailed") + " \(self.fileName!)", waitUntilDone: true);
            self.performSelector(onMainThread: #selector(ExportSuccessViewController.progressHUDHiden), with: nil, waitUntilDone: true);
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
            let str = "\(fileDataModel.skuName!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)),\(fileDataModel.skuCode!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)),\(fileDataModel.onhandQty!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)),\(fileDataModel.countQty!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)),\(fileDataModel.varianceQty!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)),\(fileDataModel.barcode!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))";
            temArray.add(str);
        }
        let temStr = temArray.componentsJoined(by: "\n");
        let fileData:Data = temStr.data(using: String.Encoding.utf16)!;
        let string = CSVFILEPATH + "/\(self.fileName!)"
        self.filePath = string as NSString!
        if  !fileManager.fileExists(atPath: self.filePath as String){
            self.fileManager.createFile(atPath: self.filePath as String, contents: fileData, attributes: nil);
        }
        self.updateCSVFileToServer();
    }
    
    /**
    将临时文件删除
    */
    
    func removeTempFile(){
        try! self.fileManager.removeItem(atPath: self.filePath as String);
    }
    
    /**
    更新提示标签,有关服务器的标签
    */
    
    func updataPromptLabel(){
        self.exportSuccessView.dateTextLabel.text = self.fileDate as String;
        self.exportSuccessView.numberOfSKUTextLabel.text = self.skuNum as String;
        let currentftp = CurrentFTP.current;
        if currentftp.ftpServer != nil {
            self.exportSuccessView.ftpServerTextLabel.text = currentftp.ftpServer as String;
            self.exportSuccessView.ftpUserTextLabel.text = currentftp.ftpUser as String;
        }else{
            self.updateStatusLabelWithString(localString("aexprortPrompt"))
        }
    }
    
    func updateStatusLabelWithString(_ string :String){
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
        
        self.exportSuccessView.exprotButton.addTarget(self, action: #selector(ExportSuccessViewController.exprotButtonAction), for: UIControlEvents.touchUpInside);
        self.exportSuccessView.returnButton.addTarget(self, action: #selector(ExportSuccessViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
        self.exportSuccessView.logoutButton.addTarget(self, action: #selector(ExportSuccessViewController.logoutAction), for: UIControlEvents.touchUpInside);
    }
    
    /**
    导出文件事件处理
    */
    
    func exprotButtonAction(){
        if self.exportSuccessView.fileNameTextField.text != ""{
            let string = (self.exportSuccessView.fileNameTextField.text!) + ".csv"
            self.fileName = string as NSString!
            MBProgressHUD.showAdded(to: self.view , animated: true);
            self.performSelector(inBackground: #selector(ExportSuccessViewController.createTempCSVFile), with: nil);
        }else{
            self.createAlertView(localString("warning"), message: localString("inputfileName"))
        }
        
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    /**
    停止转动
    */
    
    func progressHUDHiden(){
        MBProgressHUD.hide(for: self.view , animated: true);
    }
    
    func returnButtonAction(){
        let quantityVC = QuantityExportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantityVC);
    }
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if alertView == exportAlertView{
            let ftpServerVC = FTPServerConnectionViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(ftpServerVC);
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if DEVICE == .phone{
            self.showAnimation()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if DEVICE == .phone{
            self.hiddenAnimation()
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if DEVICE == .phone{
            self.hiddenAnimation()
        }
        return true
    }
    
    override func showAnimation() {
        UIView.animate(withDuration: 0.25, animations: { 
            self.view.frame = CGRect(x: 0, y: -100, width: SCREENWIDTH, height: SCREENHEIGHT)
        }) 
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
