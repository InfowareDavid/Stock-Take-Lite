//
//  LogonViewController.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 6/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//
/*

#if LITE_VERSION
print("lite")

#elseif PRO_VERSION
print("pro")

#elseif ENTERPRISE_VERSION
print("enterprise")

#endif

*/


/// 登陆页面

import UIKit

let SCREENWIDTH = UIScreen.mainScreen().bounds.width;
let SCREENHEIGHT = UIScreen.mainScreen().bounds.height;
let CSVFILEPATH = NSHomeDirectory().stringByAppendingString("/Documents/CSVfile")
//Documents

class LogonViewController: BaseViewController,UITextFieldDelegate {
    var         logonView:                               LogonView!;
    var         database:                                DataBase = DataBase.manager();
    var         fileManager:                             NSFileManager!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        fileManager = NSFileManager();
        self.cteateUI();
        self.createDirectorAtCSVPath();
       
    }
    
    
    
    func cteateUI(){
        
        logonView = LogonView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        logonView.userIDTextField?.delegate = self
        logonView.passwordTextField?.delegate = self 
        self.view.addSubview(logonView);
        logonView.userAccountSetupButton?.addTarget(self, action: #selector(LogonViewController.userAccountSetupButtonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        logonView.logonButton?.addTarget(self, action: #selector(LogonViewController.logonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.setUserAccountButtonState();
    }
    
    func userAccountSetupButtonAction(regist:UIButton){
        
        let userAccountSetupVC = UserAccountsSetupViewController();
        userAccountSetupVC.lastVC = self;
        
       self.drawer?.repleaceCenterViewControllerWithViewController(userAccountSetupVC);
        
    }
    
    func createDirectorAtCSVPath(){
        
        try! self.fileManager.createDirectoryAtPath(CSVFILEPATH, withIntermediateDirectories: true, attributes: nil);
        
    }
    
    func logonAction(logon:UIButton){
        self.hiddenAnimation()
        let user:UserModel = UserModel();
        user.userID = logonView.userIDTextField?.text;
        user.password = logonView.passwordTextField?.text;
//        user.userID = "admin";
//        user.password = "admin";
        user.userName = nil;
//        let mainVC = MainViewController();
//        
//        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
        if database.isUserPasswordright(user){
            let currentUser:CurrentUser = CurrentUser.current();
            currentUser.user = user;
            let mainVC:MainViewController = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        }else{
            self.createAlertView("警告", message: "账户或密码有误！");
        }
    }

    
    /**
    设置按钮的状态
    */
    func setUserAccountButtonState(){
        if database.isAnyCurrentUserExists(){
            self.logonView.userAccountSetupButton?.highlighted = true;
            self.logonView.userAccountSetupButton?.enabled = false;
        }else{
            self.logonView.userAccountSetupButton?.enabled = true;
        }
    }
    //MARK: - TextField Delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if DEVICE == .Phone{
            showAnimation()

        }
        return true
    }
    
       
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if DEVICE == .Phone{
            textField.resignFirstResponder()
            hiddenAnimation()
        }
        return true
    }
    
       
    override func createAlertView(title:String,message:String?) {
        
      let  alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.Default, handler: nil);
        let OkAction:UIAlertAction = UIAlertAction(title: localString("ok"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
            });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        self.presentViewController(alertView, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
