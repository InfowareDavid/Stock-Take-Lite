
//
//  ExportSuccessView.swift
//  Stock Take Lite
//
//  Created by infoware on 16/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class ExportSuccessView: QuantityImportBaseView {
    var     logoutButton:                                   UIButton!;
    var     exprotMiddleView:                               UIView!;
    var     exprotBottomView:                               UIView!;
    var     dateLabel:                                      UILabel!;
    var     dateTextLabel:                                  UILabel!;
    var     numberOfSKULabel:                               UILabel!;
    var     numberOfSKUTextLabel:                           UILabel!;
    var     onhandQtyLabel:                                 UILabel!;
    var     onhandQtyTextLabel:                             UILabel!;
    var     countedQtyLabel:                                UILabel!;
    var     countedQtyTextLabel:                            UILabel!;
    var     varianceQtyLabel:                               UILabel!;
    var     varianceQtyTextLabel:                           UILabel!;
    var     ftpServerLabel:                                 UILabel!;
    var     ftpServerTextLabel:                             UILabel!;
    var     ftpUserLabel:                                   UILabel!;
    var     ftpUserTextLabel:                               UILabel!;
    var     fileNameLabel:                                  UILabel!;
    var     fileNameTextField:                              UITextField!;
    var     exportStateLabel:                               UILabel!;
    var     exprotButton:                                   UIButton!;
    var     returnButton:                                   UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("exsTitle");
        logoutButton = UIButton(type: UIButtonType.custom);
        logoutButton.setImage(UIImage(named: "logout"), for: UIControlState());
        self.topImageView.isUserInteractionEnabled = true;
        self.topImageView.addSubview(logoutButton);
        
        /**
        *
        *   左边的标签
        *
        */
        
        exprotMiddleView = UIView();
        exprotMiddleView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(exprotMiddleView);
        
        dateLabel = UILabel();
        dateLabel.text = localString("exsDate");
        dateLabel.textColor = self.colorWithString("#6D6E71");
        dateLabel.font = FONT22();
        self.exprotMiddleView.addSubview(dateLabel);
        
        numberOfSKULabel = UILabel();
        numberOfSKULabel.text = localString("exsNumOfSKU");
        numberOfSKULabel.textColor = self.colorWithString("#6D6E71");
        numberOfSKULabel.font = FONT22();
        self.exprotMiddleView.addSubview(numberOfSKULabel);
        
     
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = localString("exsOnhandQty");
        onhandQtyLabel.textColor = self.colorWithString("#6D6E71");
        onhandQtyLabel.font = FONT22();
        self.exprotMiddleView.addSubview(onhandQtyLabel);
       
        countedQtyLabel = UILabel();
        countedQtyLabel.text = localString("exsCountedQty");
        countedQtyLabel.textColor = self.colorWithString("#6D6E71");
        countedQtyLabel.font = FONT22();
        self.exprotMiddleView.addSubview(countedQtyLabel);
        
        varianceQtyLabel = UILabel();
        varianceQtyLabel.text = localString("exsVarianceQty");
        varianceQtyLabel.textColor = self.colorWithString("#6D6E71");
        varianceQtyLabel.font = FONT22();
        self.exprotMiddleView.addSubview(varianceQtyLabel);
        
        
        dateTextLabel = UILabel();
        dateTextLabel.text = "DD MMM YY HH:MM";
        dateTextLabel.textColor = self.colorWithString("#6D6E71");
        dateTextLabel.font = FONT22();
        self.exprotMiddleView.addSubview(dateTextLabel);
        
        numberOfSKUTextLabel = UILabel();
        numberOfSKUTextLabel.text = "99999";
        numberOfSKUTextLabel.textColor = self.colorWithString("#6D6E71");
        numberOfSKUTextLabel.font = FONT22();
        self.exprotMiddleView.addSubview(numberOfSKUTextLabel);
        
        onhandQtyTextLabel = UILabel();
        onhandQtyTextLabel.text = "999999";
        onhandQtyTextLabel.textColor = self.colorWithString("#6D6E71");
        onhandQtyTextLabel.font = FONT22();
        self.exprotMiddleView.addSubview(onhandQtyTextLabel);
        
        countedQtyTextLabel = UILabel();
        countedQtyTextLabel.text = "999999";
        countedQtyTextLabel.textColor = self.colorWithString("#6D6E71");
        countedQtyTextLabel.font = FONT22();
        self.exprotMiddleView.addSubview(countedQtyTextLabel);
        
        varianceQtyTextLabel = UILabel();
        varianceQtyTextLabel.text = "999999";
        varianceQtyTextLabel.textColor = self.colorWithString("#6D6E71");
        varianceQtyTextLabel.font = FONT22();
        self.exprotMiddleView.addSubview(varianceQtyTextLabel);
      
        exprotBottomView = UIView();
        exprotBottomView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(exprotBottomView);
        
        ftpServerLabel = UILabel();
        ftpServerLabel.text = localString("exsFTPServer");
        ftpServerLabel.textColor = self.colorWithString("#2A9CAB");
        ftpServerLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpServerLabel);
        
        ftpUserLabel = UILabel();
        ftpUserLabel.text = localString("exsFTPUser");
        ftpUserLabel.textColor = self.colorWithString("#2A9CAB");
        ftpUserLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpUserLabel);
        
        fileNameLabel = UILabel();
        fileNameLabel.text = localString("exsFileName");
        fileNameLabel.textColor = self.colorWithString("#2A9CAB");
        fileNameLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(fileNameLabel);
        
     
        ftpServerTextLabel = UILabel();
        ftpServerTextLabel.text = "---------";
        ftpServerTextLabel.textAlignment = NSTextAlignment.right;
        ftpServerTextLabel.textColor = self.colorWithString("#2A9CAB");
        ftpServerTextLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpServerTextLabel);
        
       
        ftpUserTextLabel = UILabel();
        ftpUserTextLabel.text = "---------";
        ftpUserTextLabel.textAlignment = NSTextAlignment.right;
        ftpUserTextLabel.textColor = self.colorWithString("#2A9CAB");
        ftpUserTextLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpUserTextLabel);
        
        fileNameTextField = UITextField();
        fileNameTextField.borderStyle = UITextBorderStyle.line;
        fileNameTextField.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        fileNameTextField.layer.borderWidth = 1;
        fileNameTextField.textColor = self.colorWithString("#2A9CAB");
        fileNameTextField.font = FONT20WEIGHT02();
        fileNameTextField.minimumFontSize = 0.7;
        fileNameTextField.sizeToFit();
        self.exprotBottomView.addSubview(fileNameTextField);
        
        exportStateLabel = UILabel();
        exportStateLabel.text = localString("exsState");//Counted Quantity data is successfully export to filename
        exportStateLabel.textAlignment = NSTextAlignment.center;
        exportStateLabel.textColor = self.colorWithString("#2A9CAB");
        exportStateLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(exportStateLabel);
        
        
        exprotButton = UIButton(type: UIButtonType.system);
        exprotButton.setTitle(localString("export"), for: UIControlState());
        exprotButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        exprotButton.titleLabel?.font = FONT25();
        exprotButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(exprotButton);
        
        
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        returnButton.titleLabel?.font = FONT25();
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
        if DEVICE == .phone{
           addPhoneSuccessConstraint()
        }else{
            addSuccessConstraint()
        }
    }

    func addPhoneSuccessConstraint(){
        logoutButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.topImageView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
            
        }

        exprotMiddleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT*0.27);
            
        }

        dateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.top).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(SCREENHEIGHT*0.27/5);
            
        }

        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.dateLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }

        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.numberOfSKULabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }

        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQtyLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }

        varianceQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.countedQtyLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }

        dateTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.top).offset(0);
            make.left.equalTo(self.dateLabel.snp.right).offset(10);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(SCREENHEIGHT*0.27/5);
            
        }

        numberOfSKUTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.dateTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }

        onhandQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.numberOfSKUTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }

        countedQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQtyTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }

        varianceQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.countedQtyTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }

        exprotBottomView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.bottom).offset(0);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
            
        }

        ftpServerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.top).offset(5);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        ftpUserLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        fileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        ftpServerTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.top).offset(5);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(10);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        ftpUserTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.top).offset(0);
            make.left.equalTo(self.ftpUserLabel.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        fileNameTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        exportStateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.bottom).offset(5);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(0);
            make.right.equalTo(self.exprotBottomView.snp.right);
            make.height.equalTo(25);
            
        }

        exprotButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
        }

        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.bottom).offset(15);
            make.left.equalTo(self.exprotButton.snp.right).offset(SCREENWIDTH/5.0);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
        }

    }
    func addSuccessConstraint(){
        logoutButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(27);
            make.left.equalTo(self.snp.left).offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
        exprotMiddleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(244);
            
        }
        
        dateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.top).offset(25);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(111);
            make.width.equalTo(280);
            make.height.equalTo(40);
            
        }
        
        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.dateLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(111);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }
        
        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.numberOfSKULabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(111);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }
        
        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQtyLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(111);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }
        
        varianceQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.countedQtyLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotMiddleView.snp.left).offset(111);
            make.width.equalTo(self.dateLabel.snp.width);
            make.height.equalTo(self.dateLabel.snp.height);
            
        }
        
        dateTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.top).offset(25);
            make.left.equalTo(self.dateLabel.snp.right).offset(25);
            make.width.equalTo(280);
            make.height.equalTo(40);
            
        }
        
        numberOfSKUTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.dateTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }
        
        onhandQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.numberOfSKUTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }
        
        countedQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQtyTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }
        
        varianceQtyTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.countedQtyTextLabel.snp.bottom).offset(0);
            make.left.equalTo(self.dateTextLabel.snp.left);
            make.width.equalTo(self.dateTextLabel.snp.width);
            make.height.equalTo(self.dateTextLabel.snp.height);
            
        }
        
        exprotBottomView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotMiddleView.snp.bottom).offset(0);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(210);
            
        }
        
        ftpServerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.top).offset(36);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        ftpUserLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        fileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.bottom).offset(0);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        ftpServerTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.top).offset(36);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(65);
            make.width.equalTo(235);
            make.height.equalTo(40);
            
        }
        
        ftpUserTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.top).offset(0);
            make.left.equalTo(self.ftpUserLabel.snp.right).offset(65);
            make.width.equalTo(235);
            make.height.equalTo(40);
            
        }
        
        fileNameTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(65);
            make.width.equalTo(235);
            make.height.equalTo(34);
            
        }
        
        exportStateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.bottom).offset(10);
            make.left.equalTo(self.exprotBottomView.snp.left).offset(0);
            make.right.equalTo(self.exprotBottomView.snp.right);
            make.height.equalTo(40);
            
        }
        
        exprotButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(112);
            make.height.equalTo(32);
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.exprotBottomView.snp.bottom).offset(35);
            make.left.equalTo(self.exprotButton.snp.right).offset(160);
            make.width.equalTo(112);
            make.height.equalTo(32);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
