//
//  QuantityImportViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityImportViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate {
    
    var     quantityImportView:                     QuantityImportView!;
    var     dataArray:                              NSArray!;
    var     server:                                 FMServer!;
    var     manager:                                FTPManager!;
    var     successed:                              Bool = false;
    var     currentIndexPath:                       IndexPath!;
    var     isSelectedIndexPath:                    Bool = false;
    var     quantityAlertView:                              UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 1;
        self.view.backgroundColor = UIColor.white;
        dataArray = NSArray();
        quantityAlertView = UIAlertView(title: localString("warning"), message: localString("imSetFTPServer"), delegate: self, cancelButtonTitle: localString("ok"));
        currentIndexPath = IndexPath();
        quantityImportView = QuantityImportView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        quantityImportView.tableView.delegate = self;
        quantityImportView.tableView.dataSource = self;
        quantityImportView.tableView.reloadData();
        self.view.addSubview(quantityImportView);
        self.checkFTPIsSetup();
        self.addButtonActions();
    }
    
    func checkFTPIsSetup(){
        let currentFTP = CurrentFTP.current;
        if currentFTP.ftpServer == nil{
            quantityAlertView.show();
            self.view.addSubview(quantityAlertView);
        }else{
            self.setupFTP();
            self.setupFTPLabelName();
            MBProgressHUD.showAdded(to: self.view , animated: true);
            self.performSelector(inBackground: #selector(QuantityImportViewController.loadData), with: nil);
        }
    }
    
    func setupFTP(){
        let currentFTP = CurrentFTP.current;
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        manager = FTPManager();
    }
    
    func loadData(){
        dataArray = manager.contents(of: server) as NSArray!;
        self.performSelector(onMainThread: #selector(QuantityImportViewController.reloadMyTableView), with: nil, waitUntilDone: true);
    }
    
    func reloadMyTableView(){
        MBProgressHUD.hide(for: self.view , animated: true);
        if dataArray == nil{
            self.quantityImportView.promptLabel.text = localString("imprompt");
        }
        self.quantityImportView.tableView.reloadData();
    }
    
    func setupFTPLabelName(){
        
        let currentFTP = CurrentFTP.current;
        self.quantityImportView.ftpServerTextLabel.text = currentFTP.ftpServer as String;
        self.quantityImportView.ftpUserTextLabel.text = currentFTP.ftpUser as String;
        
    }
    
    //    func getCurrentFTP(){
    //        let currentFTP = CurrentFTP.current();
    //        currentFTP.ftpServer = "ns1.infoware.com.hk";
    //        currentFTP.ftpUser = "crmlite";
    //        currentFTP.ftpPassword = "FTP@dHe2015";
    //    }
    
    func addButtonActions(){
        
        self.quantityImportView.okButton.addTarget(self, action: #selector(QuantityImportViewController.okButtonAction), for: UIControlEvents.touchUpInside);
        
        self.quantityImportView.returnButton.addTarget(self, action: #selector(QuantityImportViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
    }
    
    func okButtonAction(){
        if isSelectedIndexPath {
            let arr:Array = dataArray as Array
            let dic = arr[currentIndexPath.row]
            let dicstr = dic["kCFFTPResourceName"]as!String
            let fileName:NSString = dicstr as NSString
            
            //let fileName:NSString = dataArray[currentIndexPath.row]["kCFFTPResourceName"] as! NSString;
            self.setLatestFileName(fileName);
            
            let successVC = ImportSuccessViewController();
            successVC.server = self.server;
            successVC.downloadFileName = fileName;
            self.drawer?.repleaceCenterViewControllerWithViewController(successVC);
        }else{
            self.createAlertView(localString("warning"), message: localString("inchoose"));
        }
        
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
    
    func returnButtonAction(){
        
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :QuantityImportTableViewCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? QuantityImportTableViewCell;
        if cell == nil {
            cell = QuantityImportTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        let arr:Array = dataArray as Array
        let dic = arr[(indexPath as NSIndexPath).row]
        let dicstr = dic["kCFFTPResourceName"]as!String
        let fileName:NSString = dicstr as NSString
        cell?.fileNameLabel.text = fileName as String
       // cell?.fileNameLabel.text = dataArray[(indexPath as NSIndexPath).row]["kCFFTPResourceName"] as? String;
        let dateFromFTP = dic["kCFFTPResourceModDate"] as! Date
        let date:Date  = dateFromFTP
        //let date:Date = dataArray[(indexPath as NSIndexPath).row]["kCFFTPResourceModDate"] as! Date;
        print("\(date)")
        let dataFromate:DateFormatter = DateFormatter();
        dataFromate.dateStyle = DateFormatter.Style.none;
        dataFromate.timeStyle = DateFormatter.Style.none;
        dataFromate.locale = Locale.current;
        
        let zone:TimeZone = TimeZone(identifier: "UTC")!;
        dataFromate.timeZone = zone;
        dataFromate.dateFormat = "dd-MMM-yyyy HH:mm";
        dataFromate.string(from: date);
        cell?.fileTimeLabel.text = dataFromate.string(from: date);
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArray == nil{
            return 0;
        }
        return dataArray.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isSelectedIndexPath = true;
        currentIndexPath = indexPath;
        
    }
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if alertView == self.quantityAlertView{
            let ftpServerVC = FTPServerConnectionViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(ftpServerVC);
        }
    }
    
}
