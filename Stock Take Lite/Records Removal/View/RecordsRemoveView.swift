//
//  RecordsRemoveView.swift
//  Stock Take Lite
//
//  Created by infoware on 19/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class RecordsRemoveView: QuantityImportBaseView {
    
    var         chooseRemoveDateView:                       UIView!;
    var         chooseRemovePromptLabel:                    UILabel!;
    var         chooseRemoveDateButton:                     UIButton!
    var         tableViewTitleView:                         UIView!;
    var         dataAndTimeLabel:                           UILabel!;
    var         numberOfSKULabel:                           UILabel!;
    var         onhandQtyLabel:                             UILabel!;
    var         countedQtyLabel:                            UILabel!;
    var         tableView:                                  UITableView!;
    var         tableViewBottomLine:                        UILabel!;
    var         promptBottomLine:                           UILabel!;
    var         removeStateLabel:                           UILabel!;
    var         okButton:                                   UIButton!;
    var         returnButton:                               UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("rTitle");
        chooseRemoveDateView = UIView();
        chooseRemoveDateView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(chooseRemoveDateView);
        
        chooseRemovePromptLabel = UILabel();
        chooseRemovePromptLabel.text = localString("rPrompt");
        chooseRemovePromptLabel.font = FONT25()
        chooseRemovePromptLabel.textColor = self.colorWithString("#6D6E71");
        self.chooseRemoveDateView.addSubview(chooseRemovePromptLabel);
        
        chooseRemoveDateButton = UIButton(type: UIButtonType.custom);
        chooseRemoveDateButton.setTitle("MM DDD YYY", for: UIControlState());
        chooseRemoveDateButton.layer.borderWidth = 1;
        chooseRemoveDateButton.layer.borderColor = self.colorWithString("#2A9CAB").cgColor;
        chooseRemoveDateButton.backgroundColor = UIColor.white;
        chooseRemoveDateButton.setTitleColor(self.colorWithString("#6D6E71"), for: UIControlState());
        chooseRemoveDateButton.titleLabel?.font = FONT20()
        self.chooseRemoveDateView.addSubview(chooseRemoveDateButton);
        
        tableViewTitleView = UIView();
        tableViewTitleView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(tableViewTitleView);
        
        promptBottomLine = UILabel();
        promptBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(promptBottomLine);
        
        dataAndTimeLabel = UILabel();
        dataAndTimeLabel.text = localString("rData");
        dataAndTimeLabel.numberOfLines = 0;
        dataAndTimeLabel.textColor = self.colorWithString("#2A9CAB");
        dataAndTimeLabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(dataAndTimeLabel);
        
        numberOfSKULabel = UILabel();
        numberOfSKULabel.text = localString("rNumOfSKU");
        numberOfSKULabel.numberOfLines = 0;
        numberOfSKULabel.textColor = self.colorWithString("#2A9CAB");
        numberOfSKULabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(numberOfSKULabel);
       
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = localString("rOnhandQty");
        onhandQtyLabel.numberOfLines = 0;
        onhandQtyLabel.textColor = self.colorWithString("#2A9CAB");
        onhandQtyLabel.font = FONT20WEIGHT03()
        self.tableViewTitleView.addSubview(onhandQtyLabel);
       
        countedQtyLabel = UILabel();
        countedQtyLabel.text = localString("rCountedQty");
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
       
        removeStateLabel = UILabel();
        removeStateLabel.textColor = self.colorWithString("#6D6E71");
        removeStateLabel.font = FONT20()
        removeStateLabel.text = "";
        self.addSubview(removeStateLabel);
        
        okButton = UIButton(type: UIButtonType.system);
        okButton.setTitle(localString("ok"), for: UIControlState());
        okButton.titleLabel?.font = FONT25()
        okButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        self.addSubview(okButton);
      
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
        
        if DEVICE == .phone{
            numberOfSKULabel.textAlignment = .right
            onhandQtyLabel.textAlignment = .right
            countedQtyLabel.textAlignment = .right
            addPhoneRecordRemoveConstraint()
        }else{
            addRecordRemoveConstraint()
        }
    }
    
    func addPhoneRecordRemoveConstraint(){
        chooseRemoveDateView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.09);
        }

        chooseRemovePromptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemoveDateView.snp.top);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10.0);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.chooseRemoveDateView.snp.bottom).offset(-25);
            
        }

        chooseRemoveDateButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemovePromptLabel.snp.bottom);
            make.left.equalTo(self.chooseRemoveDateView.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH * 0.26);
            make.height.equalTo(20);
            
        }

        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemoveDateView.snp.bottom);
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
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(5);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }

        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right).offset(5);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right).offset(-10);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        

        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
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

        removeStateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(5);
            make.left.equalTo(self.snp.left).offset(5);
            make.right.equalTo(self.snp.right).offset(5);
            make.height.equalTo(25);
            
        }

        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.removeStateLabel.snp.bottom).offset(5);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5.0);
            make.height.equalTo(25);
            
        }
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.okButton.snp.top);
            make.left.equalTo(self.okButton.snp.right).offset(15);
            make.width.equalTo(self.okButton.snp.width);
            make.height.equalTo(self.okButton.snp.height);
            
        }
        
    }
    
    func addRecordRemoveConstraint(){
        chooseRemoveDateView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(90);
        }
        
        chooseRemovePromptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemoveDateView.snp.top);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.right);
            make.bottom.equalTo(self.chooseRemoveDateView.snp.bottom).offset(-40);
            
        }
        
        chooseRemoveDateButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemovePromptLabel.snp.bottom);
            make.left.equalTo(self.chooseRemoveDateView.snp.left).offset(111);
            make.width.equalTo(200);
            make.height.equalTo(30);
            
        }
        
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.chooseRemoveDateView.snp.bottom);
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
            make.width.equalTo(85);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        
        tableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptBottomLine.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(566);
            
        }
        
        tableViewBottomLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
        }
        
        removeStateLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewBottomLine.snp.bottom).offset(10);
            make.left.equalTo(self.snp.left).offset(35);
            make.right.equalTo(self.snp.right).offset(35);
            make.height.equalTo(30);
            
        }
        
        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom).offset(70);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(112);
            make.height.equalTo(32);
            
        }
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.okButton.snp.top);
            make.left.equalTo(self.okButton.snp.right).offset(160);
            make.width.equalTo(self.okButton.snp.width);
            make.height.equalTo(self.okButton.snp.height);
            
        }
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
