//
//  MainViewController.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 7/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

enum CheckPaswd{
    case isSame
    case isDifferent
}

class MainViewController: BaseViewController,UIPopoverControllerDelegate {
    
    var mainView:                         MainView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 0;
        self.view.backgroundColor = UIColor.white;
        self.loadMyView();
        
    }
    
    func loadMyView() {
        mainView = MainView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.view.addSubview(mainView);
        self.addTargetForMainViewButtons();
    }
    
    func addTargetForMainViewButtons(){
        self.mainView.quantityImportButton.addTarget(self, action: #selector(MainViewController.quantityImportButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.countingEntryButton.addTarget(self, action: #selector(MainViewController.countingEntryButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.countingEnquiryButton.addTarget(self, action: #selector(MainViewController.countingEnquiryButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.quantityExportButton.addTarget(self, action: #selector(MainViewController.quantityExportButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.recordsRemovalButton.addTarget(self, action: #selector(MainViewController.recordsRemovalButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.bluetoothButton.addTarget(self, action: #selector(MainViewController.bluetoothButtonAction), for: UIControlEvents.touchUpInside);
        #if ENTERPRISE_VERSION
            
            self.mainView.cameraScanButton.addTarget(self, action: "cameraButtonAction", forControlEvents: .TouchUpInside);
            
        #endif
        self.mainView.userAccountsSetupButton.addTarget(self, action: #selector(MainViewController.userAccountsSetupButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.ftpServerConnectionSetupButton.addTarget(self, action: #selector(MainViewController.ftpServerConnectionSetupButtonAction), for: UIControlEvents.touchUpInside);
        self.mainView.emailButton.addTarget(self, action: #selector(MainViewController.emailAction), for: .touchUpInside)
        self.mainView.logoutButton.addTarget(self, action: #selector(MainViewController.logoutAction), for: UIControlEvents.touchUpInside);
        self.mainView.helpButton.addTarget(self, action: #selector(MainViewController.helpAction), for: UIControlEvents.touchUpInside);
    }
    
    func quantityImportButtonAction(){
        
        let quantityImportVC = QuantityImportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantityImportVC);
        
    }
    
    func countingEntryButtonAction(){
        
        let countingEntryVC = CountingEntryViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(countingEntryVC);
        
    }
    
    func countingEnquiryButtonAction(){
        
        let countingEnquiryVC = CountingEnquiryViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(countingEnquiryVC);
        
    }
    
    func quantityExportButtonAction(){
        
        let quantityExportVC = QuantityExportViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(quantityExportVC);
        
    }
    
    func recordsRemovalButtonAction(){
        
        let recordsRemovalVC = RecordsRemovalViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(recordsRemovalVC);
        
    }
    
    func bluetoothButtonAction(){
        
        let bluetoothVC = BluetoothScannerViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(bluetoothVC);
    }
    #if ENTERPRISE_VERSION
    
    func cameraButtonAction(){
        
        let cemeraVC = CameraScanViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(cemeraVC);
    }
    
    #endif
    func userAccountsSetupButtonAction(){
        
        let userAccountsSetupVC = UserAccountsSetupViewController();
        userAccountsSetupVC.lastVC = self;
        self.drawer?.repleaceCenterViewControllerWithViewController(userAccountsSetupVC);
        
    }
    
    func ftpServerConnectionSetupButtonAction(){
        
        let ftpServerConnectionSetupVC = FTPServerConnectionViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(ftpServerConnectionSetupVC);
        
    }
    
    func emailAction(){
        let attachmentVC = AttachmentViewController()
        self.drawer?.repleaceCenterViewControllerWithViewController(attachmentVC)
        
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    func helpAction(){
        
        let helpViewController:HelpViewController! = HelpViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(helpViewController);
        
        
    }
    
    func createAlertViewWithNOTextField(_ title:String,message:String?) {
        
        let  alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.default, handler: nil);
        let OkAction:UIAlertAction = UIAlertAction(title: localString("ok"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        self.present(alertView, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
