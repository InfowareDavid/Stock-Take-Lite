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
        
        chooseRemoveDateButton = UIButton(type: UIButtonType.Custom);
        chooseRemoveDateButton.setTitle("MM DDD YYY", forState: UIControlState.Normal);
        chooseRemoveDateButton.layer.borderWidth = 1;
        chooseRemoveDateButton.layer.borderColor = self.colorWithString("#2A9CAB").CGColor;
        chooseRemoveDateButton.backgroundColor = UIColor.whiteColor();
        chooseRemoveDateButton.setTitleColor(self.colorWithString("#6D6E71"), forState: UIControlState.Normal);
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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.addSubview(tableView);
        
        tableViewBottomLine = UILabel();
        tableViewBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLine);
       
        removeStateLabel = UILabel();
        removeStateLabel.textColor = self.colorWithString("#6D6E71");
        removeStateLabel.font = FONT20()
        removeStateLabel.text = "";
        self.addSubview(removeStateLabel);
        
        okButton = UIButton(type: UIButtonType.System);
        okButton.setTitle(localString("ok"), forState: UIControlState.Normal);
        okButton.titleLabel?.font = FONT25()
        okButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        self.addSubview(okButton);
      
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
        
        if DEVICE == .Phone{
            numberOfSKULabel.textAlignment = .Right
            onhandQtyLabel.textAlignment = .Right
            countedQtyLabel.textAlignment = .Right
            addPhoneRecordRemoveConstraint()
        }else{
            addRecordRemoveConstraint()
        }
    }
    
    func addPhoneRecordRemoveConstraint(){
        chooseRemoveDateView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.09);
        }

        chooseRemovePromptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemoveDateView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10.0);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.chooseRemoveDateView.mas_bottom).with.offset(-25);
            
        }

        chooseRemoveDateButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemovePromptLabel.mas_bottom);
            make.left.equalTo(self.chooseRemoveDateView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH * 0.26);
            make.height.equalTo(20);
            
        }

        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemoveDateView.mas_bottom);
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
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(5);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }

        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right).with.offset(5);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right).with.offset(-10);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        

        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
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

        removeStateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(5);
            make.left.equalTo(self.mas_left).with.offset(5);
            make.right.equalTo(self.mas_right).with.offset(5);
            make.height.equalTo(25);
            
        }

        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.removeStateLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10.0);
            make.width.equalTo(SCREENWIDTH/5.0);
            make.height.equalTo(25);
            
        }
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.okButton.mas_top);
            make.left.equalTo(self.okButton.mas_right).with.offset(15);
            make.width.equalTo(self.okButton.mas_width);
            make.height.equalTo(self.okButton.mas_height);
            
        }
        
    }
    
    func addRecordRemoveConstraint(){
        chooseRemoveDateView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(90);
        }
        
        chooseRemovePromptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemoveDateView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.chooseRemoveDateView.mas_bottom).with.offset(-40);
            
        }
        
        chooseRemoveDateButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemovePromptLabel.mas_bottom);
            make.left.equalTo(self.chooseRemoveDateView.mas_left).with.offset(111);
            make.width.equalTo(200);
            make.height.equalTo(30);
            
        }
        
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.chooseRemoveDateView.mas_bottom);
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
            make.width.equalTo(85);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        
        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptBottomLine.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(566);
            
        }
        
        tableViewBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
        }
        
        removeStateLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewBottomLine.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(35);
            make.right.equalTo(self.mas_right).with.offset(35);
            make.height.equalTo(30);
            
        }
        
        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom).with.offset(70);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(112);
            make.height.equalTo(32);
            
        }
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.okButton.mas_top);
            make.left.equalTo(self.okButton.mas_right).with.offset(160);
            make.width.equalTo(self.okButton.mas_width);
            make.height.equalTo(self.okButton.mas_height);
            
        }
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
