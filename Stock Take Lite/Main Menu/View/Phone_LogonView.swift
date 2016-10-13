//
//  Phone_LogonView.swift
//  Stock Take Lite
//
//  Created by infoware on 21/4/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit

class Phone_LogonView: BaseView {
    var         backgroundImageView:                    UIImageView!;
    var         userIDLbel:                             UILabel?;
    var         passwordLabel:                          UILabel?;
    var         logonButton:                            UIButton?;
    var         userAccountSetupButton:                 UIButton?;
    var         userIDTextField:                        UITextField?;
    var         passwordTextField:                      UITextField?;
    var         logoImageView:                          UIImageView!;
    
    override  init(frame: CGRect) {
        super.init(frame: frame);
        print("我是phone")
        let image:UIImage! = UIImage(named:"Stock-bg768");
        let logImage:UIImage! = UIImage(named: "logo");
        backgroundImageView = UIImageView(image: image);
        backgroundImageView.frame = frame;
        self.addSubview(backgroundImageView);
        logoImageView = UIImageView(image: logImage);
        self.addSubview(logoImageView);
        
        
        userIDLbel = UILabel();
        userIDLbel?.font = UIFont.systemFontOfSize(25);
        userIDLbel?.textAlignment = NSTextAlignment.Left;
        userIDLbel?.textColor = self.colorWithString("#000000");
        userIDLbel?.text = localString("mUserID");
        self.addSubview(userIDLbel!);
        
        
        passwordLabel = UILabel();
        passwordLabel?.font = UIFont.systemFontOfSize(25);
        passwordLabel?.textAlignment = NSTextAlignment.Left;
        passwordLabel?.textColor = self.colorWithString("#000000");
        passwordLabel?.text = localString("mPassword");
        self.addSubview(passwordLabel!);
        
        
        userIDTextField = UITextField();
        userIDTextField?.clearButtonMode = UITextFieldViewMode.WhileEditing;
        userIDTextField?.borderStyle = UITextBorderStyle.RoundedRect;
        userIDTextField?.font = UIFont.systemFontOfSize(25);
        userIDTextField?.minimumFontSize = 0.8;
        self.addSubview(userIDTextField!);
        
        
        passwordTextField = UITextField();
        passwordTextField?.clearButtonMode = UITextFieldViewMode.WhileEditing;
        passwordTextField?.borderStyle = UITextBorderStyle.RoundedRect;
        passwordTextField?.font = UIFont.systemFontOfSize(25);
        passwordTextField?.secureTextEntry = true;
        passwordTextField?.minimumFontSize = 0.8;
        self.addSubview(passwordTextField!);
        
        
        logonButton = UIButton(type: UIButtonType.System);
        logonButton?.titleLabel?.font = UIFont.systemFontOfSize(22);
        logonButton?.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        logonButton?.setBackgroundImage(UIImage(named: "buttom_1") ,forState:UIControlState.Normal );
        logonButton?.setTitle(localString("logon"), forState: UIControlState.Normal);
        self.addSubview(logonButton!);
        
        
        userAccountSetupButton = UIButton(type: UIButtonType.System);
        userAccountSetupButton?.titleLabel?.font = UIFont.systemFontOfSize(22);
        userAccountSetupButton?.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        userAccountSetupButton?.setTitle(localString("userAccountSetup"), forState: UIControlState.Normal);
        userAccountSetupButton?.setBackgroundImage(UIImage(named: "buttom_2"), forState: UIControlState.Normal);
        self.addSubview(userAccountSetupButton!);
        
        self.addLogonContraint()
    }
    
    func addLogonContraint(){
        logoImageView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/5);
            make.top.equalTo(self.mas_top).with.offset(SCREENHEIGHT/5);
            make.width.equalTo(SCREENWIDTH/5 * 3);
            make.height.equalTo(SCREENHEIGHT/10 * 3);
        }
        
        userIDLbel?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.mas_left).with.offset(205);
            make.top.equalTo(self.mas_top).with.offset(592);
            make.width.equalTo(120);
            make.height.equalTo(34);
            
        })
        
        passwordLabel?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.mas_left).with.offset(205);
            make.top.equalTo(self.mas_top).with.offset(667);
            make.width.equalTo(120);
            make.height.equalTo(34);
            
        })
        
        userIDTextField?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.mas_left).with.offset(350);
            make.top.equalTo(self.mas_top).with.offset(592);
            make.width.equalTo(210);
            make.height.equalTo(34);
            
        })
        
        passwordTextField?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.mas_left).with.offset(350);
            make.top.equalTo(self.mas_top).with.offset(667);
            make.width.equalTo(210);
            make.height.equalTo(34);
            
        })
        
        logonButton?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            make.left.equalTo(self.mas_left).with.offset(205);
            make.top.equalTo(self.mas_top).with.offset(749);
            make.width.equalTo(112);
            make.height.equalTo(32);
            
        })
        
        userAccountSetupButton?.mas_makeConstraints({ (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.mas_left).with.offset(327);
            make.top.equalTo(self.mas_top).with.offset(749);
            make.width.equalTo(236);
            make.height.equalTo(32);
            
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
