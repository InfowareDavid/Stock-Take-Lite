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
        logoutButton = UIButton(type: UIButtonType.Custom);
        logoutButton.setImage(UIImage(named: "logout"), forState: UIControlState.Normal);
        self.topImageView.userInteractionEnabled = true;
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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.addSubview(tableView);
        
        tableViewBottomLine = UILabel();
        tableViewBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLine);
       
        
        okButton = UIButton(type: UIButtonType.System);
        okButton.setTitle(localString("ok"), forState: UIControlState.Normal);
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        okButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        okButton.titleLabel?.font = FONT25()
        self.addSubview(okButton);
        
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_2"), forState: UIControlState.Normal);
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
        if DEVICE == .Phone{
            numberOfSKULabel.textAlignment = .Right
            onhandQtyLabel.textAlignment = .Right
            countedQtyLabel.textAlignment = .Right
            addPhoneEnquiryConstraint()
        }else{
            addEnquiryConstraint()
        }
    }
    
    func addPhoneEnquiryConstraint(){
                
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerY.equalTo(self.topImageView.mas_centerY)
            make.right.equalTo(self.mas_right).with.offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);
        }

        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }

        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top);
            make.left.equalTo(self.promptView.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.promptView.mas_right);
            make.bottom.equalTo(self.promptView.mas_bottom);
            
        }
        
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        
        promptBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        dataAndTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(15);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }

        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }

        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }

        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 10);
            
        }

        tableViewBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
        }
        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.okButton.mas_top);
            make.left.equalTo(self.okButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.okButton.mas_height);
            
        }
    }
    
    func addEnquiryConstraint(){
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top).with.offset(27);
            make.left.equalTo(self.mas_left).with.offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(72);
            
        }
        
        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top);
            make.left.equalTo(self.promptView.mas_left).with.offset(111);
            make.right.equalTo(self.promptView.mas_right);
            make.bottom.equalTo(self.promptView.mas_bottom);
            
        }
        
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(61);
            
        }
        
        promptBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        dataAndTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(35);
            make.width.equalTo(130);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        
        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(403);
            make.width.equalTo(60);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(519);
            make.width.equalTo(70);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(635);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        
        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(614);
            
        }
        
        tableViewBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
        }
        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.okButton.mas_top);
            make.left.equalTo(self.okButton.mas_right).with.offset(160);
            make.width.equalTo(130);
            make.height.equalTo(self.okButton.mas_height);
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
