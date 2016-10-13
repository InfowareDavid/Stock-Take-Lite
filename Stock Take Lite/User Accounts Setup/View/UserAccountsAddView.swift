
//
//  UserAccountsSetupView.swift
//  Stock Take Lite
//
//  Created by infoware on 19/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class UserAccountsAddView: QuantityImportBaseView {
    var         setupBackgroundView:                    UIView!;
    var         userIDLabel:                            UILabel!;
    var         userNameLabel:                          UILabel!;
    var         administratorLabel:                     UILabel!;
    var         passwordLabel:                          UILabel!;
    var         passwordTextField:                      UITextField!;
    var         userIDTextField:                        UITextField!;
    var         userNameTextField:                      UITextField!;
    var         administratorButton:                    UISegmentedControl!;
    var         saveButton:                             UIButton!;
    var         deletButton:                            UIButton!;
    var         cancelButton:                           UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("uTitle");
        
        setupBackgroundView = UIView();
        setupBackgroundView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(setupBackgroundView);
        
        userIDLabel = UILabel();
        userIDLabel.text = localString("uUserID");
        userIDLabel.textColor = self.colorWithString("#6D6E71");
        userIDLabel.font = FONT25()
        self.setupBackgroundView.addSubview(userIDLabel);
       
        userNameLabel = UILabel();
        userNameLabel.text = localString("uName");
        userNameLabel.textColor = self.colorWithString("#6D6E71");
        userNameLabel.font = FONT25()
        self.setupBackgroundView.addSubview(userNameLabel);
        
        passwordLabel = UILabel();
        passwordLabel.text = localString("uPassword");
        passwordLabel.textColor = self.colorWithString("#6D6E71");
        passwordLabel.font = FONT25()
        self.setupBackgroundView.addSubview(passwordLabel);
       
        administratorLabel = UILabel();
        administratorLabel.text = localString("uAdmin");
        administratorLabel.textColor = self.colorWithString("#6D6E71");
        administratorLabel.font = FONT25()
        self.setupBackgroundView.addSubview(administratorLabel);
        
        userIDTextField = UITextField();
        userIDTextField.layer.borderWidth = 1;
        userIDTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        userIDTextField.borderStyle = UITextBorderStyle.None;
        userIDTextField.font = FONT25()
        userIDTextField.minimumFontSize = 0.8;
        userIDTextField.sizeToFit();
        self.addSubview(userIDTextField);
        
        userNameTextField = UITextField();
        userNameTextField.layer.borderWidth = 1;
        userNameTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        userNameTextField.borderStyle = UITextBorderStyle.None;
        userNameTextField.font = FONT25()
        userNameTextField.minimumFontSize = 0.8;
        userNameTextField.sizeToFit();
        self.addSubview(userNameTextField);
        
        passwordTextField = UITextField();
        passwordTextField.layer.borderWidth = 1;
        passwordTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        passwordTextField.borderStyle = UITextBorderStyle.None;
        passwordTextField.font = FONT25()
        passwordTextField.minimumFontSize = 0.8;
        passwordTextField.sizeToFit();
        self.addSubview(passwordTextField);
       
        administratorButton = UISegmentedControl();
        administratorButton.insertSegmentWithTitle(localString("off"), atIndex: 0, animated: false);
        administratorButton.insertSegmentWithTitle("", atIndex: 1, animated: false);
        administratorButton.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        administratorButton.layer.borderWidth = 1;
        administratorButton.layer.masksToBounds = true;
        administratorButton.layer.cornerRadius = 5;
        administratorButton.selectedSegmentIndex = 0;
        self.addSubview(administratorButton);
        
        saveButton = UIButton(type: UIButtonType.System);
        saveButton.setTitle(localString("save"), forState: UIControlState.Normal);
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        saveButton.titleLabel?.font = FONT25()
        saveButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(saveButton);
        
        deletButton = UIButton(type: UIButtonType.System);
        deletButton.setTitle(localString("delete"), forState: UIControlState.Normal);
        deletButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        deletButton.titleLabel?.font = FONT25()
        deletButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(deletButton);
        
        cancelButton = UIButton(type: UIButtonType.System);
        cancelButton.setTitle(localString("cancel"), forState: UIControlState.Normal);
        cancelButton.setBackgroundImage(UIImage(named:"buttom_1"), forState: UIControlState.Normal)
        cancelButton.titleLabel?.font = FONT25()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(cancelButton);
        if DEVICE == .Phone{
            addPhoneViewConstraint()
        }else{
            addViewConstraint()
        }
    }
    
    func addPhoneViewConstraint(){
        setupBackgroundView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.3);
            
        }

        userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.setupBackgroundView.mas_top).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userIDLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }
        passwordLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userNameLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.passwordLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        userIDTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.userIDLabel.mas_top);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }

        userNameTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.userNameLabel.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }

        passwordTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.passwordLabel.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }
        administratorButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.administratorLabel.mas_top);
            make.right.equalTo(self.userNameTextField.mas_right);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.administratorLabel.mas_height);
            
        }

        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        deletButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(15);
            make.left.equalTo(self.saveButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(15);
            make.left.equalTo(self.deletButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

    }
    
    func addViewConstraint(){
        setupBackgroundView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(320);
            
        }
        
        userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.setupBackgroundView.mas_top).with.offset(25);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userIDLabel.mas_bottom).with.offset(36);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        passwordLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userNameLabel.mas_bottom).with.offset(36);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.passwordLabel.mas_bottom).with.offset(36);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(160);
            make.height.equalTo(40);
        }
        
        userIDTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.userIDLabel.mas_top);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        
        userNameTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.userNameLabel.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        
        passwordTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.passwordLabel.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        administratorButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.administratorLabel.mas_top);
            make.right.equalTo(self.userNameTextField.mas_right);
            make.width.equalTo(100);
            make.height.equalTo(self.administratorLabel.mas_height);
            
        }
        
        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(118);
            make.height.equalTo(32);
        }
        
        deletButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(35);
            make.left.equalTo(self.saveButton.mas_right).with.offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }
        
        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(35);
            make.left.equalTo(self.deletButton.mas_right).with.offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
