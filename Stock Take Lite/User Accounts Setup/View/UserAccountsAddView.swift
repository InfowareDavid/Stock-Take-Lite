
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
        userIDTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        userIDTextField.borderStyle = UITextBorderStyle.none;
        userIDTextField.font = FONT25()
        userIDTextField.minimumFontSize = 0.8;
        userIDTextField.sizeToFit();
        self.addSubview(userIDTextField);
        
        userNameTextField = UITextField();
        userNameTextField.layer.borderWidth = 1;
        userNameTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        userNameTextField.borderStyle = UITextBorderStyle.none;
        userNameTextField.font = FONT25()
        userNameTextField.minimumFontSize = 0.8;
        userNameTextField.sizeToFit();
        self.addSubview(userNameTextField);
        
        passwordTextField = UITextField();
        passwordTextField.layer.borderWidth = 1;
        passwordTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        passwordTextField.borderStyle = UITextBorderStyle.none;
        passwordTextField.font = FONT25()
        passwordTextField.minimumFontSize = 0.8;
        passwordTextField.sizeToFit();
        self.addSubview(passwordTextField);
       
        administratorButton = UISegmentedControl();
        administratorButton.insertSegment(withTitle: localString("off"), at: 0, animated: false);
        administratorButton.insertSegment(withTitle: "", at: 1, animated: false);
        administratorButton.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        administratorButton.layer.borderWidth = 1;
        administratorButton.layer.masksToBounds = true;
        administratorButton.layer.cornerRadius = 5;
        administratorButton.selectedSegmentIndex = 0;
        self.addSubview(administratorButton);
        
        saveButton = UIButton(type: UIButtonType.system);
        saveButton.setTitle(localString("save"), for: UIControlState());
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        saveButton.titleLabel?.font = FONT25()
        saveButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(saveButton);
        
        deletButton = UIButton(type: UIButtonType.system);
        deletButton.setTitle(localString("delete"), for: UIControlState());
        deletButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        deletButton.titleLabel?.font = FONT25()
        deletButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(deletButton);
        
        cancelButton = UIButton(type: UIButtonType.system);
        cancelButton.setTitle(localString("cancel"), for: UIControlState());
        cancelButton.setBackgroundImage(UIImage(named:"buttom_1"), for: UIControlState())
        cancelButton.titleLabel?.font = FONT25()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(cancelButton);
        if DEVICE == .phone{
            addPhoneViewConstraint()
        }else{
            addViewConstraint()
        }
    }
    
    func addPhoneViewConstraint(){
        setupBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.3);
            
        }

        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.setupBackgroundView.snp.top).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userIDLabel.snp.bottom).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        administratorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        userIDTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.userIDLabel.snp.top);
            make.left.equalTo(self.userIDLabel.snp.right).offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }

        userNameTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.userNameLabel.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }

        passwordTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.passwordLabel.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(5);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(25);
            
        }
        administratorButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.administratorLabel.snp.top);
            make.right.equalTo(self.userNameTextField.snp.right);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.administratorLabel.snp.height);
            
        }

        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        deletButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(15);
            make.left.equalTo(self.saveButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(15);
            make.left.equalTo(self.deletButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }

    }
    
    func addViewConstraint(){
        setupBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(320);
            
        }
        
        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.setupBackgroundView.snp.top).offset(25);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userIDLabel.snp.bottom).offset(36);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(36);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        administratorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(36);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(160);
            make.height.equalTo(40);
        }
        
        userIDTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.userIDLabel.snp.top);
            make.left.equalTo(self.userIDLabel.snp.right).offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        
        userNameTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.userNameLabel.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.passwordLabel.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(20);
            make.width.equalTo(235);
            make.height.equalTo(35);
            
        }
        administratorButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.administratorLabel.snp.top);
            make.right.equalTo(self.userNameTextField.snp.right);
            make.width.equalTo(100);
            make.height.equalTo(self.administratorLabel.snp.height);
            
        }
        
        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(32);
        }
        
        deletButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(35);
            make.left.equalTo(self.saveButton.snp.right).offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }
        
        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(35);
            make.left.equalTo(self.deletButton.snp.right).offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
