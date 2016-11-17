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
        topView.isUserInteractionEnabled = true;
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
        topViewLabel.backgroundColor = UIColor.clear;
        if DEVICE == .phone{
            topViewLabel.font = UIFont.systemFont(ofSize: 20, weight: 0.25);

        }else{
            topViewLabel.font = UIFont.systemFont(ofSize: 40, weight: 0.5);
        }
        topView.addSubview(topViewLabel);
        
        
        mainMenuLabel = UILabel();
        mainMenuLabel.text = localString("mMainMenu");
        mainMenuLabel.textColor = self.colorWithString("#7B7C7F");
        if DEVICE == .phone{
            mainMenuLabel.font = UIFont.systemFont(ofSize: 15, weight: 0.15);

        }else{
            mainMenuLabel.font = UIFont.systemFont(ofSize: 30, weight: 0.3);

        }
        self.addSubview(mainMenuLabel);
        
      
        if DEVICE == .phone{
            mainMenuBottomLine = UILabel(frame: CGRect(x: 0, y: 98, width: SCREENWIDTH, height: 1));
            
        }else{
            mainMenuBottomLine = UILabel(frame: CGRect(x: 0, y: 172, width: SCREENWIDTH, height: 1));
            
        }
        mainMenuBottomLine.backgroundColor = UIColor.black;
        self.addSubview(mainMenuBottomLine);
        
        quantityImportButton = UIButton(type: UIButtonType.custom);
        quantityImportButton.setImage(UIImage(named: "import"), for: UIControlState());
        self.addSubview(quantityImportButton);
        
        
        countingEntryButton = UIButton(type: UIButtonType.custom);
        countingEntryButton.setImage(UIImage(named: "entry"), for:UIControlState() );
        self.addSubview(countingEntryButton);
       
        
        countingEnquiryButton = UIButton(type: UIButtonType.custom);
        countingEnquiryButton.setImage(UIImage(named: "enquiry"), for: UIControlState());
        self.addSubview(countingEnquiryButton);
        
        
        quantityExportButton = UIButton(type: UIButtonType.custom);
        quantityExportButton.setImage(UIImage(named: "export"), for: UIControlState())
        self.addSubview(quantityExportButton);
        
        recordsRemovalButton = UIButton(type: UIButtonType.custom);
        recordsRemovalButton.setImage(UIImage(named: "removal"), for: UIControlState());
        self.addSubview(recordsRemovalButton);
        
        quantityImportLabel = UILabel();
        quantityImportLabel.text = localString("mImport");
        quantityImportLabel.textColor = self.colorWithString("#231F20");
        quantityImportLabel.textAlignment = NSTextAlignment.center;
        quantityImportLabel.font = FONT20()
        quantityImportLabel.numberOfLines = 0;
        self.addSubview(quantityImportLabel);
       
        countingEntryLabel = UILabel();
        countingEntryLabel.text = localString("mEntry");
        countingEntryLabel.textColor = self.colorWithString("#231F20");
        countingEntryLabel.textAlignment = NSTextAlignment.center;
        countingEntryLabel.font = FONT20()
        countingEntryLabel.numberOfLines = 0;
        self.addSubview(countingEntryLabel);
       
        
        countingEnquiryLabel = UILabel();
        countingEnquiryLabel.text = localString("mEnquirty");
        countingEnquiryLabel.textColor = self.colorWithString("#231F20");
        countingEnquiryLabel.textAlignment = NSTextAlignment.center;
        countingEnquiryLabel.font = FONT20()
        countingEnquiryLabel.numberOfLines = 0;
        self.addSubview(countingEnquiryLabel);
        
        
        quantityExportLabel = UILabel();
        quantityExportLabel.text = localString("mExport");
        quantityExportLabel.textColor = self.colorWithString("#231F20");
        quantityExportLabel.textAlignment = NSTextAlignment.center;
        quantityExportLabel.font = FONT20()
        quantityExportLabel.numberOfLines = 0;
        self.addSubview(quantityExportLabel);
        
        recordsRemovalLabel = UILabel();
        recordsRemovalLabel.text = localString("mRemove");
        recordsRemovalLabel.textColor = self.colorWithString("#231F20");
        recordsRemovalLabel.textAlignment = NSTextAlignment.center;
        recordsRemovalLabel.font = FONT20()
        recordsRemovalLabel.numberOfLines = 0;
        self.addSubview(recordsRemovalLabel);
        
        middlelineLabel = UILabel();
        middlelineLabel.backgroundColor = UIColor.black;
        self.addSubview(middlelineLabel);
        
        userAccountsSetupButton = UIButton(type: UIButtonType.custom);
        userAccountsSetupButton.setImage(UIImage(named: "account_setup"), for: UIControlState());
        self.addSubview(userAccountsSetupButton);
        
        ftpServerConnectionSetupButton = UIButton(type: UIButtonType.custom);
        ftpServerConnectionSetupButton.setImage(UIImage(named: "ftp_setup"), for: UIControlState());
        self.addSubview(ftpServerConnectionSetupButton);
        
        emailButton = UIButton(type: .custom)
        emailButton.setImage(UIImage(named: "email"), for: UIControlState())
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
            bluetoothButton = UIButton(type: UIButtonType.custom);
            bluetoothButton.setImage(UIImage(named: "bluetooth"), for: UIControlState());
            self.addSubview(bluetoothButton);
           
            
            bluetoothLabel = UILabel();
            bluetoothLabel.text = localString("mBluetooth");
            bluetoothLabel.textColor = self.colorWithString("#231F20");
            bluetoothLabel.textAlignment = NSTextAlignment.center;
            bluetoothLabel.font = FONT20();
            bluetoothLabel.numberOfLines = 0;
            self.addSubview(bluetoothLabel);
            
        #endif
        
        userAccountsSetupLabel = UILabel();
        userAccountsSetupLabel.text = localString("mUserAccountsSetup");
        userAccountsSetupLabel.textColor = self.colorWithString("#231F20");
        userAccountsSetupLabel.textAlignment = NSTextAlignment.center;
        userAccountsSetupLabel.font = FONT20();
        userAccountsSetupLabel.numberOfLines = 0;
        self.addSubview(userAccountsSetupLabel);
       
        
        ftpServerConnectionSetupLabel = UILabel();
        ftpServerConnectionSetupLabel.text = localString("mFTPServer");
        ftpServerConnectionSetupLabel.textColor = self.colorWithString("#231F20");
        ftpServerConnectionSetupLabel.textAlignment = NSTextAlignment.center;
        ftpServerConnectionSetupLabel.font = FONT20();
        ftpServerConnectionSetupLabel.numberOfLines = 0;
        self.addSubview(ftpServerConnectionSetupLabel);
       
        emailLabel = UILabel()
        emailLabel.text = localString("mEmail");
        emailLabel.textColor = self.colorWithString("#231F20");
        emailLabel.textAlignment = NSTextAlignment.center;
        emailLabel.font = FONT20();
        emailLabel.numberOfLines = 0;
        self.addSubview(emailLabel);

        
        logoutButton = UIButton(type: UIButtonType.custom);
        logoutButton.setImage(UIImage(named: "logout"), for: UIControlState());
        self.topView.addSubview(logoutButton);
        
        helpButton = UIButton(type: UIButtonType.system);
        helpButton.setTitle(localString("helpButton"), for: UIControlState());
        helpButton.setTitleColor(UIColor.white, for: UIControlState());
        helpButton.titleLabel?.font = FONT20();
        self.topView.addSubview(helpButton);
        if DEVICE == .phone{
            self.addPhoneMainViewConstraint()
        }else{
            self.addMainViewConstraint()
        }
    }
    
    
    func addPhoneMainViewConstraint(){
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(0);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(64);
        }
        
        topViewLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.topView.snp.left).offset(SCREENWIDTH/10);
            make.top.equalTo(self.topView.snp.top).offset(0);
            make.right.equalTo(self.topView.snp.right).offset(0);
            make.height.equalTo(64);
            
        }
        mainMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topViewLabel.snp.bottom);
            make.left.equalTo(self.topViewLabel.snp.left);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(30);
        }
        
        quantityImportButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/20 * 3);
            make.top.equalTo(self.mainMenuLabel.snp.bottom).offset(15);
            make.width.equalTo(43);
            make.height.equalTo(43);
        }
        
        countingEntryButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.top).offset(0);
            make.left.equalTo(self.quantityImportButton.snp.right).offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        countingEnquiryButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.top);
            make.left.equalTo(self.countingEntryButton.snp.right).offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
            
        }
        
        quantityExportButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.bottom).offset(45);
            make.left.equalTo(self.quantityImportButton.snp.left);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        recordsRemovalButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.quantityExportButton.snp.top);
            make.left.equalTo(self.countingEntryButton.snp.left);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        quantityImportLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityImportButton.snp.centerX);
            make.top.equalTo(self.quantityImportButton.snp.bottom).offset(5);
            make.width.equalTo(75);
            make.height.equalTo(25);
        }
        
        countingEntryLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.countingEntryButton.snp.centerX);
            make.top.equalTo(self.quantityImportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        countingEnquiryLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.countingEnquiryButton.snp.centerX);
            make.top.equalTo(self.quantityImportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(10);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        quantityExportLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityExportButton.snp.centerX);
            make.top.equalTo(self.quantityExportButton.snp.bottom).offset(5);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(5);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        
        recordsRemovalLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.recordsRemovalButton.snp.centerX);
            make.top.equalTo(self.quantityExportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        middlelineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityExportLabel.snp.bottom).offset(10);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(1);
        }
        userAccountsSetupButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityImportButton.snp.centerX);
            make.top.equalTo(self.middlelineLabel.snp.bottom).offset(10);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        ftpServerConnectionSetupButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.snp.top);
            make.left.equalTo(self.userAccountsSetupButton.snp.right).offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        #if ENTERPRISE_VERSION
            cameraScanButton.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.userAccountsSetupButton.snp.bottom).offset(45);
                make.left.equalTo(self.userAccountsSetupButton.snp.left);
                make.width.equalTo(self.userAccountsSetupButton.snp.width);
                make.height.equalTo(self.userAccountsSetupButton.snp.height);
                
            }
            
            cameraScanLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.cameraScanButton.snp.centerX);
                make.top.equalTo(self.cameraScanButton.snp.bottom).offset(5);
                make.width.equalTo(self.quantityImportLabel.snp.width);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }
            
            bluetoothButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.cameraScanButton.snp.top);
                make.left.equalTo(self.ftpServerConnectionSetupButton.snp.left);
                make.width.equalTo(self.quantityImportButton.snp.width);
                make.height.equalTo(self.quantityImportButton.snp.height);
            }
            bluetoothLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.bluetoothButton.snp.centerX);
                make.top.equalTo(self.cameraScanLabel.snp.top);
                make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }
            
        #else
            
            bluetoothButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.quantityExportButton.snp.top);
                make.left.equalTo(self.countingEnquiryButton.snp.left);
                make.width.equalTo(self.quantityImportButton.snp.width);
                make.height.equalTo(self.quantityImportButton.snp.height);
            }
            
            bluetoothLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.bluetoothButton.snp.centerX);
                make.top.equalTo(self.quantityExportLabel.snp.top);
                make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }
            
        #endif
        
        emailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.snp.top);
            make.left.equalTo(self.ftpServerConnectionSetupButton.snp.right).offset(SCREENWIDTH/20 * 3);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        userAccountsSetupLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.userAccountsSetupButton.snp.centerX);
            make.top.equalTo(self.userAccountsSetupButton.snp.bottom).offset(5);
            make.width.equalTo(self.quantityImportLabel.snp.width);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        ftpServerConnectionSetupLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.snp.top);
            make.centerX.equalTo(self.ftpServerConnectionSetupButton.snp.centerX);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(10);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.snp.top);
            make.centerX.equalTo(self.emailButton.snp.centerX);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(10);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        
        logoutButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.topViewLabel.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
        }
        
        helpButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.logoutButton.snp.bottom).offset(10);
            make.left.equalTo(self.logoutButton.snp.right).offset(15);
            make.width.equalTo(25);
            make.height.equalTo(25);
            
        }
        
        
    }

    
    func addMainViewConstraint(){
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(0);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(109);
        }
        
        topViewLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.topView.snp.left).offset(109);
            make.top.equalTo(self.topView.snp.top).offset(0);
            make.right.equalTo(self.topView.snp.right).offset(0);
            make.height.equalTo(109);
            
        }
        mainMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(109);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(62.5);
        }
        
        quantityImportButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(120);
            make.top.equalTo(self.snp.top).offset(218.5);
            make.width.equalTo(85.5);
            make.height.equalTo(85.5);
        }
        
        countingEntryButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.top).offset(0);
            make.left.equalTo(self.quantityImportButton.snp.right).offset(135.5);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        countingEnquiryButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.top);
            make.left.equalTo(self.countingEntryButton.snp.right).offset(135.5);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
            
        }
        
        quantityExportButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityImportButton.snp.bottom).offset(112.5);
            make.left.equalTo(self.quantityImportButton.snp.left);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        recordsRemovalButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.quantityExportButton.snp.top);
            make.left.equalTo(self.countingEntryButton.snp.left);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }

        quantityImportLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityImportButton.snp.centerX);
            make.top.equalTo(self.quantityImportButton.snp.bottom).offset(17);
            make.width.equalTo(154);
            make.height.equalTo(48);
        }
        
        countingEntryLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.countingEntryButton.snp.centerX);
            make.top.equalTo(self.quantityImportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        countingEnquiryLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.countingEnquiryButton.snp.centerX);
            make.top.equalTo(self.quantityImportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(20);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }
        quantityExportLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityExportButton.snp.centerX);
            make.top.equalTo(self.quantityExportButton.snp.bottom).offset(17);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(5);
            make.height.equalTo(self.quantityImportLabel.snp.height);
            
        }

        recordsRemovalLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.recordsRemovalButton.snp.centerX);
            make.top.equalTo(self.quantityExportLabel.snp.top);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        middlelineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.quantityExportButton.snp.bottom).offset(115);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(1);
        }
        userAccountsSetupButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.quantityImportButton.snp.centerX);
            make.top.equalTo(self.middlelineLabel.snp.bottom).offset(45);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        ftpServerConnectionSetupButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.snp.top);
            make.left.equalTo(self.userAccountsSetupButton.snp.right).offset(135.5);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        #if ENTERPRISE_VERSION
            cameraScanButton.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.userAccountsSetupButton.snp.bottom).offset(112.5);
                make.left.equalTo(self.userAccountsSetupButton.snp.left);
                make.width.equalTo(self.userAccountsSetupButton.snp.width);
                make.height.equalTo(self.userAccountsSetupButton.snp.height);
                
            }
            
            cameraScanLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.cameraScanButton.snp.centerX);
                make.top.equalTo(self.cameraScanButton.snp.bottom).offset(17);
                make.width.equalTo(self.quantityImportLabel.snp.width);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }
            
            bluetoothButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.cameraScanButton.snp.top);
                make.left.equalTo(self.ftpServerConnectionSetupButton.snp.left);
                make.width.equalTo(self.quantityImportButton.snp.width);
                make.height.equalTo(self.quantityImportButton.snp.height);
            }
            bluetoothLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.bluetoothButton.snp.centerX);
                make.top.equalTo(self.cameraScanLabel.snp.top);
                make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }

        #else
            
            bluetoothButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.quantityExportButton.snp.top);
                make.left.equalTo(self.countingEnquiryButton.snp.left);
                make.width.equalTo(self.quantityImportButton.snp.width);
                make.height.equalTo(self.quantityImportButton.snp.height);
            }
            
            bluetoothLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.bluetoothButton.snp.centerX);
                make.top.equalTo(self.quantityExportLabel.snp.top);
                make.width.equalTo(self.quantityImportLabel.snp.width).offset(40);
                make.height.equalTo(self.quantityImportLabel.snp.height);
            }
        
        #endif
        
        emailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupButton.snp.top);
            make.left.equalTo(self.ftpServerConnectionSetupButton.snp.right).offset(135.5);
            make.width.equalTo(self.quantityImportButton.snp.width);
            make.height.equalTo(self.quantityImportButton.snp.height);
        }
        
        userAccountsSetupLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.userAccountsSetupButton.snp.centerX);
            make.top.equalTo(self.userAccountsSetupButton.snp.bottom).offset(17);
            make.width.equalTo(self.quantityImportLabel.snp.width);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        ftpServerConnectionSetupLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.snp.top);
            make.centerX.equalTo(self.ftpServerConnectionSetupButton.snp.centerX);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(10);
            make.height.equalTo(self.quantityImportLabel.snp.height);
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountsSetupLabel.snp.top);
            make.centerX.equalTo(self.emailButton.snp.centerX);
            make.width.equalTo(self.quantityImportLabel.snp.width).offset(10);
            make.height.equalTo(self.quantityImportLabel.snp.height);

        }
        
        logoutButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(27);
            make.left.equalTo(self.snp.left).offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
        }
        
        helpButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.logoutButton.snp.bottom).offset(10);
            make.left.equalTo(self.logoutButton.snp.right).offset(30);
            make.width.equalTo(50);
            make.height.equalTo(50);
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
