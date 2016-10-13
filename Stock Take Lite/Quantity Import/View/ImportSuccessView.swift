//
//  ImportSuccessView.swift
//  Stock Take Lite
//
//  Created by infoware on 10/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class ImportSuccessView: QuantityImportBaseView {
    
    var     middleView:                         UIView!;
    var     ftpServerLabel:                     UILabel!;
    var     ftpServerTextLabel:                 UILabel!;
    var     ftpUserLabel:                       UILabel!;
    var     ftpUserTextLabel:                   UILabel!;
    var     fileNameLabel:                      UILabel!;
    var     fileNameTextLabel:                  UILabel!;
    var     promptView:                         UIView!;
    var     promptLabel:                        UILabel!;
    var     recordsLabel:                       UILabel!;
    var     recordsTextLabel:                   UILabel!;
    var     recordsBottomLine:                  UILabel!;
    var     skuLabel:                           UILabel!;
    var     skuTextLabel:                       UILabel!;
    var     skuBottomLine:                      UILabel!;
    var     onhandQuantityLabel:                UILabel!;
    var     onhandQuantityTextLabel:            UILabel!;
    var     onhandQuantityBottomLine:           UILabel!;
    var     returnButton:                       UIButton!;
    var     countingEntryButton:                UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.loadMyView();
        
    }

    func loadMyView(){
        
        middleView = UIView();
        middleView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(middleView);
        
        ftpServerLabel = UILabel();
        ftpServerLabel.text = localString("isFTPServer");
        ftpServerLabel.textColor = self.colorWithString("#6D6E71");
        ftpServerLabel.font = FONT25()
        self.middleView.addSubview(ftpServerLabel);
        
        ftpServerTextLabel = UILabel();
        ftpServerTextLabel.text = "129.129.0.188";
        ftpServerTextLabel.textColor = self.colorWithString("#6D6E71");
        ftpServerTextLabel.font = FONT25()
        self.middleView.addSubview(ftpServerTextLabel);
       
        ftpUserLabel = UILabel();
        ftpUserLabel.text = localString("isFTPUser");
        ftpUserLabel.textColor = self.colorWithString("#6D6E71");
        ftpUserLabel.font = FONT25()
        self.middleView.addSubview(ftpUserLabel);
        
        ftpUserTextLabel = UILabel();
        ftpUserTextLabel.text = "Jhonny_shaow_321";
        ftpUserTextLabel.textColor = self.colorWithString("#6D6E71");
        ftpUserTextLabel.font = FONT25()
        self.middleView.addSubview(ftpUserTextLabel);
       
        fileNameLabel = UILabel();
        fileNameLabel.text = localString("isFileName");
        fileNameLabel.textColor = self.colorWithString("#6D6E71");
        fileNameLabel.font = FONT25()
        self.middleView.addSubview(fileNameLabel);
        
        fileNameTextLabel = UILabel();
        fileNameTextLabel.text = "File 3";
        fileNameTextLabel.textColor = self.colorWithString("#6D6E71");
        fileNameTextLabel.font = FONT25()
        self.middleView.addSubview(fileNameTextLabel);
       
        promptView = UIView();
        promptView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(promptView);
       
        promptLabel = UILabel();
        promptLabel.text = localString("isImportSuccess");
        promptLabel.textColor = self.colorWithString("#2A9CAB")
        if DEVICE == .Phone{
            promptLabel.font = UIFont.systemFontOfSize(14, weight: 0.15);

        }else{
            promptLabel.font = UIFont.systemFontOfSize(25, weight: 0.3);

        }
        self.promptView.addSubview(promptLabel);
       
        recordsLabel = UILabel();
        recordsLabel.text = localString("isNumOfRecords");
        recordsLabel.textColor = UIColor.blackColor();
        recordsLabel.font = FONT25()
        self.addSubview(recordsLabel);
       
        recordsTextLabel = UILabel();
        recordsTextLabel.text = "0";
        recordsTextLabel.textAlignment = NSTextAlignment.Left;
        recordsTextLabel.textColor = UIColor.blackColor();
        recordsTextLabel.font = FONT25()
        self.addSubview(recordsTextLabel);
      
        recordsBottomLine = UILabel();
        recordsBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(recordsBottomLine);
        
        skuLabel = UILabel();
        skuLabel.text = localString("isNumOfSKU");
        skuLabel.textColor = UIColor.blackColor();
        skuLabel.font = FONT25()
        self.addSubview(skuLabel);
        
        skuTextLabel = UILabel();
        skuTextLabel.text = "0";
        skuTextLabel.textColor = UIColor.blackColor();
        skuTextLabel.font = FONT25()
        self.addSubview(skuTextLabel);
       
        skuBottomLine = UILabel();
        skuBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(skuBottomLine);
        
        onhandQuantityLabel = UILabel();
        onhandQuantityLabel.text = localString("isTotalOnhandQTY");
        onhandQuantityLabel.textColor = UIColor.blackColor();
        onhandQuantityLabel.font = FONT25()
        self.addSubview(onhandQuantityLabel);
        
        onhandQuantityTextLabel = UILabel();
        onhandQuantityTextLabel.text = "0";
        onhandQuantityTextLabel.textColor = UIColor.blackColor();
        onhandQuantityTextLabel.font = FONT25()
        self.addSubview(onhandQuantityTextLabel);
        
        onhandQuantityBottomLine = UILabel();
        onhandQuantityBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(onhandQuantityBottomLine);
       
        countingEntryButton = UIButton(type: UIButtonType.System);
        countingEntryButton.setTitle(localString("countingEntry"), forState: UIControlState.Normal);
        countingEntryButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        countingEntryButton.titleLabel?.font = FONT25()
        countingEntryButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(countingEntryButton);
        
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
        if DEVICE == .Phone{
           addPhoneSuccessConstraint()
        }else{
            addSuccessConstraint()
        }
    }
    
    func addPhoneSuccessConstraint(){
        middleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT/5);
            
        }
        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middleView.mas_top).with.offset(10);
            make.left.equalTo(self.middleView.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.middleView.mas_left).with.offset(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
        }
        ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_top);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(25);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        
        ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.ftpServerLabel.mas_left);
            make.right.equalTo(self.ftpServerLabel.mas_right);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_top);
            make.left.equalTo(self.ftpServerTextLabel.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.ftpUserLabel.mas_height);
            
        }
        
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.ftpUserLabel.mas_left);
            make.right.equalTo(self.ftpUserLabel.mas_right);
            make.height.equalTo(self.ftpUserLabel.mas_height);
        }
        fileNameTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.ftpUserTextLabel.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.fileNameLabel.mas_height);
            
        }
        
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.middleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        
        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top).with.offset(5);
            make.left.equalTo(self.promptView.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(15);
            
        }
        
        recordsLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.mas_left).with.offset(SCREENWIDTH/7 * 3);
            make.height.equalTo(25);
        }
        
        recordsTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsLabel.mas_top);
            make.left.equalTo(self.recordsLabel.mas_right).with.offset(8);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.recordsLabel.mas_bottom);
            
        }
        
        recordsBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        skuLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.recordsLabel.mas_right);
            make.height.equalTo(self.recordsLabel.mas_height);
            
        }
        skuTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuLabel.mas_top);
            make.left.equalTo(self.skuLabel.mas_right).with.offset(10);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.skuLabel.mas_bottom);
            
        }
        
        skuBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        onhandQuantityLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.mas_left).with.offset(SCREENWIDTH * 0.7);
            make.height.equalTo(25);
        }

        onhandQuantityTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityLabel.mas_top);
            make.left.equalTo(self.onhandQuantityLabel.mas_right).with.offset(10);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(25);
            
        }
        
        onhandQuantityBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        countingEntryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.countingEntryButton.mas_right).with.offset(40);
            make.width.equalTo(SCREENWIDTH * 0.24);
            make.height.equalTo(25);
        }

    }
    func addSuccessConstraint(){
        middleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(184);
            
        }
        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middleView.mas_top).with.offset(25);
            make.left.equalTo(self.middleView.mas_left).with.offset(111);
            make.right.equalTo(self.middleView.mas_left).with.offset(251);
            make.height.equalTo(40);
        }
        ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_top);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(40);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        
        ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.ftpServerLabel.mas_left);
            make.right.equalTo(self.ftpServerLabel.mas_right);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_top);
            make.left.equalTo(self.ftpServerTextLabel.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.ftpUserLabel.mas_height);
            
        }
        
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.ftpUserLabel.mas_left);
            make.right.equalTo(self.ftpUserLabel.mas_right);
            make.height.equalTo(self.ftpUserLabel.mas_height);
        }
        fileNameTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.ftpUserTextLabel.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.fileNameLabel.mas_height);
            
        }
        
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.middleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(63);
            
        }
        
        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top).with.offset(15);
            make.left.equalTo(self.promptView.mas_left).with.offset(111);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(35);
            
        }
        
        recordsLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_left).with.offset(291);
            make.height.equalTo(50);
        }
        
        recordsTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsLabel.mas_top);
            make.left.equalTo(self.recordsLabel.mas_right).with.offset(8);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.recordsLabel.mas_bottom);
            
        }
        
        recordsBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        skuLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.recordsBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.recordsLabel.mas_right);
            make.height.equalTo(self.recordsLabel.mas_height);
            
        }
        skuTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuLabel.mas_top);
            make.left.equalTo(self.mas_left).with.offset(261);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.skuLabel.mas_bottom);
            
        }
        
        skuBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        onhandQuantityLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_left).with.offset(450);
            make.height.equalTo(50);
        }
        
        onhandQuantityTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityLabel.mas_top);
            make.left.equalTo(self.mas_left).with.offset(460);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50);
            
        }
        
        onhandQuantityBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        countingEntryButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(185);
            make.height.equalTo(35);
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandQuantityBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.countingEntryButton.mas_right).with.offset(80);
            make.width.equalTo(185);
            make.height.equalTo(35);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
