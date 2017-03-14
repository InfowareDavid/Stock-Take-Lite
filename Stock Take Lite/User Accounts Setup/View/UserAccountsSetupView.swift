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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.addSubview(tableView);
        
        tableViewBottomLine = UILabel();
        tableViewBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLine);
        
        addButton = UIButton(type: UIButtonType.system);
        addButton.setTitle(localString("add"), for: UIControlState());
        addButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        addButton.titleLabel?.font = FONT20()
        addButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(addButton);
        
        
        okButton = UIButton(type: UIButtonType.system);
        okButton.setTitle(localString("ok"), for: UIControlState());
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        okButton.titleLabel?.font =  FONT20()
        okButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(okButton);
        
        
        cancelButton = UIButton(type: UIButtonType.system);
        cancelButton.setTitle(localString("cancel"), for: UIControlState());
        cancelButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState())
        cancelButton.titleLabel?.font = FONT20()
        cancelButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(cancelButton);
       
        if DEVICE == .phone{
           addPhoneUserAccountsConstraint()
        }else{
           addUserAccountsConstraint()
        }
       
    }
    
    func addPhoneUserAccountsConstraint(){
        promptView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT/9);
            
        }

        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.promptView.snp.bottom);
        }

        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }

        self.userIDLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }

        self.userNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.userIDLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }

        self.administratorLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }

        tableViewTopLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTopLine.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 5);
        }

        tableViewBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }

        addButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10);
            make.height.equalTo(25);
        }

        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.addButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/10);
            make.height.equalTo(25);
        }

        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(15);
            make.left.equalTo(self.okButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
    }
    
    func addUserAccountsConstraint(){
        promptView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(105);
            
        }
        
        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.promptView.snp.bottom);
        }
        
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50);
            
        }
        
        self.userIDLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(111);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }
        
        self.userNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.userIDLabel.snp.right).offset(100);
            make.width.equalTo(100);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }
        
        self.administratorLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.userNameLabel.snp.right).offset(100);
            make.width.equalTo(160);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
        }
        
        tableViewTopLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTopLine.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(240);
        }
        
        tableViewBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        addButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(42);
            make.height.equalTo(32);
        }
        
        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.addButton.snp.right).offset(50);
            make.width.equalTo(42);
            make.height.equalTo(32);
        }
        
        cancelButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(35);
            make.left.equalTo(self.okButton.snp.right).offset(50);
            make.width.equalTo(136);
            make.height.equalTo(32);
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
