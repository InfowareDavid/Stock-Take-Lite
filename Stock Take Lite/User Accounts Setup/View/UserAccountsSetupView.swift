//
//  UserAccountsSetupView.swift
//  Stock Take Lite
//
//  Created by infoware on 19/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class UserAccountsSetupView: QuantityImportBaseView {

    var         promptView:                             UIView!;
    var         promptLabel:                            UILabel!;
    var         tableViewTitleView:                     UIView!;
    var         userIDLabel:                            UILabel!;
    var         userNameLabel:                          UILabel!;
    var         administratorLabel:                     UILabel!;
    var         tableView:                              UITableView!;
    var         addButton:                              UIButton!;
    var         okButton:                               UIButton!;
    var         cancelButton:                           UIButton!;
    var         tableViewBottomLine:                    UILabel!;
    var         tableViewTopLine:                       UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("usTitle");
        promptView = UIView();
        promptView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(promptView);
        
        promptLabel = UILabel();
        promptLabel.text = localString("usPrompt");
        promptLabel.numberOfLines = 0;
        promptLabel.textColor = self.colorWithString("#6D6E71");
        promptLabel.font = FONT25()
        self.promptView.addSubview(promptLabel);
        
        tableViewTitleView = UIView();
        tableViewTitleView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(tableViewTitleView);
        
        userIDLabel = UILabel();
        userIDLabel.text = localString("usUserID");
        userIDLabel.textColor = self.colorWithString("#2A9CAB");
        userIDLabel.font = FONT25WEIGHT03()
        self.tableViewTitleView.addSubview(userIDLabel);
        
        userNameLabel = UILabel();
        userNameLabel.text = localString("usName");
        userNameLabel.textColor = self.colorWithString("#2A9CAB");
        userNameLabel.font = FONT25WEIGHT03()
        self.tableViewTitleView.addSubview(userNameLabel);
        
        administratorLabel = UILabel();
        administratorLabel.text = localString("usAdmin");
        administratorLabel.textColor = self.colorWithString("#2A9CAB");
        administratorLabel.font = FONT25WEIGHT03()
        self.tableViewTitleView.addSubview(administratorLabel);
       
        tableViewTopLine = UILabel();
        tableViewTopLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewTopLine);
        
        tableView = UITableView();
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.addSubview(tableView);
        
        tableViewBottomLine = UILabel();
        tableViewBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLine);
        
        addButton = UIButton(type: UIButtonType.System);
        addButton.setTitle(localString("add"), forState: UIControlState.Normal);
        addButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        addButton.titleLabel?.font = FONT20()
        addButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(addButton);
        
        
        okButton = UIButton(type: UIButtonType.System);
        okButton.setTitle(localString("ok"), forState: UIControlState.Normal);
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        okButton.titleLabel?.font =  FONT20()
        okButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(okButton);
        
        
        cancelButton = UIButton(type: UIButtonType.System);
        cancelButton.setTitle(localString("cancel"), forState: UIControlState.Normal);
        cancelButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal)
        cancelButton.titleLabel?.font = FONT20()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(cancelButton);
       
        if DEVICE == .Phone{
           addPhoneUserAccountsConstraint()
        }else{
           addUserAccountsConstraint()
        }
       
    }
    
    func addPhoneUserAccountsConstraint(){
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT/9);
            
        }

        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.promptView.mas_bottom);
        }

        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }

        self.userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }

        self.userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }

        self.administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }

        tableViewTopLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }

        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLine.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 5);
        }

        tableViewBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }

        addButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10);
            make.height.equalTo(25);
        }

        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.addButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/10);
            make.height.equalTo(25);
        }

        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(15);
            make.left.equalTo(self.okButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
    }
    
    func addUserAccountsConstraint(){
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(105);
            
        }
        
        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.promptView.mas_bottom);
        }
        
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50);
            
        }
        
        self.userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(111);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }
        
        self.userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(100);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }
        
        self.administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(100);
            make.width.equalTo(160);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
        }
        
        tableViewTopLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLine.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(240);
        }
        
        tableViewBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        addButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(42);
            make.height.equalTo(32);
        }
        
        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.addButton.mas_right).with.offset(50);
            make.width.equalTo(42);
            make.height.equalTo(32);
        }
        
        cancelButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(35);
            make.left.equalTo(self.okButton.mas_right).with.offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
