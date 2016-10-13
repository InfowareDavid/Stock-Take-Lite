
//
//  UserAccountsAddViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 19/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//



/// 注册信息

import UIKit

class UserAccountsAddViewController: BaseViewController,UITextFieldDelegate {
    
    var             userAccountAddView:                         UserAccountsAddView!;
    var             dbmanager:                                  DataBase!;
    var             userModel:                                  UserModel!;
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor();
        userAccountAddView = UserAccountsAddView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.userAccountAddView.userIDTextField.delegate = self ;
        self.userAccountAddView.userNameTextField.delegate = self;
        self.userAccountAddView.passwordTextField.delegate = self;
        self.view.addSubview(userAccountAddView);
        dbmanager = DataBase.manager();
        self.addButtonAction();
        
    }
    
    /**
    为save  delet cancel 按钮添加处理事件
    */
    
    func addButtonAction(){
        
        self.userAccountAddView.saveButton.addTarget(self, action: #selector(UserAccountsAddViewController.saveAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.userAccountAddView.deletButton.addTarget(self, action: #selector(UserAccountsAddViewController.deleteAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.userAccountAddView.cancelButton.addTarget(self, action: #selector(UserAccountsAddViewController.cancelAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.userAccountAddView.administratorButton.addTarget(self, action: #selector(UserAccountsAddViewController.administratorAction(_:)), forControlEvents: UIControlEvents.ValueChanged);
        
    }
    
    /**
    保存事件
    
    - parameter btn:
    */
    
    func saveAction(btn:UIButton!){
        
        self.getInputText();
        if userModel.userID?.length != 0 && userModel.userName?.length != 0 && userModel.password?.length != 0{
            if dbmanager.addUser(userModel){
                self.createAlertView(localString("prompt"), message: localString("auSaveSuccess"));
            }else{
                self.createAlertView(localString("prompt"), message: localString("userExist"))
            }
            
        }
    }
    
    /**
    获取输入信息：id, name ,password ,administrator
    */
    
    func getInputText(){
        
        userModel = UserModel();
        userModel.userID = self.userAccountAddView.userIDTextField.text;
        userModel.userName = self.userAccountAddView.userNameTextField.text;
        userModel.password = self.userAccountAddView.passwordTextField.text;
        userModel.administrator = "\(self.userAccountAddView.administratorButton.selectedSegmentIndex)";
    }
    
    
    /**
    删除事件
    
    - parameter btn:
    */
    
    func deleteAction(btn:UIButton!){
        
        self.getInputText();
        if userModel.userID?.length != 0 && userModel.userName?.length != 0 && userModel.password?.length != 0{
            if dbmanager.deleteUser(userModel){
                self.createAlertView(localString("prompt"), message: localString("auDeleteSuccess"));
            }
        }
    }
    
    /**
    取消事件
    
    - parameter btn:
    */
    
    func cancelAction(btn:UIButton!){
        
        let userAccountVC = UserAccountsSetupViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(userAccountVC);
    }
    
    /**
    权限的处理
    
    - parameter administrator:
    */
    func administratorAction(administrator:UISegmentedControl!){
        
        if administrator.selectedSegmentIndex == 0{
            
            administrator.setTitle(localString("off"), forSegmentAtIndex: 0);
            administrator.setTitle("", forSegmentAtIndex: 1);
            
        }else{
            
            administrator.setTitle(localString("on"), forSegmentAtIndex: 1);
            administrator.setTitle("", forSegmentAtIndex: 0);
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func createAlertView(title:String,message:String?) {
        var alertView:              UIAlertView!;
        
        alertView = UIAlertView(title: title, message: message!, delegate: nil, cancelButtonTitle: localString("cancel"), otherButtonTitles: localString("ok"));
        alertView.show();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
