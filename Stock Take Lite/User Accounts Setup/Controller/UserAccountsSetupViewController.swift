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
    var            currentIndexpath:                        IndexPath!;
    var            isSelected:                              Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dbManager = DataBase.manager;
        currentIndexpath = IndexPath(row: 0, section: 0);
        self.view.backgroundColor = UIColor.white;
        userAccountsSetupView = UserAccountsSetupView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
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
        self.userAccountsSetupView.addButton.addTarget(self, action: #selector(UserAccountsSetupViewController.addButtonAction), for: UIControlEvents.touchUpInside);
        self.userAccountsSetupView.okButton.addTarget(self, action: #selector(UserAccountsSetupViewController.okButtonAction), for: UIControlEvents.touchUpInside);
        self.userAccountsSetupView.cancelButton.addTarget(self, action: #selector(UserAccountsSetupViewController.cancelButtonAction), for: UIControlEvents.touchUpInside);
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
            let currentUser = CurrentUser.current;
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
        currentIndexpath = IndexPath(row: 0, section: 0);
        isSelected = false;
        if self.lastVC == nil {
            let mainVC = MainViewController();
            self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        }else{
            self.drawer?.repleaceCenterViewControllerWithViewController(self.lastVC);
        }
    }
    
    //MARK: - tableView delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UserAccountsSetupTableViewCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? UserAccountsSetupTableViewCell;
        if cell == nil {
            cell = UserAccountsSetupTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        let user = userArray[(indexPath as NSIndexPath).row] as? UserModel;
        cell?.userIDLabel.text = user?.userID as? String;
        cell?.userNameLabel.text = user?.userName as? String;
        if (user?.administrator?.isEqual(to: "1") != false) {
            cell?.administratorLabel.text = "YES";
        }else{
            cell?.administratorLabel.text = "NO";
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentIndexpath = indexPath;
        isSelected = true;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50 / 1024.0 * SCREENHEIGHT
        }
        
        return 50;
    }
    
    //MARK:- ViewController 周期
    
    override func viewWillAppear(_ animated: Bool) {
        if !CurrentUser.isAdmin(){
            self.createNewAlertView(localString("warning"), message: localString("aucheck"))
        }
    }
     func createNewAlertView(_ title:String,message:String?) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            if self.lastVC != nil{
                self.drawer?.repleaceCenterViewControllerWithViewController(self.lastVC);
            }else{
                let mainVC = MainViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
            }
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
                self.createNewAlertView(self.localString("warning"), message: self.localString("auUserID"));
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
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
