//
//  EmailViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 27/6/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit
import MessageUI

let FIELNAME = "TempleAttachmentFile.csv"
class EmailViewController:UIViewController, MFMailComposeViewControllerDelegate {
    var         fileDate:                           NSString!;
    var         dataArray:                          NSMutableArray!
    var         dbManager:                          DataBase!;
    var         fileManager:                        FileManager!;
    var         filePath:                           NSString!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbManager = DataBase();
        fileManager = FileManager.default;
        dataArray = NSMutableArray()
        dataArray = dbManager.recodesWithDate(self.fileDate);
        print("---------------\(self.fileDate)")
    
        self.view.backgroundColor = UIColor.white
        self.createTempCSVFile()

        if MFMailComposeViewController.canSendMail(){
            self.sendEmailAction()
        }else{
            
        }
        
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
        let string = CSVFILEPATH + "/\(FIELNAME)"
        self.filePath = string as NSString
        if  !fileManager.fileExists(atPath: self.filePath as String){
            self.fileManager.createFile(atPath: self.filePath as String, contents: fileData, attributes: nil);
        }
    }
    
    /**
     将临时文件删除
     */
    
    func removeTempFile(){
        try! self.fileManager.removeItem(atPath: self.filePath as String);
    }
    
    
    func sendEmailAction(){
        //邮件服务器
        let mailCompose = MFMailComposeViewController()
        
        //设置邮件代理
        mailCompose.mailComposeDelegate = self
        
        //设置邮件主题
        mailCompose.setSubject("我是邮件主题")
        
        //设置收件人
        
        mailCompose.setToRecipients([""])
        
        //设置抄送人
        mailCompose.setCcRecipients([""])
        
        //设置密抄送
        mailCompose.setBccRecipients([""])
        
        //设置邮件正文内容
        
        
        let emailContent = "内容"
        
        //是否为HTML格式
        mailCompose.setMessageBody(emailContent, isHTML: false)
        
        
        //添加附件，这个比较重要稍后在测试
        
        /*
         
         NSString *file = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
         NSData *pdf = [NSData dataWithContentsOfFile:file];
         [mailCompose addAttachmentData:pdf mimeType:@"" fileName:@"7天精通IOS233333"];
         */
       // let file = NSBundle.mainBundle().pathForResource("SHSTORE", ofType: ".csv")
        
        let csv = try? Data(contentsOf: URL(fileURLWithPath: self.filePath as String))
        mailCompose.addAttachmentData(csv!, mimeType: "", fileName: FIELNAME)
        print(csv)
        self.present(mailCompose, animated: true, completion: nil)
        
    }
    
    
    //MARK:- MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    //MARK:- CHANGE 1
//        switch result {
//        case MFMailComposeResultCancelled:
//            print("Canceled...")
//            
//        case MFMailComposeResultSaved:
//            print("Saved...")
//        case MFMailComposeResultSent:
//            print("Mail sent...")
//        case MFMailComposeResultFailed:
//            print("Mail send errored:\(error)...")
//        default:
//            break;
//        }
        self.removeTempFile()
        self.dismiss(animated: true, completion: nil)
        let center = AttachmentViewController()
        
        let left = INFODrawerViewController();
        let drawer = INFOViewController();
        drawer.initWithLeftViewController(left, centerViewController: center);
        let mywindow = UIApplication.shared.keyWindow
        mywindow?.rootViewController = drawer
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
