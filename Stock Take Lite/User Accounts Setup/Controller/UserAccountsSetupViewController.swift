//
//  UserAccountsSetupViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class UserAccountsSetupViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {
    
    var            lastVC:                                  BaseViewController!;
    var            userAccountsSetupView:                   UserAccountsSetupView!;
    var            userArray:                               NSMutableArray!;
    var            dbManager:                               DataBase!;
    var            currentIndexpath:                        NSIndexPath!;
    var            isSelected:                              Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dbManager = DataBase.manager();
        currentIndexpath = NSIndexPath(forRow: 0, inSection: 0);
        self.view.backgroundColor = UIColor.whiteColor();
        userAccountsSetupView = UserAccountsSetupView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(userAccountsSetupView);
        self.userAccountsSetupView.tableView.delegate = self;
        self.userAccountsSetupView.tableView.dataSource = self;
        userArray = NSMutableArray();
        userArray = dbManager.allUsers();
        
//        if 48*self.userArray.count < 240 {
//            self.userAccountsSetupView.tableView.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
//                make.top.equalTo(self.userAccountsSetupView.tableViewTopLine.mas_bottom);
//                make.left.equalTo(self.userAccountsSetupView.mas_left);
//                make.right.equalTo(self.userAccountsSetupView.mas_right);
//                make.height.equalTo(48*self.userArray.count);
//            }
//        }
        self.addButtonActions();
    }
    //MARK: - buttonAction
    
    /**
    添加按钮处理事件 Add,Ok,Cancel
    */
    func addButtonActions(){
        self.userAccountsSetupView.addButton.addTarget(self, action: #selector(UserAccountsSetupViewController.addButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.userAccountsSetupView.okButton.addTarget(self, action: #selector(UserAccountsSetupViewController.okButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.userAccountsSetupView.cancelButton.addTarget(self, action: #selector(UserAccountsSetupViewController.cancelButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    /**
    Add按钮处理事件
    */
    
    func addButtonAction(){
        let userAccountAddVC = UserAccountsAddViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(userAccountAddVC);
    }
    
    /**
    Ok 按钮处理事件
    */
    
    func okButtonAction(){
        if isSelected {
            let currentUser = CurrentUser.current();
            currentUser.user = userArray[currentIndexpath.row] as? UserModel;
            dbManager.addCurrentUser(currentUser);
            let mainVC = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
            
        }else{
            /**
            若没有选择则进行提示
            */
            self.createAlertView(localString("warning"), message: localString("auAlert"));
        }
    }
    
    /**
    Cancel 按钮处理事件
    */
    
    func cancelButtonAction(){
        currentIndexpath = NSIndexPath(forRow: 0, inSection: 0);
        isSelected = false;
        if self.lastVC == nil {
            let mainVC = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        }else{
            self.drawer?.repleaceCenterViewControllerWithViewController(self.lastVC);
        }
    }
    
    //MARK: - tableView delegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :UserAccountsSetupTableViewCell?;
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? UserAccountsSetupTableViewCell;
        if cell == nil {
            cell = UserAccountsSetupTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        let user = userArray[indexPath.row] as? UserModel;
        cell?.userIDLabel.text = user?.userID as? String;
        cell?.userNameLabel.text = user?.userName as? String;
        if (user?.administrator?.isEqualToString("1") != false) {
            cell?.administratorLabel.text = "YES";
        }else{
            cell?.administratorLabel.text = "NO";
        }
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        currentIndexpath = indexPath;
        isSelected = true;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if DEVICE == .Phone{
            return 50 / 1024.0 * SCREENHEIGHT
        }
        
        return 50;
    }
    
    //MARK:- ViewController 周期
    
    override func viewWillAppear(animated: Bool) {
        if !CurrentUser.isAdmin(){
            self.createNewAlertView(localString("warning"), message: localString("aucheck"))
        }
    }
     func createNewAlertView(title:String,message:String?) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            if self.lastVC != nil{
                self.drawer?.repleaceCenterViewControllerWithViewController(self.lastVC);
            }else{
                let mainVC = MainViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
            }
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
                self.createNewAlertView(self.localString("warning"), message: self.localString("auUserID"));
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
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
