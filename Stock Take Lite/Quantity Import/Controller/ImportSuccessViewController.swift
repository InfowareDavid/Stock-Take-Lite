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
    var         fileHandel:                 FileHandle!;
    var         recodes:                    NSInteger! = 0;
    var         dbManager:                  DataBase!;
    var         tempFileDataModel:          FileDataModel = FileDataModel();
    var         sameDataArray:              NSMutableArray!;//重复数据
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        manager = FTPManager();
        dbManager = DataBase();
        sameDataArray = NSMutableArray();
        successView = ImportSuccessView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.view.addSubview(successView);
        self.setLabelName();
        self.addButtonAction();
        MBProgressHUD.showAdded(to: self.view, animated: true);
        self.performSelector(inBackground: #selector(ImportSuccessViewController.loadFile), with: nil);
        //self.loadFile();
    }
    
    func setLabelName(){
        let currentFTP = CurrentFTP.current;
        self.successView.ftpServerTextLabel.text = currentFTP.ftpServer as String;
        self.successView.ftpUserTextLabel.text = currentFTP.ftpUser as String;
        self.successView.fileNameTextLabel.text = self.downloadFileName as String;
        
    }
    
    func loadFile(){
        print("\(self.downloadFileName)");
        
        self.succssed = manager.downloadFile(self.downloadFileName as String, toDirectory: URL(fileURLWithPath: CSVFILEPATH), from: server);
        if self.succssed{
            print("下载 \(self.downloadFileName) 成功");
            MBProgressHUD.hide(for: self.view, animated: true);
            self.performSelector(onMainThread: #selector(ImportSuccessViewController.checkTheRecode), with: nil, waitUntilDone: true);
        }else{
            print("下载 \(self.downloadFileName) 失败");
            self.performSelector(onMainThread: #selector(ImportSuccessViewController.setFailStatusPrompt), with: nil, waitUntilDone: true);
            MBProgressHUD.hide(for: self.view, animated: true);
        }
    }
    
    /**
     检测记录条数
     */
    
    func checkTheRecode(){
        // 50条数据的限制，只有企业版没有限制
        #if LITE_VERSION
            if self.writeFileToDataBase(){
                self.setRecodeLabelName();
            }else{
                
                self.createAlertView(localString("warning"), message: localString("numOfRecodes"));
            }
        #elseif PRO_VERSION
            if self.writeFileToDataBase(){
                self.setRecodeLabelName();
            }else{
                
                self.createAlertView(localString("warning"), message: localString("numOfRecodes"));
            }
        #elseif ENTERPRISE_VERSION
            if self.enterpriseWriteFileToDataBase(){
                self.setRecodeLabelName();
            }else{
                
                self.createAlertView(localString("warning"), message: localString("numOfRecodes"));
            }
        #endif
        
    }
    
    func setFailStatusPrompt(){
        self.successView.promptLabel.text = localString("aSuccess");
    }
    
    /**
     导入记录的条数
     */
    
    func setRecodeLabelName(){
        
        self.successView.recordsTextLabel.text = "\(self.recodes!)";
        self.successView.skuTextLabel.text = "\(self.recodes!)";
        self.successView.onhandQuantityTextLabel.text = "\(self.recodes!)";
        
    }
    
    /*
     
     
     #if LITE_VERSION
     topViewLabel.text = localString("mTitle");
     #elseif PRO_VERSION
     topViewLabel.text = localString("mTitle_pro");
     #elseif ENTERPRISE_VERSION
     topViewLabel.text = localString("mTitle_ent");
     #endif
     
     
     */
    
    func writeFileToDataBase()->Bool{
        
        let filePath = "\(CSVFILEPATH)/\(self.downloadFileName!)";
        print("\(filePath)");
        fileHandel = FileHandle(forUpdatingAtPath:filePath)
        let fileData:Data = fileHandel.readDataToEndOfFile();
        
        let fileStr:NSString = NSString(data: fileData, encoding: String.Encoding.utf16.rawValue)!;
        print("\(fileStr)");
        var strArr = fileStr.components(separatedBy: "\n");
        if strArr.count == 1{
            strArr = fileStr.components(separatedBy: "\r");
        }
        recodes = strArr.count;
        print("recodes.count=====\(strArr.count)");
        sameDataArray.removeAllObjects();
        if strArr.count<=50{
            for item in strArr{
                let subArr = item.components(separatedBy: ",");
                print("sub ---------\(subArr.count)");
                if subArr.count < 3 {
                    recodes = recodes - 1;
                }else{
                    let filedataModel:FileDataModel = FileDataModel();
                    filedataModel.fileName = self.downloadFileName;
                    filedataModel.skuCode = subArr[0] as NSString?
                    filedataModel.skuName = subArr[1] as NSString?;
                    filedataModel.onhandQty = subArr[2] as NSString?;
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
                        filedataModel.barcode = (subArr[3] as String ).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString?;
                    }
                    
                    filedataModel.fileDate = self.getCurrentTime();
                    if !dbManager.addFileData(filedataModel){
                        sameDataArray.add(filedataModel);
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
    
    func enterpriseWriteFileToDataBase()->Bool{
        
        let filePath = "\(CSVFILEPATH)/\(self.downloadFileName!)";
        print("\(filePath)");
        fileHandel = FileHandle(forUpdatingAtPath:filePath)
        let fileData:Data = fileHandel.readDataToEndOfFile();
        
        let fileStr:NSString = NSString(data: fileData, encoding: String.Encoding.utf16.rawValue)!;
        print("\(fileStr)");
        var strArr = fileStr.components(separatedBy: "\n");
        if strArr.count == 1{
            strArr = fileStr.components(separatedBy: "\r");
        }
        recodes = strArr.count;
        print("recodes.count=====\(strArr.count)");
        sameDataArray.removeAllObjects();
        for item in strArr{
            let subArr = item.components(separatedBy: ",");
            print("sub ---------\(subArr.count)");
            if subArr.count < 3 {
                recodes = recodes - 1;
            }else{
                let filedataModel:FileDataModel = FileDataModel();
                filedataModel.fileName = self.downloadFileName;
                filedataModel.skuCode = subArr[0] as NSString?
                filedataModel.skuName = subArr[1] as NSString?;
                filedataModel.onhandQty = subArr[2] as NSString?;
                //是否有第四列，若有第四列为条码
                if subArr.count >= 4{
                    filedataModel.barcode = (subArr[3] as String ).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString?;
                }
                
                filedataModel.fileDate = self.getCurrentTime();
                if !dbManager.addFileData(filedataModel){
                    sameDataArray.add(filedataModel);
                };
            }
        }
        
        if sameDataArray.count != 0{
            self.createNewAlertView();
        }
        return true;
    }
    
    func createNewAlertView(){
        
        let alertView = UIAlertController(title: localString("warning"), message: localString("aiSamePrompt"), preferredStyle: UIAlertControllerStyle.alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
        });
        let OkAction:UIAlertAction = UIAlertAction(title: localString("update"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
            for item in self.sameDataArray {
                self.dbManager.updateFileData(item as! FileDataModel);
            }
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        self.present(alertView, animated: true, completion: nil);
        
    }
    
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
    
    func addButtonAction(){
        
        self.successView.returnButton.addTarget(self, action: #selector(ImportSuccessViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
        self.successView.countingEntryButton.addTarget(self, action: #selector(ImportSuccessViewController.countingEntryAction), for: UIControlEvents.touchUpInside);
    }
    
    func countingEntryAction(){
        
        let countingEntryVC = CountingEntryViewController();
        countingEntryVC.fileName = self.downloadFileName;
        countingEntryVC.numOfSKU = self.recodes!;
        self.drawer?.repleaceCenterViewControllerWithViewController(countingEntryVC);
        
    }
    
    func returnButtonAction(){
        
        let quantitImportVC = QuantityImportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantitImportVC);
    }
    
    
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
