//
//  MainView.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 7/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class MainView: BaseView {
    
    var     topView:                                UIImageView!;
    var     topViewLabel:                           UILabel!;
    var     topViewImage:                           UIImage!;
    var     mainMenuLabel:                          UILabel!;
    var     mainMenuBottomLine:                     UILabel!;
    var     middlelineLabel:                        UILabel!;
    var     quantityImportButton:                   UIButton!;
    var     quantityImportLabel:                    UILabel!;
    var     countingEntryButton:                    UIButton!;
    var     countingEntryLabel:                     UILabel!;
    var     countingEnquiryButton:                  UIButton!;
    var     countingEnquiryLabel:                   UILabel!;
    var     quantityExportButton:                   UIButton!;
    var     quantityExportLabel:                    UILabel!;
    var     recordsRemovalButton:                   UIButton!;
    var     recordsRemovalLabel:                    UILabel!;
    var     userAccountsSetupButton:                UIButton!;
    var     userAccountsSetupLabel:                 UILabel!;
    var     ftpServerConnectionSetupButton:         UIButton!;
    var     ftpServerConnectionSetupLabel:          UILabel!;
    var     bluetoothButton:                        UIButton!;
    var     bluetoothLabel:                         UILabel!;
    var     cameraScanButton:                       UIButton!;
    var     cameraScanLabel:                        UILabel!;
    var     emailButton:                            UIButton!
    var     emailLabel:                             UILabel!
    var     logoutButton:                           UIButton!;
    var     helpButton:                             UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        topViewImage = UIImage(named: "bar");
        topView = UIImageView(image: topViewImage);
        topView.userInteractionEnabled = true;
        self.addSubview(topView);
        
        
        
        topViewLabel = UILabel();
        #if LITE_VERSION
            topViewLabel.text = localString("mTitle");
        #elseif PRO_VERSION
            topViewLabel.text = localString("mTitle_pro");
        #elseif ENTERPRISE_VERSION
            topViewLabel.text = localString("mTitle_ent");
        #endif
        topViewLabel.textColor = self.colorWithString("#FFFFFF");
        topViewLabel.backgroundColor = UIColor.clearColor();
        if DEVICE == .Phone{
            topViewLabel.font = UIFont.systemFontOfSize(20, weight: 0.25);

        }else{
            topViewLabel.font = UIFont.systemFontOfSize(40, weight: 0.5);
        }
        topView.addSubview(topViewLabel);
        
        
        mainMenuLabel = UILabel();
        mainMenuLabel.text = localString("mMainMenu");
        mainMenuLabel.textColor = self.colorWithString("#7B7C7F");
        if DEVICE == .Phone{
            mainMenuLabel.font = UIFont.systemFontOfSize(15, weight: 0.15);

        }else{
            mainMenuLabel.font = UIFont.systemFontOfSize(30, weight: 0.3);

        }
        self.addSubview(mainMenuLabel);
        
      
        if DEVICE == .Phone{
            mainMenuBottomLine = UILabel(frame: CGRectMake(0, 98, SCREENWIDTH, 1));
            
        }else{
            mainMenuBottomLine = UILabel(frame: CGRectMake(0, 172, SCREENWIDTH, 1));
            
        }
        mainMenuBottomLine.backgroundColor = UIColor.blackColor();
        self.addSubview(mainMenuBottomLine);
        
        quantityImportButton = UIButton(type: UIButtonType.Custom);
        quantityImportButton.setImage(UIImage(named: "import"), forState: UIControlState.Normal);
        self.addSubview(quantityImportButton);
        
        
        countingEntryButton = UIButton(type: UIButtonType.Custom);
        countingEntryButton.setImage(UIImage(named: "entry"), forState:UIControlState.Normal );
        self.addSubview(countingEntryButton);
       
        
        countingEnquiryButton = UIButton(type: UIButtonType.Custom);
        countingEnquiryButton.setImage(UIImage(named: "enquiry"), forState: UIControlState.Normal);
        self.addSubview(countingEnquiryButton);
        
        
        quantityExportButton = UIButton(type: UIButtonType.Custom);
        quantityExportButton.setImage(UIImage(named: "export"), forState: UIControlState.Normal)
        self.addSubview(quantityExportButton);
        
        recordsRemovalButton = UIButton(type: UIButtonType.Custom);
        recordsRemovalButton.setImage(UIImage(named: "removal"), forState: UIControlState.Normal);
        self.addSubview(recordsRemovalButton);
        
        quantityImportLabel = UILabel();
        quantityImportLabel.text = localString("mImport");
        quantityImportLabel.textColor = self.colorWithString("#231F20");
        quantityImportLabel.textAlignment = NSTextAlignment.Center;
        quantityImportLabel.font = FONT20()
        quantityImportLabel.numberOfLines = 0;
        self.addSubview(quantityImportLabel);
       
        countingEntryLabel = UILabel();
        countingEntryLabel.text = localString("mEntry");
        countingEntryLabel.textColor = self.colorWithString("#231F20");
        countingEntryLabel.textAlignment = NSTextAlignment.Center;
        countingEntryLabel.font = FONT20()
        countingEntryLabel.numberOfLines = 0;
        self.addSubview(countingEntryLabel);
       
        
        countingEnquiryLabel = UILabel();
        countingEnquiryLabel.text = localString("mEnquirty");
        countingEnquiryLabel.textColor = self.colorWithString("#231F20");
        countingEnquiryLabel.textAlignment = NSTextAlignment.Center;
        countingEnquiryLabel.font = FONT20()
        countingEnquiryLabel.numberOfLines = 0;
        self.addSubview(countingEnquiryLabel);
        
        
        quantityExportLabel = UILabel();
        quantityExportLabel.text = localString("mExport");
        quantityExportLabel.textColor = self.colorWithString("#231F20");
        quantityExportLabel.textAlignment = NSTextAlignment.Center;
        quantityExportLabel.font = FONT20()
        quantityExportLabel.numberOfLines = 0;
        self.addSubview(quantityExportLabel);
        
        recordsRemovalLabel = UILabel();
        recordsRemovalLabel.text = localString("mRemove");
        recordsRemovalLabel.textColor = self.colorWithString("#231F20");
        recordsRemovalLabel.textAlignment = NSTextAlignment.Center;
        recordsRemovalLabel.font = FONT20()
        recordsRemovalLabel.numberOfLines = 0;
        self.addSubview(recordsRemovalLabel);
        
        middlelineLabel = UILabel();
        middlelineLabel.backgroundColor = UIColor.blackColor();
        self.addSubview(middlelineLabel);
        
        userAccountsSetupButton = UIButton(type: UIButtonType.Custom);
        userAccountsSetupButton.setImage(UIImage(named: "account_setup"), forState: UIControlState.Normal);
        self.addSubview(userAccountsSetupButton);
        
        ftpServerConnectionSetupButton = UIButton(type: UIButtonType.Custom);
        ftpServerConnectionSetupButton.setImage(UIImage(named: "ftp_setup"), forState: UIControlState.Normal);
        self.addSubview(ftpServerConnectionSetupButton);
        
        emailButton = UIButton(type: .Custom)
        emailButton.setImage(UIImage(named: "email"), forState: .Normal)
        self.addSubview(emailButton)
        
        #if ENTERPRISE_VERSION
            cameraScanButton = UIButton(type: .Custom);
            cameraScanButton.setImage(UIImage(named: "camera"), forState: .Normal);
            self.addSubview(cameraScanButton);
            
            cameraScanLabel = UILabel();
            cameraScanLabel.text = localString("mCamera");
            cameraScanLabel.textColor = self.colorWithString("#231F20");
            cameraScanLabel.textAlignment = NSTextAlignment.Center;
            cameraScanLabel.font = FONT20();
            cameraScanLabel.numberOfLines = 0;
            self.addSubview(cameraScanLabel);
           
            
            bluetoothButton = UIButton(type: UIButtonType.Custom);
            bluetoothButton.setImage(UIImage(named: "bluetooth"), forState: UIControlState.Normal);
            self.addSubview(bluetoothButton);
           
            
            bluetoothLabel = UILabel();
            bluetoothLabel.text = localString("mBluetooth");
            bluetoothLabel.textColor = self.colorWithString("#231F20");
            bluetoothLabel.textAlignment = NSTextAlignment.Center;
            bluetoothLabel.font = FONT20();
            bluetoothLabel.numberOfLines = 0;
            self.addSubview(bluetoothLabel);
           
        #else
            bluetoothButton = UIButton(type: UIButtonType.Custom);
            bluetoothButton.setImage(UIImage(named: "bluetooth"), forState: UIControlState.Normal);
            self.addSubview(bluetoothButton);
           
            
            bluetoothLabel = UILabel();
            bluetoothLabel.text = localString("mBluetooth");
            bluetoothLabel.textColor = self.colorWithString("#231F20");
            bluetoothLabel.textAlignment = NSTextAlignment.Center;
            bluetoothLabel.font = FONT20();
            bluetoothLabel.numberOfLines = 0;
            self.addSubview(bluetoothLabel);
            
        #endif
        
        userAccountsSetupLabel = UILabel();
        userAccountsSetupLabel.text = localString("mUserAccountsSetup");
        userAccountsSetupLabel.textColor = self.colorWithString("#231F20");
        userAccountsSetupLabel.textAlignment = NSTextAlignment.Center;
        userAccountsSetupLabel.font = FONT20();
        userAccountsSetupLabel.numberOfLines = 0;
        self.addSubview(userAccountsSetupLabel);
       
        
        ftpServerConnectionSetupLabel = UILabel();
        ftpServerConnectionSetupLabel.text = localString("mFTPServer");
        ftpServerConnectionSetupLabel.textColor = self.colorWithString("#231F20");
        ftpServerConnectionSetupLabel.textAlignment = NSTextAlignment.Center;
        ftpServerConnectionSetupLabel.font = FONT20();
        ftpServerConnectionSetupLabel.numberOfLines = 0;
        self.addSubview(ftpServerConnectionSetupLabel);
       
        emailLabel = UILabel()
        emailLabel.text = localString("mEmail");
        emailLabel.textColor = self.colorWithString("#231F20");
        emailLabel.textAlignment = NSTextAlignment.Center;
        emailLabel.font = FONT20();
        emailLabel.numberOfLines = 0;
        self.addSubview(emailLabel);

        
        logoutButton = UIButton(type: UIButtonType.Custom);
        logoutButton.setImage(UIImage(named: "logout"), forState: UIControlState.Normal);
        self.topView.addSubview(logoutButton);
        
        helpButton = UIButton(type: UIButtonType.System);
        helpButton.setTitle(localString("helpButton"), forState: UIControlState.Normal);
        helpButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        helpButton.titleLabel?.font = FONT20();
        self.topView.addSubview(helpButton);
        if DEVICE == .Phone{
            self.addPhoneMainViewConstraint()
        }else{
            self.addMainViewConstraint()
        }
    }
    
    
    func addPhoneMainViewConstraint(){
        topView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.mas_top).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(64);
        }
        
        topViewLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.topView.mas_left).with.offset(SCREENWIDTH/10);
            make.top.equalTo(self.topView.mas_top).with.offset(0);
            make.right.equalTo(self.topView.mas_right).with.offset(0);
            make.height.equalTo(64);
            
        }
        mainMenuLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.topViewLabel.mas_bottom);
            make.left.equalTo(self.topViewLabel.mas_left);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(30);
        }
        
        quantityImportButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/20 * 3);
            make.top.equalTo(self.mainMenuLabel.mas_bottom).with.offset(15);
            make.width.equalTo(43);
            make.height.equalTo(43);
        }
        
        countingEntryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_top).with.offset(0);
            make.left.equalTo(self.quantityImportButton.mas_right).with.offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        countingEnquiryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_top);
            make.left.equalTo(self.countingEntryButton.mas_right).with.offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
            
        }
        
        quantityExportButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_bottom).with.offset(45);
            make.left.equalTo(self.quantityImportButton.mas_left);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        recordsRemovalButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.quantityExportButton.mas_top);
            make.left.equalTo(self.countingEntryButton.mas_left);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        quantityImportLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityImportButton.mas_centerX);
            make.top.equalTo(self.quantityImportButton.mas_bottom).with.offset(5);
            make.width.equalTo(75);
            make.height.equalTo(25);
        }
        
        countingEntryLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerX.equalTo(self.countingEntryButton.mas_centerX);
            make.top.equalTo(self.quantityImportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        countingEnquiryLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerX.equalTo(self.countingEnquiryButton.mas_centerX);
            make.top.equalTo(self.quantityImportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(10);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        quantityExportLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityExportButton.mas_centerX);
            make.top.equalTo(self.quantityExportButton.mas_bottom).with.offset(5);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(5);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        
        recordsRemovalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.recordsRemovalButton.mas_centerX);
            make.top.equalTo(self.quantityExportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        middlelineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityExportLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(1);
        }
        userAccountsSetupButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityImportButton.mas_centerX);
            make.top.equalTo(self.middlelineLabel.mas_bottom).with.offset(10);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        ftpServerConnectionSetupButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userAccountsSetupButton.mas_top);
            make.left.equalTo(self.userAccountsSetupButton.mas_right).with.offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        #if ENTERPRISE_VERSION
            cameraScanButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.userAccountsSetupButton.mas_bottom).with.offset(45);
                make.left.equalTo(self.userAccountsSetupButton.mas_left);
                make.width.equalTo(self.userAccountsSetupButton.mas_width);
                make.height.equalTo(self.userAccountsSetupButton.mas_height);
                
            }
            
            cameraScanLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.cameraScanButton.mas_centerX);
                make.top.equalTo(self.cameraScanButton.mas_bottom).with.offset(5);
                make.width.equalTo(self.quantityImportLabel.mas_width);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }
            
            bluetoothButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.cameraScanButton.mas_top);
                make.left.equalTo(self.ftpServerConnectionSetupButton.mas_left);
                make.width.equalTo(self.quantityImportButton.mas_width);
                make.height.equalTo(self.quantityImportButton.mas_height);
            }
            bluetoothLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.bluetoothButton.mas_centerX);
                make.top.equalTo(self.cameraScanLabel.mas_top);
                make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }
            
        #else
            
            bluetoothButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.quantityExportButton.mas_top);
                make.left.equalTo(self.countingEnquiryButton.mas_left);
                make.width.equalTo(self.quantityImportButton.mas_width);
                make.height.equalTo(self.quantityImportButton.mas_height);
            }
            
            bluetoothLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.bluetoothButton.mas_centerX);
                make.top.equalTo(self.quantityExportLabel.mas_top);
                make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }
            
        #endif
        
        emailButton.mas_makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.mas_top);
            make.left.equalTo(self.ftpServerConnectionSetupButton.mas_right).with.offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        userAccountsSetupLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.userAccountsSetupButton.mas_centerX);
            make.top.equalTo(self.userAccountsSetupButton.mas_bottom).with.offset(5);
            make.width.equalTo(self.quantityImportLabel.mas_width);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        ftpServerConnectionSetupLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userAccountsSetupLabel.mas_top);
            make.centerX.equalTo(self.ftpServerConnectionSetupButton.mas_centerX);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(10);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        emailLabel.mas_makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.mas_top);
            make.centerX.equalTo(self.emailButton.mas_centerX);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(10);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerY.equalTo(self.topViewLabel.mas_centerY)
            make.right.equalTo(self.mas_right).with.offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
        }
        
        helpButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.bottom.equalTo(self.logoutButton.mas_bottom).with.offset(10);
            make.left.equalTo(self.logoutButton.mas_right).with.offset(15);
            make.width.equalTo(25);
            make.height.equalTo(25);
            
        }
        
        
    }

    
    func addMainViewConstraint(){
        topView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.mas_top).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(109);
        }
        
        topViewLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.left.equalTo(self.topView.mas_left).with.offset(109);
            make.top.equalTo(self.topView.mas_top).with.offset(0);
            make.right.equalTo(self.topView.mas_right).with.offset(0);
            make.height.equalTo(109);
            
        }
        mainMenuLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.mas_top).with.offset(109);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(62.5);
        }
        
        quantityImportButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.left.equalTo(self.mas_left).with.offset(120);
            make.top.equalTo(self.mas_top).with.offset(218.5);
            make.width.equalTo(85.5);
            make.height.equalTo(85.5);
        }
        
        countingEntryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_top).with.offset(0);
            make.left.equalTo(self.quantityImportButton.mas_right).with.offset(135.5);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        countingEnquiryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_top);
            make.left.equalTo(self.countingEntryButton.mas_right).with.offset(135.5);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
            
        }
        
        quantityExportButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityImportButton.mas_bottom).with.offset(112.5);
            make.left.equalTo(self.quantityImportButton.mas_left);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        recordsRemovalButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.quantityExportButton.mas_top);
            make.left.equalTo(self.countingEntryButton.mas_left);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }

        quantityImportLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityImportButton.mas_centerX);
            make.top.equalTo(self.quantityImportButton.mas_bottom).with.offset(17);
            make.width.equalTo(154);
            make.height.equalTo(48);
        }
        
        countingEntryLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerX.equalTo(self.countingEntryButton.mas_centerX);
            make.top.equalTo(self.quantityImportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        countingEnquiryLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerX.equalTo(self.countingEnquiryButton.mas_centerX);
            make.top.equalTo(self.quantityImportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(20);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }
        quantityExportLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityExportButton.mas_centerX);
            make.top.equalTo(self.quantityExportButton.mas_bottom).with.offset(17);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(5);
            make.height.equalTo(self.quantityImportLabel.mas_height);
            
        }

        recordsRemovalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.recordsRemovalButton.mas_centerX);
            make.top.equalTo(self.quantityExportLabel.mas_top);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        middlelineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.quantityExportButton.mas_bottom).with.offset(115);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(1);
        }
        userAccountsSetupButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.quantityImportButton.mas_centerX);
            make.top.equalTo(self.middlelineLabel.mas_bottom).with.offset(45);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        ftpServerConnectionSetupButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userAccountsSetupButton.mas_top);
            make.left.equalTo(self.userAccountsSetupButton.mas_right).with.offset(135.5);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        #if ENTERPRISE_VERSION
            cameraScanButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.userAccountsSetupButton.mas_bottom).with.offset(112.5);
                make.left.equalTo(self.userAccountsSetupButton.mas_left);
                make.width.equalTo(self.userAccountsSetupButton.mas_width);
                make.height.equalTo(self.userAccountsSetupButton.mas_height);
                
            }
            
            cameraScanLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.cameraScanButton.mas_centerX);
                make.top.equalTo(self.cameraScanButton.mas_bottom).with.offset(17);
                make.width.equalTo(self.quantityImportLabel.mas_width);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }
            
            bluetoothButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.cameraScanButton.mas_top);
                make.left.equalTo(self.ftpServerConnectionSetupButton.mas_left);
                make.width.equalTo(self.quantityImportButton.mas_width);
                make.height.equalTo(self.quantityImportButton.mas_height);
            }
            bluetoothLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.bluetoothButton.mas_centerX);
                make.top.equalTo(self.cameraScanLabel.mas_top);
                make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }

        #else
            
            bluetoothButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.quantityExportButton.mas_top);
                make.left.equalTo(self.countingEnquiryButton.mas_left);
                make.width.equalTo(self.quantityImportButton.mas_width);
                make.height.equalTo(self.quantityImportButton.mas_height);
            }
            
            bluetoothLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.centerX.equalTo(self.bluetoothButton.mas_centerX);
                make.top.equalTo(self.quantityExportLabel.mas_top);
                make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(40);
                make.height.equalTo(self.quantityImportLabel.mas_height);
            }
        
        #endif
        
        emailButton.mas_makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.mas_top);
            make.left.equalTo(self.ftpServerConnectionSetupButton.mas_right).with.offset(135.5);
            make.width.equalTo(self.quantityImportButton.mas_width);
            make.height.equalTo(self.quantityImportButton.mas_height);
        }
        
        userAccountsSetupLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.centerX.equalTo(self.userAccountsSetupButton.mas_centerX);
            make.top.equalTo(self.userAccountsSetupButton.mas_bottom).with.offset(17);
            make.width.equalTo(self.quantityImportLabel.mas_width);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        ftpServerConnectionSetupLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userAccountsSetupLabel.mas_top);
            make.centerX.equalTo(self.ftpServerConnectionSetupButton.mas_centerX);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(10);
            make.height.equalTo(self.quantityImportLabel.mas_height);
        }
        
        emailLabel.mas_makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.mas_top);
            make.centerX.equalTo(self.emailButton.mas_centerX);
            make.width.equalTo(self.quantityImportLabel.mas_width).with.offset(10);
            make.height.equalTo(self.quantityImportLabel.mas_height);

        }
        
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top).with.offset(27);
            make.left.equalTo(self.mas_left).with.offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
        }
        
        helpButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.bottom.equalTo(self.logoutButton.mas_bottom).with.offset(10);
            make.left.equalTo(self.logoutButton.mas_right).with.offset(30);
            make.width.equalTo(50);
            make.height.equalTo(50);
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
