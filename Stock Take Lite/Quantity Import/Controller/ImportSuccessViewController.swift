//
//  ImportSuccessViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 10/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class ImportSuccessViewController: BaseViewController,UIAlertViewDelegate {
    
    var         successView:                ImportSuccessView!;
    var         downloadFileName:           NSString!;
    var         server:                     FMServer!;
    var         succssed:                   Bool = false;
    var         manager:                    FTPManager!;
    var         fileHandel:                 NSFileHandle!;
    var         recodes:                    NSInteger! = 0;
    var         dbManager:                  DataBase!;
    var         tempFileDataModel:          FileDataModel = FileDataModel();
    var         sameDataArray:              NSMutableArray!;//重复数据
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        manager = FTPManager();
        dbManager = DataBase();
        sameDataArray = NSMutableArray();
        successView = ImportSuccessView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(successView);
        self.setLabelName();
        self.addButtonAction();
        MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        self.performSelectorInBackground(#selector(ImportSuccessViewController.loadFile), withObject: nil);
        //self.loadFile();
    }
    
    func setLabelName(){
        let currentFTP = CurrentFTP.current();
        self.successView.ftpServerTextLabel.text = currentFTP.ftpServer as String;
        self.successView.ftpUserTextLabel.text = currentFTP.ftpUser as String;
        self.successView.fileNameTextLabel.text = self.downloadFileName as String;
        
    }
    
    func loadFile(){
        print("\(self.downloadFileName)");
        
        self.succssed = manager.downloadFile(self.downloadFileName as String, toDirectory: NSURL(fileURLWithPath: CSVFILEPATH), fromServer: server);
        if self.succssed{
            print("下载 \(self.downloadFileName) 成功");
            MBProgressHUD.hideHUDForView(self.view, animated: true);
            self.performSelectorOnMainThread(#selector(ImportSuccessViewController.checkTheRecode), withObject: nil, waitUntilDone: true);
        }else{
            print("下载 \(self.downloadFileName) 失败");
            self.performSelectorOnMainThread(#selector(ImportSuccessViewController.setFailStatusPrompt), withObject: nil, waitUntilDone: true);
            MBProgressHUD.hideHUDForView(self.view, animated: true);
        }
    }
    
    /**
    检测记录条数
    */
    
    func checkTheRecode(){
        
        if self.writeFileToDataBase(){
            self.setRecodeLabelName();
        }else{
          
            self.createAlertView(localString("warning"), message: localString("numOfRecodes"));
        }
        
    }
    
    func setFailStatusPrompt(){
        self.successView.promptLabel.text = localString("aSuccess");
    }
    
    /**
    导入记录的条数
    */
    
    func setRecodeLabelName(){
        
        self.successView.recordsTextLabel.text = "\(self.recodes)";
        self.successView.skuTextLabel.text = "\(self.recodes)";
        self.successView.onhandQuantityTextLabel.text = "\(self.recodes)";
        
    }
    
    func writeFileToDataBase()->Bool{
        
        let filePath = "\(CSVFILEPATH)/\(self.downloadFileName)";
        print("\(filePath)");
        fileHandel = NSFileHandle(forUpdatingAtPath:filePath );
        let fileData:NSData = fileHandel.readDataToEndOfFile();
        
        let fileStr:NSString = NSString(data: fileData, encoding: NSUTF16StringEncoding)!;
        print("\(fileStr)");
        var strArr = fileStr.componentsSeparatedByString("\n");
        if strArr.count == 1{
            strArr = fileStr.componentsSeparatedByString("\r");
        }
        recodes = strArr.count;
        print("recodes.count=====\(strArr.count)");
        sameDataArray.removeAllObjects();
        if strArr.count<=50{
            for item in strArr{
                let subArr = item.componentsSeparatedByString(",");
                print("sub ---------\(subArr.count)");
                if subArr.count < 3 {
                    recodes = recodes - 1;
                }else{
                    let filedataModel:FileDataModel = FileDataModel();
                    filedataModel.fileName = self.downloadFileName;
                    filedataModel.skuCode = subArr[0]
                    filedataModel.skuName = subArr[1];
                    filedataModel.onhandQty = subArr[2];
//                    //是否有第四列，如有第四列为盘点数量
//                    if subArr.count >= 4{
//                        filedataModel.countQty = subArr[3];
//                    }
//                    //判断是否有第五列，如果第五列为相差数量
//                    if subArr.count >= 5{
//                        filedataModel.varianceQty = subArr[4];
//                    }
                    //是否有第四列，若有第四列为条码
                    if subArr.count >= 4{
                        filedataModel.barcode = (subArr[3] as String ).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
                    }
                    
                    filedataModel.fileDate = self.getCurrentTime();
                    if !dbManager.addFileData(filedataModel){
                        sameDataArray.addObject(filedataModel);
                    };
                }
            }
        }else{
            return false;
        }

        if sameDataArray.count != 0{
            self.createNewAlertView();
        }
        return true;
    }
    
    func createNewAlertView(){
       
        let alertView = UIAlertController(title: localString("warning"), message: localString("aiSamePrompt"), preferredStyle: UIAlertControllerStyle.Alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
        });
        let OkAction:UIAlertAction = UIAlertAction(title: localString("update"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
            for item in self.sameDataArray {
                self.dbManager.updateFileData(item as! FileDataModel);
            }
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        self.presentViewController(alertView, animated: true, completion: nil);

    }
    
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
    
    func addButtonAction(){
        
        self.successView.returnButton.addTarget(self, action: #selector(ImportSuccessViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.successView.countingEntryButton.addTarget(self, action: #selector(ImportSuccessViewController.countingEntryAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func countingEntryAction(){
        
        let countingEntryVC = CountingEntryViewController();
        countingEntryVC.fileName = self.downloadFileName;
        countingEntryVC.numOfSKU = self.recodes;
        self.drawer?.repleaceCenterViewControllerWithViewController(countingEntryVC);
        
    }
    
    func returnButtonAction(){
        
        let quantitImportVC = QuantityImportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantitImportVC);
    }
    
    
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
