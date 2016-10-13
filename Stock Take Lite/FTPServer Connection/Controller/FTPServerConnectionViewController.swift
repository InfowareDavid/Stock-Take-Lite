//
//  FTPServerConnectionViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class FTPServerConnectionViewController: BaseViewController,UITextFieldDelegate {
    
    var             ftpServerView:                  FTPServerConnectionView!;
    var             dbManager:                      DataBase!;
    var             ftpManager:                     FTPManager!;
    var             server:                         FMServer!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dbManager = DataBase();
        ftpManager = FTPManager();
        self.view.backgroundColor = UIColor.whiteColor();
        ftpServerView = FTPServerConnectionView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.ftpServerView.ftpServerTextField.delegate = self ;
        self.ftpServerView.ftpuserTextField.delegate = self ;
        self.ftpServerView.passwordTextField.delegate = self ;
        self.view.addSubview(ftpServerView);
        self.addButtonActions();

    }

    func addButtonActions(){
      
        self.ftpServerView.saveButton.addTarget(self, action: #selector(FTPServerConnectionViewController.saveButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.ftpServerView.cancelButton.addTarget(self, action: #selector(FTPServerConnectionViewController.cancelButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        
    }
    
    func saveButtonAction(){
        self.getCurrentFTP();
        let currentFTP = CurrentFTP.current();
        
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        MBProgressHUD.showHUDAddedTo(self.view , animated: true);
        self.performSelectorInBackground(#selector(FTPServerConnectionViewController.checkeTheFTPServer), withObject: nil);
    }
    
    func checkeTheFTPServer(){
        if ftpManager.checkLogin(server){
            self.performSelectorOnMainThread(#selector(FTPServerConnectionViewController.backToMainVC), withObject: nil, waitUntilDone: true);
            self.performSelectorOnMainThread(#selector(FTPServerConnectionViewController.mbprogressHUDHidden), withObject: nil, waitUntilDone: true);
        }else{
            self.performSelectorOnMainThread(#selector(FTPServerConnectionViewController.mbprogressHUDHidden), withObject: nil, waitUntilDone: true);

            self.performSelectorOnMainThread(#selector(FTPServerConnectionViewController.createAlertViewOnMainThread), withObject: nil, waitUntilDone: true);
        }
    }
    
    func mbprogressHUDHidden(){
        MBProgressHUD.hideHUDForView(self.view, animated: true);
    }
    
    func backToMainVC(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func createAlertViewOnMainThread(){
        self.createAlertView(localString("warning"), message: localString("auCheckInput"));
    }
    
    func cancelButtonAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func getCurrentFTP(){
        
        let currentFTP = CurrentFTP.current();
        //MARK: - 最后打开
        currentFTP.ftpServer = self.ftpServerView.ftpServerTextField.text;
        currentFTP.ftpUser = self.ftpServerView.ftpuserTextField.text;
        currentFTP.ftpPassword = self.ftpServerView.passwordTextField.text;
//        currentFTP.ftpServer = "ns1.infoware.com.hk";
//        currentFTP.ftpUser = "crmlite";
//        currentFTP.ftpPassword = "FTP@dHe2015";
        
    }
    
    //:MARK:- ViewController 周期
    
    override func viewWillAppear(animated: Bool) {
        if !CurrentUser.isAdmin(){
            self.createNewAlertView(localString("warning"), message: localString("aucheck"));
        }
    }
 
     func createNewAlertView(title:String,message:String?) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            let mainVC = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        });
        let OkAction:UIAlertAction = UIAlertAction(title: localString("ok"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
            let textFieldArray:NSArray = alertView.textFields!;
            let userNameTextField = textFieldArray[0] as?UITextField;
            let passwordTextField = textFieldArray[1] as? UITextField;
            
            let userModel = UserModel();
            userModel.userID = userNameTextField?.text;
            userModel.password = passwordTextField?.text;
            if !self.dbManager.isAdmin(userModel){
                self.createNewAlertView(self.localString("warning"), message:self.localString("auUserID"));
            }
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        alertView.addTextFieldWithConfigurationHandler { (textField:UITextField) -> Void in
            textField.placeholder = self.localString("auAdminName");
        }
        alertView.addTextFieldWithConfigurationHandler { (textField:UITextField) -> Void in
            textField.placeholder = self.localString("auPassword");
        }
        self.presentViewController(alertView, animated: true, completion: nil);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
