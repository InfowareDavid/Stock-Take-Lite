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
    var     currentIndexPath:                       NSIndexPath!;
    var     isSelectedIndexPath:                    Bool = false;
    var     quantityAlertView:                              UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 1;
        self.view.backgroundColor = UIColor.whiteColor();
        dataArray = NSArray();
        quantityAlertView = UIAlertView(title: localString("warning"), message: localString("imSetFTPServer"), delegate: self, cancelButtonTitle: localString("ok"));
        currentIndexPath = NSIndexPath();
        quantityImportView = QuantityImportView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        quantityImportView.tableView.delegate = self;
        quantityImportView.tableView.dataSource = self;
        quantityImportView.tableView.reloadData();
        self.view.addSubview(quantityImportView);
        self.checkFTPIsSetup();
        self.addButtonActions();
    }
    
    func checkFTPIsSetup(){
        let currentFTP = CurrentFTP.current();
        if currentFTP.ftpServer == nil{
            quantityAlertView.show();
            self.view.addSubview(quantityAlertView);
        }else{
            self.setupFTP();
            self.setupFTPLabelName();
            MBProgressHUD.showHUDAddedTo(self.view , animated: true);
            self.performSelectorInBackground(#selector(QuantityImportViewController.loadData), withObject: nil);
        }
    }
    
    func setupFTP(){
        let currentFTP = CurrentFTP.current();
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        manager = FTPManager();
    }
    
    func loadData(){
        dataArray = manager.contentsOfServer(server);
        self.performSelectorOnMainThread(#selector(QuantityImportViewController.reloadMyTableView), withObject: nil, waitUntilDone: true);
    }
    
    func reloadMyTableView(){
        MBProgressHUD.hideHUDForView(self.view , animated: true);
        if dataArray == nil{
            self.quantityImportView.promptLabel.text = localString("imprompt");
        }
        self.quantityImportView.tableView.reloadData();
    }
    
    func setupFTPLabelName(){
        
        let currentFTP = CurrentFTP.current();
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
        
        self.quantityImportView.okButton.addTarget(self, action: #selector(QuantityImportViewController.okButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        
        self.quantityImportView.returnButton.addTarget(self, action: #selector(QuantityImportViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func okButtonAction(){
        if isSelectedIndexPath {
            let fileName:NSString = dataArray[currentIndexPath.row]["kCFFTPResourceName"] as! NSString;
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
    
    func setLatestFileName(fileName:NSString){
        
        let defaults:NSUserDefaults = NSUserDefaults();
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :QuantityImportTableViewCell?;
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? QuantityImportTableViewCell;
        if cell == nil {
            cell = QuantityImportTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        cell?.fileNameLabel.text = dataArray[indexPath.row]["kCFFTPResourceName"] as? String;
        let date:NSDate = dataArray[indexPath.row]["kCFFTPResourceModDate"] as! NSDate;
        print("\(date)")
        let dataFromate:NSDateFormatter = NSDateFormatter();
        dataFromate.dateStyle = NSDateFormatterStyle.NoStyle;
        dataFromate.timeStyle = NSDateFormatterStyle.NoStyle;
        dataFromate.locale = NSLocale.currentLocale();
        
        let zone:NSTimeZone = NSTimeZone(name: "UTC")!;
        dataFromate.timeZone = zone;
        dataFromate.dateFormat = "dd-MMM-yyyy HH:mm";
        dataFromate.stringFromDate(date);
        cell?.fileTimeLabel.text = dataFromate.stringFromDate(date);
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArray == nil{
            return 0;
        }
        return dataArray.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if DEVICE == .Phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        isSelectedIndexPath = true;
        currentIndexPath = indexPath;
        
    }
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView == self.quantityAlertView{
            let ftpServerVC = FTPServerConnectionViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(ftpServerVC);
        }
    }
    
}
