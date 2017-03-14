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
        if DEVICE == .phone{
            promptLabel.font = UIFont.systemFont(ofSize: 14, weight: 0.15);

        }else{
            promptLabel.font = UIFont.systemFont(ofSize: 25, weight: 0.3);

        }
        self.promptView.addSubview(promptLabel);
       
        recordsLabel = UILabel();
        recordsLabel.text = localString("isNumOfRecords");
        recordsLabel.textColor = UIColor.black;
        recordsLabel.font = FONT25()
        self.addSubview(recordsLabel);
       
        recordsTextLabel = UILabel();
        recordsTextLabel.text = "0";
        recordsTextLabel.textAlignment = NSTextAlignment.left;
        recordsTextLabel.textColor = UIColor.black;
        recordsTextLabel.font = FONT25()
        self.addSubview(recordsTextLabel);
      
        recordsBottomLine = UILabel();
        recordsBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(recordsBottomLine);
        
        skuLabel = UILabel();
        skuLabel.text = localString("isNumOfSKU");
        skuLabel.textColor = UIColor.black;
        skuLabel.font = FONT25()
        self.addSubview(skuLabel);
        
        skuTextLabel = UILabel();
        skuTextLabel.text = "0";
        skuTextLabel.textColor = UIColor.black;
        skuTextLabel.font = FONT25()
        self.addSubview(skuTextLabel);
       
        skuBottomLine = UILabel();
        skuBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(skuBottomLine);
        
        onhandQuantityLabel = UILabel();
        onhandQuantityLabel.text = localString("isTotalOnhandQTY");
        onhandQuantityLabel.textColor = UIColor.black;
        onhandQuantityLabel.font = FONT25()
        self.addSubview(onhandQuantityLabel);
        
        onhandQuantityTextLabel = UILabel();
        onhandQuantityTextLabel.text = "0";
        onhandQuantityTextLabel.textColor = UIColor.black;
        onhandQuantityTextLabel.font = FONT25()
        self.addSubview(onhandQuantityTextLabel);
        
        onhandQuantityBottomLine = UILabel();
        onhandQuantityBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(onhandQuantityBottomLine);
       
        countingEntryButton = UIButton(type: UIButtonType.system);
        countingEntryButton.setTitle(localString("countingEntry"), for: UIControlState());
        countingEntryButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        countingEntryButton.titleLabel?.font = FONT25()
        countingEntryButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(countingEntryButton);
        
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
        if DEVICE == .phone{
           addPhoneSuccessConstraint()
        }else{
            addSuccessConstraint()
        }
    }
    
    func addPhoneSuccessConstraint(){
//        middleView.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.bottomLineLabel.snp.bottom);
//            make.left.equalTo(self.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(SCREENHEIGHT/5);
//            
//        }
        
        middleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT/5);

        }
        
//        ftpServerLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(self.middleView.snp.top).offset(10);
//            make.left.equalTo(self.middleView.snp.left).offset(SCREENWIDTH/10);
//            make.right.equalTo(self.middleView.snp.left).offset(SCREENWIDTH * 0.35);
//            make.height.equalTo(25);
//        }
        
        ftpServerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.middleView.snp.top).offset(10);
            make.left.equalTo(self.middleView.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.middleView.snp.left).offset(SCREENWIDTH * 0.35);
            make.height.equalTo(25);

        }
        
//        ftpServerTextLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.ftpServerLabel.snp.top);
//            make.left.equalTo(self.ftpServerLabel.snp.right).offset(25);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(self.ftpServerLabel.snp.height);
//            
//        }
        
        ftpServerTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpServerLabel.snp.top);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(25);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.ftpServerLabel.snp.height);

        }
        
//        ftpUserLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(5);
//            make.left.equalTo(self.ftpServerLabel.snp.left);
//            make.right.equalTo(self.ftpServerLabel.snp.right);
//            make.height.equalTo(self.ftpServerLabel.snp.height);
//            
//        }
        
        ftpUserLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(5);
            make.left.equalTo(self.ftpServerLabel.snp.left);
            make.right.equalTo(self.ftpServerLabel.snp.right);
            make.height.equalTo(self.ftpServerLabel.snp.height);
        }
        
//        ftpUserTextLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.ftpUserLabel.snp.top);
//            make.left.equalTo(self.ftpServerTextLabel.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(self.ftpUserLabel.snp.height);
//            
//        }
        ftpUserTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpUserLabel.snp.top);
            make.left.equalTo(self.ftpServerTextLabel.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.ftpUserLabel.snp.height);
        }
        
//        fileNameLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.ftpUserLabel.snp.bottom).offset(5);
//            make.left.equalTo(self.ftpUserLabel.snp.left);
//            make.right.equalTo(self.ftpUserLabel.snp.right);
//            make.height.equalTo(self.ftpUserLabel.snp.height);
//        }
        
         fileNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ftpUserLabel.snp.bottom).offset(5);
            make.left.equalTo(self.ftpUserLabel.snp.left);
            make.right.equalTo(self.ftpUserLabel.snp.right);
            make.height.equalTo(self.ftpUserLabel.snp.height);
        }
        
//        fileNameTextLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.fileNameLabel.snp.top);
//            make.left.equalTo(self.ftpUserTextLabel.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(self.fileNameLabel.snp.height);
//            
//        }
//        
        fileNameTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.ftpUserTextLabel.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.fileNameLabel.snp.height);
        }
        
