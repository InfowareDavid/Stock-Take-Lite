
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
        self.view.backgroundColor = UIColor.white;
        userAccountAddView = UserAccountsAddView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.userAccountAddView.userIDTextField.delegate = self ;
        self.userAccountAddView.userNameTextField.delegate = self;
        self.userAccountAddView.passwordTextField.delegate = self;
        self.view.addSubview(userAccountAddView);
        dbmanager = DataBase.manager;
        self.addButtonAction();
        
    }
    
    /**
    为save  delet cancel 按钮添加处理事件
    */
    
    func addButtonAction(){
        
        self.userAccountAddView.saveButton.addTarget(self, action: #selector(UserAccountsAddViewController.saveAction(_:)), for: UIControlEvents.touchUpInside);
        self.userAccountAddView.deletButton.addTarget(self, action: #selector(UserAccountsAddViewController.deleteAction(_:)), for: UIControlEvents.touchUpInside);
        self.userAccountAddView.cancelButton.addTarget(self, action: #selector(UserAccountsAddViewController.cancelAction(_:)), for: UIControlEvents.touchUpInside);
        self.userAccountAddView.administratorButton.addTarget(self, action: #selector(UserAccountsAddViewController.administratorAction(_:)), for: UIControlEvents.valueChanged);
        
    }
    
    /**
    保存事件
    
    - parameter btn:
    */
    
    func saveAction(_ btn:UIButton!){
        
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
        userModel.userID = self.userAccountAddView.userIDTextField.text as NSString?;
        userModel.userName = self.userAccountAddView.userNameTextField.text as NSString?;
        userModel.password = self.userAccountAddView.passwordTextField.text as NSString?;
        userModel.administrator = "\(self.userAccountAddView.administratorButton.selectedSegmentIndex)" as NSString?;
    }
    
    
    /**
    删除事件
    
    - parameter btn:
    */
    
    func deleteAction(_ btn:UIButton!){
        
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
    
    func cancelAction(_ btn:UIButton!){
        
        let userAccountVC = UserAccountsSetupViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(userAccountVC);
    }
    
    /**
    权限的处理
    
    - parameter administrator:
    */
    func administratorAction(_ administrator:UISegmentedControl!){
        
        if administrator.selectedSegmentIndex == 0{
            
            administrator.setTitle(localString("off"), forSegmentAt: 0);
            administrator.setTitle("", forSegmentAt: 1);
            
        }else{
            
            administrator.setTitle(localString("on"), forSegmentAt: 1);
            administrator.setTitle("", forSegmentAt: 0);
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func createAlertView(_ title:String,message:String?) {
        var alertView:              UIAlertView!;
        
        alertView = UIAlertView(title: title, message: message!, delegate: nil, cancelButtonTitle: localString("cancel"), otherButtonTitles: localString("ok"));
        alertView.show();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
