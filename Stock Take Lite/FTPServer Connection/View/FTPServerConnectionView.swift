//
//  FTPServerConnectionView.swift
//  Stock Take Lite
//
//  Created by infoware on 27/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class FTPServerConnectionView: QuantityImportBaseView {
    var         setupBackgroundView:                        UIView!;
    var         ftpServerLabel:                             UILabel!;
    var         ftpuserLabel:                               UILabel!;
    var         passwordLabel:                              UILabel!;
    var         passwordTextField:                          UITextField!;
    var         ftpServerTextField:                         UITextField!;
    var         ftpuserTextField:                           UITextField!;
    var         saveButton:                                 UIButton!
    var         cancelButton:                               UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.secondeTopLabel.text = localString("fsTitle");
        
        setupBackgroundView = UIView();
        setupBackgroundView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(setupBackgroundView);
        
        ftpServerLabel = UILabel();
        ftpServerLabel.text = localString("fsFTPServer");
        ftpServerLabel.textColor = self.colorWithString("#6D6E71");
        ftpServerLabel.font = FONT25();
        self.setupBackgroundView.addSubview(ftpServerLabel);
        
        ftpuserLabel = UILabel();
        ftpuserLabel.text = localString("fsFTPUser");
        ftpuserLabel.textColor = self.colorWithString("#6D6E71");
        ftpuserLabel.font = FONT25();
        self.setupBackgroundView.addSubview(ftpuserLabel);
        
        passwordLabel = UILabel();
        passwordLabel.text = localString("fsFTPPassword");
        passwordLabel.textColor = self.colorWithString("#6D6E71");
        passwordLabel.font = FONT25();
        self.setupBackgroundView.addSubview(passwordLabel);
        
        ftpServerTextField = UITextField();
        ftpServerTextField.layer.borderWidth = 1;
        ftpServerTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        ftpServerTextField.borderStyle = UITextBorderStyle.none;
        
        ftpServerTextField.font = FONT20();
        ftpServerTextField.minimumFontSize = 0.8;
        ftpServerTextField.sizeToFit();
        self.addSubview(ftpServerTextField);
        
        ftpuserTextField = UITextField();
        ftpuserTextField.layer.borderWidth = 1;
        ftpuserTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        ftpuserTextField.borderStyle = UITextBorderStyle.none;
        ftpuserTextField.font = FONT20();
        ftpuserTextField.minimumFontSize = 0.8;
        ftpuserTextField.sizeToFit();
        self.addSubview(ftpuserTextField);
       
        
        passwordTextField = UITextField();
        passwordTextField.layer.borderWidth = 1;
        passwordTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        passwordTextField.borderStyle = UITextBorderStyle.none;
        passwordTextField.font = FONT20();
        passwordTextField.minimumFontSize = 0.8;
        passwordTextField.sizeToFit();
        self.addSubview(passwordTextField);
        
        saveButton = UIButton(type: UIButtonType.system);
        saveButton.setTitle(localString("save"), for: UIControlState());
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        saveButton.titleLabel?.font = FONT25();
        saveButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(saveButton);
        
        cancelButton = UIButton(type: UIButtonType.system);
        cancelButton.setTitle(localString("cancel"), for: UIControlState());
        cancelButton.setBackgroundImage(UIImage(named:"buttom_1"), for: UIControlState())
        cancelButton.titleLabel?.font = FONT25()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(cancelButton);
        
        if DEVICE == .phone{
            addPhoneFTPServerConstraint()
        }else{
            addFTPServerConstraint()
        }
    }
    
    func addPhoneFTPServerConstraint(){
        setupBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
        }
        
        ftpServerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.setupBackgroundView.snp.top).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        ftpuserLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpuserLabel.snp.bottom).offset(10);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        
        ftpServerTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.top);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        
        ftpuserTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpuserLabel.snp.top);
            make.left.equalTo(self.ftpuserLabel.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        passwordTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.passwordLabel.snp.top);
            make.left.equalTo(self.ftpuserLabel.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        
        
        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(10);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.17);
            make.height.equalTo(25);
        }
        
        
        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(10);
            make.left.equalTo(self.saveButton.snp.right).offset(25);
            make.width.equalTo(SCREENWIDTH * 0.17);
            make.height.equalTo(25);
        }
        
    }

    
    func addFTPServerConstraint(){
        setupBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(240);
        }

        ftpServerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.setupBackgroundView.snp.top).offset(25);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }

        ftpuserLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(36);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        

        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpuserLabel.snp.bottom).offset(36);
            make.left.equalTo(self.setupBackgroundView.snp.left).offset(111);
            make.width.equalTo(160);
            make.height.equalTo(40);
        }
        

        ftpServerTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.top);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }

        ftpuserTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpuserLabel.snp.top);
            make.left.equalTo(self.ftpuserLabel.snp.right).offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }
        passwordTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.passwordLabel.snp.top);
            make.left.equalTo(self.ftpuserLabel.snp.right).offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }
        

        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(32);
        }
        

        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.setupBackgroundView.snp.bottom).offset(35);
            make.left.equalTo(self.saveButton.snp.right).offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