//        promptView.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.middleView.snp.bottom);
//            make.left.equalTo(self.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(30);
//            
//        }
        
        promptView.snp.makeConstraints { (make) in
            make.top.equalTo(self.middleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
        }
        
//        promptLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.promptView.snp.top).offset(5);
//            make.left.equalTo(self.promptView.snp.left).offset(SCREENWIDTH/10);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(15);
//            
//        }
        
        promptLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.promptView.snp.top).offset(5);
            make.left.equalTo(self.promptView.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(15);

        }
        
//        recordsLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.promptView.snp.bottom);
//            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
//            make.right.equalTo(self.snp.left).offset(SCREENWIDTH/7 * 3);
//            make.height.equalTo(25);
//        }
        
//        
        recordsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.snp.left).offset(SCREENWIDTH/7 * 3);
            make.height.equalTo(25);
        }
    
        
//        recordsTextLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.recordsLabel.snp.top);
//            make.left.equalTo(self.recordsLabel.snp.right).offset(8);
//            make.right.equalTo(self.snp.right);
//            make.bottom.equalTo(self.recordsLabel.snp.bottom);
//            
//        }
        
        recordsTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.recordsLabel.snp.top);
            make.left.equalTo(self.recordsLabel.snp.right).offset(8);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.recordsLabel.snp.bottom);
            

        }
        
//        recordsBottomLine.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.recordsLabel.snp.bottom);
//            make.left.equalTo(self.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(1);
//            
//        }
        
        recordsBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.recordsLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
//        skuLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.recordsBottomLine.snp.bottom);
//            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
//            make.right.equalTo(self.recordsLabel.snp.right);
//            make.height.equalTo(self.recordsLabel.snp.height);
//            
//        }
        
        skuLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.recordsBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.recordsLabel.snp.right);
            make.height.equalTo(self.recordsLabel.snp.height);
            
        }
        
//        skuTextLabel.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.skuLabel.snp.top);
//            make.left.equalTo(self.skuLabel.snp.right).offset(10);
//            make.right.equalTo(self.snp.right);
//            make.bottom.equalTo(self.skuLabel.snp.bottom);
//            
//        }
        
        skuTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuLabel.snp.top);
            make.left.equalTo(self.skuLabel.snp.right).offset(10);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.skuLabel.snp.bottom);
            
        }

        
//        skuBottomLine.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(self.skuLabel.snp.bottom);
//            make.left.equalTo(self.snp.left);
//            make.right.equalTo(self.snp.right);
//            make.height.equalTo(1);
//            
//        }
        
        skuBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        onhandQuantityLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.snp.left).offset(SCREENWIDTH * 0.7);
            make.height.equalTo(25);
        }

        onhandQuantityTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityLabel.snp.top);
            make.left.equalTo(self.onhandQuantityLabel.snp.right).offset(10);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(25);
            
        }
        
        onhandQuantityBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        countingEntryButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH * 0.35);
            make.height.equalTo(25);
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.countingEntryButton.snp.right).offset(40);
            make.width.equalTo(SCREENWIDTH * 0.24);
            make.height.equalTo(25);
        }

    }
    func addSuccessConstraint(){
        middleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(184);
            
        }
        ftpServerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.middleView.snp.top).offset(25);
            make.left.equalTo(self.middleView.snp.left).offset(111);
            make.right.equalTo(self.middleView.snp.left).offset(251);
            make.height.equalTo(40);
        }
        ftpServerTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.top);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(40);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.ftpServerLabel.snp.height);
            
        }
        
        ftpUserLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(10);
            make.left.equalTo(self.ftpServerLabel.snp.left);
            make.right.equalTo(self.ftpServerLabel.snp.right);
            make.height.equalTo(self.ftpServerLabel.snp.height);
            
        }
        ftpUserTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.top);
            make.left.equalTo(self.ftpServerTextLabel.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.ftpUserLabel.snp.height);
            
        }
        
        fileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.bottom).offset(10);
            make.left.equalTo(self.ftpUserLabel.snp.left);
            make.right.equalTo(self.ftpUserLabel.snp.right);
            make.height.equalTo(self.ftpUserLabel.snp.height);
        }
        fileNameTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.ftpUserTextLabel.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(self.fileNameLabel.snp.height);
            
        }
        
        promptView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.middleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(63);
            
        }
        
        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top).offset(15);
            make.left.equalTo(self.promptView.snp.left).offset(111);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(35);
            
        }
        
        recordsLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.left).offset(291);
            make.height.equalTo(50);
        }
        
        recordsTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.recordsLabel.snp.top);
            make.left.equalTo(self.recordsLabel.snp.right).offset(8);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.recordsLabel.snp.bottom);
            
        }
        
        recordsBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.recordsLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        skuLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.recordsBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.recordsLabel.snp.right);
            make.height.equalTo(self.recordsLabel.snp.height);
            
        }
        skuTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuLabel.snp.top);
            make.left.equalTo(self.snp.left).offset(261);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.skuLabel.snp.bottom);
            
        }
        
        skuBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        onhandQuantityLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.left).offset(450);
            make.height.equalTo(50);
        }
        
        onhandQuantityTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityLabel.snp.top);
            make.left.equalTo(self.snp.left).offset(460);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50);
            
        }
        
        onhandQuantityBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        countingEntryButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(185);
            make.height.equalTo(35);
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.onhandQuantityBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.countingEntryButton.snp.right).offset(80);
            make.width.equalTo(185);
            make.height.equalTo(35);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
