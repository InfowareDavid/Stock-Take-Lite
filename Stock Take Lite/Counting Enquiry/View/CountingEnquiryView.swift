//
//  CountingEnquiryView.swift
//  Stock Take Lite
//
//  Created by infoware on 15/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEnquiryView: QuantityImportBaseView {
    var     logoutButton:                               UIButton!;
    var     promptView:                                 UIView!;
    var     promptLabel:                                UILabel!;
    var     tableViewTitleView:                         UIView!;
    var     dataAndTimeLabel:                           UILabel!;
    var     numberOfSKULabel:                           UILabel!;
    var     onhandQtyLabel:                             UILabel!;
    var     countedQtyLabel:                            UILabel!;
    var     tableView:                                  UITableView!;
    var     tableViewBottomLine:                        UILabel!;
    var     okButton:                                   UIButton!;
    var     returnButton:                               UIButton!;
    var     promptBottomLine:                           UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("enTitle");
        logoutButton = UIButton(type: UIButtonType.custom);
        logoutButton.setImage(UIImage(named: "logout"), for: UIControlState());
        self.topImageView.isUserInteractionEnabled = true;
        self.topImageView.addSubview(logoutButton);
        
        promptView = UIView();
        promptView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(promptView);
        
        promptLabel = UILabel();
        promptLabel.text = localString("enPrompt");
        promptLabel.textColor = self.colorWithString("#6D6E71");
        promptLabel.font = FONT20()
        self.promptView.addSubview(promptLabel);
       
        
        tableViewTitleView = UIView();
        tableViewTitleView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(tableViewTitleView);
       
        promptBottomLine = UILabel();
        promptBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(promptBottomLine);
        
        dataAndTimeLabel = UILabel();
        dataAndTimeLabel.text = localString("enDataAndTime");
        dataAndTimeLabel.numberOfLines = 0;
        dataAndTimeLabel.textColor = self.colorWithString("#2A9CAB");
        dataAndTimeLabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(dataAndTimeLabel);
        
        numberOfSKULabel = UILabel();
        numberOfSKULabel.text = localString("enNumOfSKU");
        numberOfSKULabel.numberOfLines = 0;
        numberOfSKULabel.textColor = self.colorWithString("#2A9CAB");
        numberOfSKULabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(numberOfSKULabel);
        
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = localString("enOnhandQty");
        onhandQtyLabel.numberOfLines = 0;
        onhandQtyLabel.textColor = self.colorWithString("#2A9CAB");
        onhandQtyLabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(onhandQtyLabel);
       
        
        countedQtyLabel = UILabel();
        countedQtyLabel.text = localString("enCountedQty");
        countedQtyLabel.numberOfLines = 0;
        countedQtyLabel.textColor = self.colorWithString("#2A9CAB");
        countedQtyLabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(countedQtyLabel);
        
        tableView = UITableView();
        tableView.bounces = false;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.addSubview(tableView);
        
        tableViewBottomLine = UILabel();
        tableViewBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLine);
       
        
        okButton = UIButton(type: UIButtonType.system);
        okButton.setTitle(localString("ok"), for: UIControlState());
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        okButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        okButton.titleLabel?.font = FONT25()
        self.addSubview(okButton);
        
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_2"), for: UIControlState());
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
        if DEVICE == .phone{
            numberOfSKULabel.textAlignment = .right
            onhandQtyLabel.textAlignment = .right
            countedQtyLabel.textAlignment = .right
            addPhoneEnquiryConstraint()
        }else{
            addEnquiryConstraint()
        }
    }
    
    func addPhoneEnquiryConstraint(){
                
        logoutButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.topImageView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
        }

        promptView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }

        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top);
            make.left.equalTo(self.promptView.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.promptView.snp.right);
            make.bottom.equalTo(self.promptView.snp.bottom);
            
        }
        
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }
        
        promptBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        dataAndTimeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(15);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }

        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }

        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }

        tableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 10);
            
        }

        tableViewBottomLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
        }
        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.okButton.snp.top);
            make.left.equalTo(self.okButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.okButton.snp.height);
            
        }
    }
    
    func addEnquiryConstraint(){
        logoutButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(27);
            make.left.equalTo(self.snp.left).offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
        promptView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(72);
            
        }
        
        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top);
            make.left.equalTo(self.promptView.snp.left).offset(111);
            make.right.equalTo(self.promptView.snp.right);
            make.bottom.equalTo(self.promptView.snp.bottom);
            
        }
        
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(61);
            
        }
        
        promptBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        dataAndTimeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(35);
            make.width.equalTo(130);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        
        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(403);
            make.width.equalTo(60);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        
        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(519);
            make.width.equalTo(70);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(635);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        
        tableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(614);
            
        }
        
        tableViewBottomLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
        }
        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.okButton.snp.top);
            make.left.equalTo(self.okButton.snp.right).offset(160);
            make.width.equalTo(130);
            make.height.equalTo(self.okButton.snp.height);
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
