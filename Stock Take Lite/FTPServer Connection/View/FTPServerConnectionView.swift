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
        ftpServerTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        ftpServerTextField.borderStyle = UITextBorderStyle.None;
        
        ftpServerTextField.font = FONT20();
        ftpServerTextField.minimumFontSize = 0.8;
        ftpServerTextField.sizeToFit();
        self.addSubview(ftpServerTextField);
        
        ftpuserTextField = UITextField();
        ftpuserTextField.layer.borderWidth = 1;
        ftpuserTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        ftpuserTextField.borderStyle = UITextBorderStyle.None;
        ftpuserTextField.font = FONT20();
        ftpuserTextField.minimumFontSize = 0.8;
        ftpuserTextField.sizeToFit();
        self.addSubview(ftpuserTextField);
       
        
        passwordTextField = UITextField();
        passwordTextField.layer.borderWidth = 1;
        passwordTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        passwordTextField.borderStyle = UITextBorderStyle.None;
        passwordTextField.font = FONT20();
        passwordTextField.minimumFontSize = 0.8;
        passwordTextField.sizeToFit();
        self.addSubview(passwordTextField);
        
        saveButton = UIButton(type: UIButtonType.System);
        saveButton.setTitle(localString("save"), forState: UIControlState.Normal);
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        saveButton.titleLabel?.font = FONT25();
        saveButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(saveButton);
        
        cancelButton = UIButton(type: UIButtonType.System);
        cancelButton.setTitle(localString("cancel"), forState: UIControlState.Normal);
        cancelButton.setBackgroundImage(UIImage(named:"buttom_1"), forState: UIControlState.Normal)
        cancelButton.titleLabel?.font = FONT25()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(cancelButton);
        
        if DEVICE == .Phone{
            addPhoneFTPServerConstraint()
        }else{
            addFTPServerConstraint()
        }
    }
    
    func addPhoneFTPServerConstraint(){
        setupBackgroundView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
        }
        
        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.setupBackgroundView.mas_top).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        ftpuserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        
        passwordLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.ftpuserLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }
        
        
        ftpServerTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_top);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        
        ftpuserTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpuserLabel.mas_top);
            make.left.equalTo(self.ftpuserLabel.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        passwordTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.passwordLabel.mas_top);
            make.left.equalTo(self.ftpuserLabel.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
            
        }
        
        
        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.17);
            make.height.equalTo(25);
        }
        
        
        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(10);
            make.left.equalTo(self.saveButton.mas_right).with.offset(25);
            make.width.equalTo(SCREENWIDTH * 0.17);
            make.height.equalTo(25);
        }
        
    }

    
    func addFTPServerConstraint(){
        setupBackgroundView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(240);
        }

        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.setupBackgroundView.mas_top).with.offset(25);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }

        ftpuserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(36);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        

        passwordLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.ftpuserLabel.mas_bottom).with.offset(36);
            make.left.equalTo(self.setupBackgroundView.mas_left).with.offset(111);
            make.width.equalTo(160);
            make.height.equalTo(40);
        }
        

        ftpServerTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_top);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }

        ftpuserTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpuserLabel.mas_top);
            make.left.equalTo(self.ftpuserLabel.mas_right).with.offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }
        passwordTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.passwordLabel.mas_top);
            make.left.equalTo(self.ftpuserLabel.mas_right).with.offset(40);
            make.width.equalTo(275);
            make.height.equalTo(35);
            
        }
        

        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(118);
            make.height.equalTo(32);
        }
        

        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.setupBackgroundView.mas_bottom).with.offset(35);
            make.left.equalTo(self.saveButton.mas_right).with.offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
