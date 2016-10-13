
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
        logoutButton = UIButton(type: UIButtonType.Custom);
        logoutButton.setImage(UIImage(named: "logout"), forState: UIControlState.Normal);
        self.topImageView.userInteractionEnabled = true;
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
        ftpServerTextLabel.textAlignment = NSTextAlignment.Right;
        ftpServerTextLabel.textColor = self.colorWithString("#2A9CAB");
        ftpServerTextLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpServerTextLabel);
        
       
        ftpUserTextLabel = UILabel();
        ftpUserTextLabel.text = "---------";
        ftpUserTextLabel.textAlignment = NSTextAlignment.Right;
        ftpUserTextLabel.textColor = self.colorWithString("#2A9CAB");
        ftpUserTextLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(ftpUserTextLabel);
        
        fileNameTextField = UITextField();
        fileNameTextField.borderStyle = UITextBorderStyle.Line;
        fileNameTextField.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        fileNameTextField.layer.borderWidth = 1;
        fileNameTextField.textColor = self.colorWithString("#2A9CAB");
        fileNameTextField.font = FONT20WEIGHT02();
        fileNameTextField.minimumFontSize = 0.7;
        fileNameTextField.sizeToFit();
        self.exprotBottomView.addSubview(fileNameTextField);
        
        exportStateLabel = UILabel();
        exportStateLabel.text = localString("exsState");//Counted Quantity data is successfully export to filename
        exportStateLabel.textAlignment = NSTextAlignment.Center;
        exportStateLabel.textColor = self.colorWithString("#2A9CAB");
        exportStateLabel.font = FONT20WEIGHT02();
        self.exprotBottomView.addSubview(exportStateLabel);
        
        
        exprotButton = UIButton(type: UIButtonType.System);
        exprotButton.setTitle(localString("export"), forState: UIControlState.Normal);
        exprotButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        exprotButton.titleLabel?.font = FONT25();
        exprotButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(exprotButton);
        
        
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        returnButton.titleLabel?.font = FONT25();
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
        if DEVICE == .Phone{
           addPhoneSuccessConstraint()
        }else{
            addSuccessConstraint()
        }
    }

    func addPhoneSuccessConstraint(){
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerY.equalTo(self.topImageView.mas_centerY)
            make.right.equalTo(self.mas_right).with.offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
            
        }

        exprotMiddleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT*0.27);
            
        }

        dateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_top).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(SCREENHEIGHT*0.27/5);
            
        }

        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.dateLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }

        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.numberOfSKULabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }

        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQtyLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }

        varianceQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countedQtyLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }

        dateTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_top).with.offset(0);
            make.left.equalTo(self.dateLabel.mas_right).with.offset(10);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.height.equalTo(SCREENHEIGHT*0.27/5);
            
        }

        numberOfSKUTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.dateTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }

        onhandQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.numberOfSKUTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }

        countedQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQtyTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }

        varianceQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countedQtyTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }

        exprotBottomView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_bottom).with.offset(0);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
            
        }

        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_top).with.offset(5);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_top).with.offset(5);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(10);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_top).with.offset(0);
            make.left.equalTo(self.ftpUserLabel.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        fileNameTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
            
        }

        exportStateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(0);
            make.right.equalTo(self.exprotBottomView.mas_right);
            make.height.equalTo(25);
            
        }

        exprotButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
        }

        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_bottom).with.offset(15);
            make.left.equalTo(self.exprotButton.mas_right).with.offset(SCREENWIDTH/5.0);
            make.width.equalTo(SCREENWIDTH/10.0 * 3);
            make.height.equalTo(25);
        }

    }
    func addSuccessConstraint(){
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top).with.offset(27);
            make.left.equalTo(self.mas_left).with.offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
        exprotMiddleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(244);
            
        }
        
        dateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_top).with.offset(25);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(111);
            make.width.equalTo(280);
            make.height.equalTo(40);
            
        }
        
        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.dateLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(111);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }
        
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.numberOfSKULabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(111);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }
        
        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQtyLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(111);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }
        
        varianceQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countedQtyLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotMiddleView.mas_left).with.offset(111);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(self.dateLabel.mas_height);
            
        }
        
        dateTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_top).with.offset(25);
            make.left.equalTo(self.dateLabel.mas_right).with.offset(25);
            make.width.equalTo(280);
            make.height.equalTo(40);
            
        }
        
        numberOfSKUTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.dateTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }
        
        onhandQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.numberOfSKUTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }
        
        countedQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQtyTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }
        
        varianceQtyTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countedQtyTextLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.dateTextLabel.mas_left);
            make.width.equalTo(self.dateTextLabel.mas_width);
            make.height.equalTo(self.dateTextLabel.mas_height);
            
        }
        
        exprotBottomView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotMiddleView.mas_bottom).with.offset(0);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(210);
            
        }
        
        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_top).with.offset(36);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_bottom).with.offset(0);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(111);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        
        ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_top).with.offset(36);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(65);
            make.width.equalTo(235);
            make.height.equalTo(40);
            
        }
        
        ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_top).with.offset(0);
            make.left.equalTo(self.ftpUserLabel.mas_right).with.offset(65);
            make.width.equalTo(235);
            make.height.equalTo(40);
            
        }
        
        fileNameTextField.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(65);
            make.width.equalTo(235);
            make.height.equalTo(34);
            
        }
        
        exportStateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.exprotBottomView.mas_left).with.offset(0);
            make.right.equalTo(self.exprotBottomView.mas_right);
            make.height.equalTo(40);
            
        }
        
        exprotButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(112);
            make.height.equalTo(32);
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.exprotBottomView.mas_bottom).with.offset(35);
            make.left.equalTo(self.exprotButton.mas_right).with.offset(160);
            make.width.equalTo(112);
            make.height.equalTo(32);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
