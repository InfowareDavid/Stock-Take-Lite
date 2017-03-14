//
//  LogonView.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 6/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit


class LogonView: BaseView {
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
        
        let image:UIImage! = UIImage(named:"Stock-bg768");
        let logImage:UIImage! = UIImage(named: "logo");
        backgroundImageView = UIImageView(image: image);
        backgroundImageView.frame = frame;
        self.addSubview(backgroundImageView);
        logoImageView = UIImageView(image: logImage);
        self.addSubview(logoImageView);
        
        
        userIDLbel = UILabel();
        userIDLbel?.font = FONT25();
        userIDLbel?.textAlignment = NSTextAlignment.left;
        userIDLbel?.textColor = self.colorWithString("#000000");
        userIDLbel?.text = localString("mUserID");
        self.addSubview(userIDLbel!);
        
        
        passwordLabel = UILabel();
        passwordLabel?.font = FONT25();
        passwordLabel?.textAlignment = NSTextAlignment.left;
        passwordLabel?.textColor = self.colorWithString("#000000");
        passwordLabel?.text = localString("mPassword");
        self.addSubview(passwordLabel!);
        
        
        userIDTextField = UITextField();
        userIDTextField?.clearButtonMode = UITextFieldViewMode.whileEditing;
        userIDTextField?.borderStyle = UITextBorderStyle.roundedRect;
        userIDTextField?.returnKeyType = .done
        userIDTextField?.font = FONT25();
        userIDTextField?.minimumFontSize = 0.8;
        self.addSubview(userIDTextField!);
        
        
        passwordTextField = UITextField();
        passwordTextField?.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordTextField?.borderStyle = UITextBorderStyle.roundedRect;
        passwordTextField?.font = FONT25();
        passwordTextField?.returnKeyType = .done
        passwordTextField?.isSecureTextEntry = true;
        passwordTextField?.minimumFontSize = 0.8;
        self.addSubview(passwordTextField!);
        
        
        logonButton = UIButton(type: UIButtonType.system);
        logonButton?.titleLabel?.font = FONT22();
        logonButton?.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        logonButton?.setBackgroundImage(UIImage(named: "buttom_1") ,for:UIControlState() );
        logonButton?.setTitle(localString("logon"), for: UIControlState());
        self.addSubview(logonButton!);
        
        
        userAccountSetupButton = UIButton(type: UIButtonType.system);
        userAccountSetupButton?.titleLabel?.font = FONT22();
        userAccountSetupButton?.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        userAccountSetupButton?.setTitle(localString("userAccountSetup"), for: UIControlState());
        userAccountSetupButton?.setBackgroundImage(UIImage(named: "buttom_2"), for: UIControlState());
        self.addSubview(userAccountSetupButton!);
        
        if DEVICE == .phone{
            self.addPhoneContraint()
        }else{
            self.addLogonContraint()
        }
        
    }
    
    func addPhoneContraint(){
        
        logoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/5);
            make.top.equalTo(self.snp.top).offset(SCREENHEIGHT/5);
            make.width.equalTo(SCREENWIDTH/5 * 3);
            make.height.equalTo(SCREENWIDTH/5 * 3);
        }
        
        userIDLbel?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/20 * 3);
            make.top.equalTo(self.snp.top).offset(SCREENHEIGHT/5 * 3);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(35);
            
        })
        
        passwordLabel?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.userIDLbel!.snp.left)
            make.top.equalTo(self.userIDLbel!.snp.bottom).offset(15);
            make.width.equalTo(self.userIDLbel!.snp.width);
            make.height.equalTo(self.userIDLbel!.snp.height);
            
        })
        
        userIDTextField?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.userIDLbel!.snp.right).offset(10);
            make.centerY.equalTo(self.userIDLbel!.snp.centerY);
            make.width.equalTo(SCREENWIDTH/5 * 2);
            make.height.equalTo(self.userIDLbel!.snp.height).offset(-10);
            
        })
        
        passwordTextField?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.userIDTextField!.snp.left);
            make.centerY.equalTo(self.passwordLabel!.snp.centerY);
            make.width.equalTo(self.userIDTextField!.snp.width);
            make.height.equalTo(self.userIDTextField!.snp.height);
            
        })
        
        logonButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.userIDLbel!.snp.left);
            make.top.equalTo(self.passwordLabel!.snp.bottom).offset(15);
            make.width.equalTo(self.userIDLbel!.snp.width);
            make.height.equalTo(self.userIDLbel!.snp.height).offset(-10);
            
        })
        
        userAccountSetupButton?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.userIDTextField!.snp.left)
            make.centerY.equalTo(self.logonButton!.snp.centerY);
            make.width.equalTo(self.userIDTextField!.snp.width);
            make.height.equalTo(self.userIDLbel!.snp.height).offset(-10);
            
        })
        
    }
    
    func addLogonContraint(){
        logoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(204);
            make.top.equalTo(self.snp.top).offset(180);
            make.width.equalTo(402);
            make.height.equalTo(352);
        }
        
        userIDLbel?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(205);
            make.top.equalTo(self.snp.top).offset(592);
            make.width.equalTo(120);
            make.height.equalTo(34);
            
        })
        
        passwordLabel?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(205);
            make.top.equalTo(self.snp.top).offset(667);
            make.width.equalTo(120);
            make.height.equalTo(34);
            
        })
        
        userIDTextField?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(350);
            make.top.equalTo(self.snp.top).offset(592);
            make.width.equalTo(210);
            make.height.equalTo(34);
            
        })
        
        passwordTextField?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(350);
            make.top.equalTo(self.snp.top).offset(667);
            make.width.equalTo(210);
            make.height.equalTo(34);
            
        })
        
        logonButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(205);
            make.top.equalTo(self.snp.top).offset(749);
            make.width.equalTo(112);
            make.height.equalTo(32);
            
        })
        
        userAccountSetupButton?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.snp.left).offset(327);
            make.top.equalTo(self.snp.top).offset(749);
            make.width.equalTo(236);
            make.height.equalTo(32);
            
        })
        
    }
    
//    func FONT20()->UIFont{
//        if DEVICE == .Phone{
//            return UIFont.systemFontOfSize(9)
//        }
//        return UIFont.systemFontOfSize(20)
//    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
