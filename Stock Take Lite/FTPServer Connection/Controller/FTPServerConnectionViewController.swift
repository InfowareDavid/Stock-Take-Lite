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
        self.view.backgroundColor = UIColor.white;
        ftpServerView = FTPServerConnectionView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.ftpServerView.ftpServerTextField.delegate = self ;
        self.ftpServerView.ftpuserTextField.delegate = self ;
        self.ftpServerView.passwordTextField.delegate = self ;
        self.view.addSubview(ftpServerView);
        self.addButtonActions();

    }

    func addButtonActions(){
      
        self.ftpServerView.saveButton.addTarget(self, action: #selector(FTPServerConnectionViewController.saveButtonAction), for: UIControlEvents.touchUpInside);
        self.ftpServerView.cancelButton.addTarget(self, action: #selector(FTPServerConnectionViewController.cancelButtonAction), for: UIControlEvents.touchUpInside);
        
    }
    
    func saveButtonAction(){
        self.getCurrentFTP();
        let currentFTP = CurrentFTP.current;
        
        server = FMServer(destination: currentFTP.ftpServer! as String, username: currentFTP.ftpUser! as String, password: currentFTP.ftpPassword! as String);
        MBProgressHUD.showAdded(to: self.view , animated: true);
        self.performSelector(inBackground: #selector(FTPServerConnectionViewController.checkeTheFTPServer), with: nil);
    }
    
    func checkeTheFTPServer(){
        if ftpManager.checkLogin(server){
            self.performSelector(onMainThread: #selector(FTPServerConnectionViewController.backToMainVC), with: nil, waitUntilDone: true);
            self.performSelector(onMainThread: #selector(FTPServerConnectionViewController.mbprogressHUDHidden), with: nil, waitUntilDone: true);
        }else{
            self.performSelector(onMainThread: #selector(FTPServerConnectionViewController.mbprogressHUDHidden), with: nil, waitUntilDone: true);

            self.performSelector(onMainThread: #selector(FTPServerConnectionViewController.createAlertViewOnMainThread), with: nil, waitUntilDone: true);
        }
    }
    
    func mbprogressHUDHidden(){
        MBProgressHUD.hide(for: self.view, animated: true);
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
        
        let currentFTP = CurrentFTP.current;
        //MARK: - 最后打开
        currentFTP.ftpServer = self.ftpServerView.ftpServerTextField.text as NSString!;
        currentFTP.ftpUser = self.ftpServerView.ftpuserTextField.text as NSString!;
        currentFTP.ftpPassword = self.ftpServerView.passwordTextField.text as NSString!;
        currentFTP.ftpServer = "ns1.infoware.com.hk";
        currentFTP.ftpUser = "crmlite";
        currentFTP.ftpPassword = "FTP@dHe2015";
        
    }
    
    //:MARK:- ViewController 周期
    
    override func viewWillAppear(_ animated: Bool) {
        if !CurrentUser.isAdmin(){
            self.createNewAlertView(localString("warning"), message: localString("aucheck"));
        }
    }
 
     func createNewAlertView(_ title:String,message:String?) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            let mainVC = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        });
        let OkAction:UIAlertAction = UIAlertAction(title: localString("ok"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
            let textFieldArray:NSArray = alertView.textFields! as NSArray;
            let userNameTextField = textFieldArray[0] as?UITextField;
            let passwordTextField = textFieldArray[1] as? UITextField;
            
            let userModel = UserModel();
            userModel.userID = userNameTextField?.text as NSString?;
            userModel.password = passwordTextField?.text as NSString?;
            if !self.dbManager.isAdmin(userModel){
                self.createNewAlertView(self.localString("warning"), message:self.localString("auUserID"));
            }
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        alertView.addTextField { (textField:UITextField) -> Void in
            textField.placeholder = self.localString("auAdminName");
        }
        alertView.addTextField { (textField:UITextField) -> Void in
            textField.placeholder = self.localString("auPassword");
        }
        self.present(alertView, animated: true, completion: nil);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
