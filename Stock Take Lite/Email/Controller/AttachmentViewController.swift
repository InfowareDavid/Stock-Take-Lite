//
//  AttachmentViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 27/6/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit
import MessageUI

class AttachmentViewController: QuantityExportViewController {
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.comenInit()
    }
    
    func comenInit(){
        previousRow = 8;
        self.quantityExportView.secondeTopLabel.text = localString("eChooseAttachment")
        self.quantityExportView.promptLabel.text = localString("epromot")
        
    }
    
    override func okButtonAction() {
        
        
        if isSelected{
            if MFMailComposeViewController.canSendMail(){
                let emailVC = EmailViewController()
                let enquiryModel:EnquiryModel = self.dataArray[currenrow] as! EnquiryModel;
                //print(enquiryModel.date)
                
                
                emailVC.fileDate = enquiryModel.date;
                let mywindow = UIApplication.shared.keyWindow
                mywindow?.rootViewController = emailVC

            }else{
                self.createAlertView(localString("warning"), message: localString("epromotSet"));
            }
            
        }else{
            exportAlert.show();
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
