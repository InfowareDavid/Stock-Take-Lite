//
//  CountingEntryView.swift
//  Stock Take Lite
//
//  Created by infoware on 13/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEntryView: QuantityImportBaseView {
    var     middelView:                     UIView!;
    var     fileNameLabel:                  UILabel!;
    var     fileNameTextLabel:              UILabel!;
    var     skuNumberLabel:                 UILabel!;
    var     skuNumberTextLabel:             UILabel!;
    var     tableViewTitleView:             UIView!;
    var     skuCodeLabel:                   UILabel!;
    var     skuNameLabel:                   UILabel!;
    var     onhandQtyLabel:                 UILabel!;
    var     countQtyLabel:                  UILabel!;
    var     varianceQtyLabe:                UILabel!;
    var     tableViewTopLineLable:          UILabel!;
    var     tableView:                      UITableView!;
    var     saveButton:                     UIButton!;
    var     returnButton:                   UIButton!;
    var     logoutButton:                   UIButton!;
    var     totalView:                      UIView!;
    var     totalLabel:                     UILabel!;
    var     onhandTotalLabel:               UILabel!;
    var     countTotalLabel:                UILabel!;
    var     varianceTotalLabel:             UILabel!;
    var     tableViewBottomLineLabel:       UILabel!;
    var     totalLabelBottomLineLabel:      UILabel!;
    var     totalLeftLineLabel:             UILabel!;
    var     totalRightLineLabel:            UILabel!;
    var     totalOnhandRightLine:           UILabel!;
    var     totalCountRightLine:            UILabel!;
    
    override  init(frame: CGRect) {
        super.init(frame: frame);
        
        self.loadMyView();
    }
    
    func loadMyView(){
        self.secondeTopLabel.text = localString("eTitle");
        middelView = UIView();
        middelView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(middelView);
        
        fileNameLabel = UILabel();
        fileNameLabel.text = localString("eFileName");
        fileNameLabel.textColor = self.colorWithString("#6D6E71");
        fileNameLabel.font = FONT25()
        self.middelView.addSubview(fileNameLabel);
        
        fileNameTextLabel = UILabel();
        fileNameTextLabel.text = "File 3";
        fileNameTextLabel.textColor = self.colorWithString("#6D6E71");
        fileNameTextLabel.font = FONT25()
        self.middelView.addSubview(fileNameTextLabel);
        

        skuNumberLabel = UILabel();
        skuNumberLabel.text = localString("eNumOfSKU");
        skuNumberLabel.textColor = self.colorWithString("#6D6E71");
        skuNumberLabel.font = FONT25()
        self.middelView.addSubview(skuNumberLabel);
        
        skuNumberTextLabel = UILabel();
        skuNumberTextLabel.text = "999999";
        skuNumberTextLabel.textColor = self.colorWithString("#6D6E71");
        skuNumberTextLabel.font = FONT25()
        self.middelView.addSubview(skuNumberTextLabel);
        
        tableViewTitleView = UIView();
        tableViewTitleView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(tableViewTitleView);
       
        skuCodeLabel = UILabel();
        skuCodeLabel.text = localString("eSKUCode");
        skuCodeLabel.textAlignment = NSTextAlignment.Left;
        skuCodeLabel.numberOfLines = 0;
        skuCodeLabel.textColor = self.colorWithString("#2A9CAB");
        skuCodeLabel.font = FONT15WEIGHT04()
        self.tableViewTitleView.addSubview(skuCodeLabel);
        
        
        skuNameLabel = UILabel();
        skuNameLabel.text = localString("eSKUName");
        skuNameLabel.textAlignment = NSTextAlignment.Left;
        skuNameLabel.numberOfLines = 0;
        skuNameLabel.textColor = self.colorWithString("#2A9CAB");
        skuNameLabel.font = FONT15WEIGHT04()
        self.tableViewTitleView.addSubview(skuNameLabel);
       
        
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = localString("eOnhandQty");
        onhandQtyLabel.textAlignment = NSTextAlignment.Left;
        onhandQtyLabel.textColor = self.colorWithString("#2A9CAB");
        onhandQtyLabel.font = FONT15WEIGHT04()
        onhandQtyLabel.numberOfLines = 0;
        self.tableViewTitleView.addSubview(onhandQtyLabel);
       
        
        countQtyLabel = UILabel();
        countQtyLabel.text = localString("eCountQty");
        countQtyLabel.textAlignment = NSTextAlignment.Left;
        countQtyLabel.textColor = self.colorWithString("#2A9CAB");
        countQtyLabel.font = FONT15WEIGHT04()
        countQtyLabel.numberOfLines = 0;
        self.tableViewTitleView.addSubview(countQtyLabel);
        
        varianceQtyLabe = UILabel();
        varianceQtyLabe.text = localString("eVarianceQty");
        varianceQtyLabe.textColor = self.colorWithString("#2A9CAB");
        varianceQtyLabe.textAlignment = NSTextAlignment.Left;
        varianceQtyLabe.font = FONT15WEIGHT04()
        varianceQtyLabe.numberOfLines = 0;
        self.tableViewTitleView.addSubview(varianceQtyLabe);
        
        tableViewTopLineLable = UILabel();
        tableViewTopLineLable.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewTopLineLable);
        
        tableView = UITableView();
        //tableView.separatorColor = self.colorWithString("#2A9CAB");
        //tableView.separatorInset = UIEdgeInsetsMake(0,0,0,0);
        tableView.bounces = false;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.addSubview(tableView);
        
        tableViewBottomLineLabel = UILabel();
        tableViewBottomLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(tableViewBottomLineLabel);
        
        totalView = UIView();
        self.addSubview(totalView);
        
        totalLabel = UILabel();
        totalLabel.text = localString("eTotal");
        totalLabel.textColor = self.colorWithString("#636466");
        totalLabel.font = FONT20()
        totalLabel.textAlignment = NSTextAlignment.Left;
        self.totalView.addSubview(totalLabel);
       
        totalLeftLineLabel = UILabel();
        totalLeftLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalLeftLineLabel);
        
        totalRightLineLabel = UILabel();
        totalRightLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalRightLineLabel);
       
        onhandTotalLabel = UILabel();
        onhandTotalLabel.text = "99999";
        onhandTotalLabel.textColor = self.colorWithString("#636466");
        onhandTotalLabel.font = FONT20()
        onhandTotalLabel.textAlignment = NSTextAlignment.Left;
        self.totalView.addSubview(onhandTotalLabel);
        
        totalOnhandRightLine = UILabel();
        totalOnhandRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalOnhandRightLine);
       
        
        countTotalLabel = UILabel();
        countTotalLabel.text = "99999";
        countTotalLabel.textColor = self.colorWithString("#636466");
        countTotalLabel.font = FONT20()
        countTotalLabel.textAlignment = NSTextAlignment.Left;
        self.totalView.addSubview(countTotalLabel);
        
        totalCountRightLine = UILabel();
        totalCountRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalCountRightLine);
        
        varianceTotalLabel = UILabel();
        varianceTotalLabel.text = "99999";
        //varianceTotalLabel.backgroundColor = UIColor.redColor()
        varianceTotalLabel.textColor = self.colorWithString("#636466");
        varianceTotalLabel.font = FONT20()
        varianceTotalLabel.textAlignment = NSTextAlignment.Left;
        self.totalView.addSubview(varianceTotalLabel);
        
        totalLabelBottomLineLabel = UILabel();
        totalLabelBottomLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalLabelBottomLineLabel);
        
        saveButton = UIButton(type: UIButtonType.System);
        saveButton.setTitle(localString("save"), forState: UIControlState.Normal);
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        saveButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        saveButton.titleLabel?.font = FONT25()
        self.addSubview(saveButton);
        
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_2"), forState: UIControlState.Normal);
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
       
        logoutButton = UIButton(type: UIButtonType.Custom);
        logoutButton.setImage(UIImage(named: "logout"), forState: UIControlState.Normal);
        self.topImageView.userInteractionEnabled = true;
        self.topImageView.addSubview(logoutButton);
        if DEVICE == .Phone{
            onhandQtyLabel.textAlignment = .Right;
            countQtyLabel.textAlignment = .Right
            varianceQtyLabe.textAlignment = .Right
            onhandTotalLabel.textAlignment = .Right
            countTotalLabel.textAlignment = .Right
            varianceTotalLabel.textAlignment = .Right
            addPhoneCountingEntryConstraint()
        }else{
            addCountingEntryConstraint()
        }
    }
    
    
    func addPhoneCountingEntryConstraint(){
        middelView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.14);
        }
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middelView.mas_top).with.offset(10);
            make.left.equalTo(self.middelView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        fileNameTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(15);
            make.right.equalTo(self.middelView.mas_right);
            make.bottom.equalTo(self.fileNameLabel.mas_bottom);
            
        }
        skuNumberLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.fileNameLabel.mas_left);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
            
        }
        skuNumberTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNumberLabel.mas_top);
            make.left.equalTo(self.skuNumberLabel.mas_right).with.offset(15);
            make.right.equalTo(self.middelView.mas_right);
            make.bottom.equalTo(self.skuNumberLabel.mas_bottom);
            
        }
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.middelView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        skuCodeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/3);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        skuNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuCodeLabel.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
        }
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuNameLabel.mas_bottom);
            
        }
        countQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.onhandQtyLabel.mas_bottom);
        }

        varianceQtyLabe.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.countQtyLabel.mas_bottom);
            
        }

        tableViewTopLineLable.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }

        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLineLable.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 8);
        }
        
        tableViewBottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        totalView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewBottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/3);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(25);
        }

        totalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalView.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalLeftLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalView.mas_left).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }

        totalRightLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        
        onhandTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalRightLineLabel.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }
        
        totalOnhandRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.onhandTotalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        countTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalOnhandRightLine.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalCountRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.countTotalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }

        varianceTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalCountRightLine.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalLabelBottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_bottom);
            make.left.equalTo(self.totalLeftLineLabel.mas_left).with.offset(0);
            make.right.equalTo(self.totalView.mas_right);
            make.height.equalTo(1);
            
        }

        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.saveButton.mas_top);
            make.left.equalTo(self.saveButton.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.saveButton.mas_height);
            
        }

        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.centerY.equalTo(self.topImageView.mas_centerY)
            make.right.equalTo(self.mas_right).with.offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);

            
        }

    }
    
    func addCountingEntryConstraint(){
        middelView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(140);
        }
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middelView.mas_top).with.offset(25);
            make.left.equalTo(self.middelView.mas_left).with.offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        fileNameTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(40);
            make.right.equalTo(self.middelView.mas_right);
            make.bottom.equalTo(self.fileNameLabel.mas_bottom);
            
        }
        skuNumberLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.fileNameLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.fileNameLabel.mas_left);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        skuNumberTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNumberLabel.mas_top);
            make.left.equalTo(self.skuNumberLabel.mas_right).with.offset(30);
            make.right.equalTo(self.middelView.mas_right);
            make.bottom.equalTo(self.skuNumberLabel.mas_bottom);
            
        }
        tableViewTitleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.middelView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(48);
            
        }
        skuCodeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTitleView.mas_top);
            make.left.equalTo(self.tableViewTitleView.mas_left).with.offset(35);
            make.width.equalTo(178);
            make.bottom.equalTo(self.tableViewTitleView.mas_bottom);
            
        }
        skuNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuCodeLabel.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(0);
            make.width.equalTo(200);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
        }
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right);
            make.width.equalTo(117);
            make.bottom.equalTo(self.skuNameLabel.mas_bottom);
            
        }
        countQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right);
            make.width.equalTo(115);
            make.bottom.equalTo(self.onhandQtyLabel.mas_bottom);
        }
        
        varianceQtyLabe.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(114);
            make.bottom.equalTo(self.countQtyLabel.mas_bottom);
            
        }
        
        tableViewTopLineLable.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableViewTitleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLineLable.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(480);
        }
        
        tableViewBottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
        totalView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewBottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(178);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(48);
        }
        
        totalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalView.mas_left).with.offset(35);
            make.width.equalTo(197);
            make.height.equalTo(48);
            
        }
        
        totalLeftLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalView.mas_left).with.offset(2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        
        totalRightLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        
        onhandTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalRightLineLabel.mas_left).with.offset(25);
            make.width.equalTo(90);
            make.height.equalTo(48);
            
        }
        
        totalOnhandRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.onhandTotalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        countTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalOnhandRightLine.mas_left).with.offset(25);
            make.width.equalTo(91);
            make.height.equalTo(48);
            
        }
        
        totalCountRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.countTotalLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.mas_bottom);
            
        }
        
        varianceTotalLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_top);
            make.left.equalTo(self.totalCountRightLine.mas_left).with.offset(25);
            make.width.equalTo(100);
            make.height.equalTo(48);
            
        }
        
        totalLabelBottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalView.mas_bottom);
            make.left.equalTo(self.totalView.mas_left).with.offset(2);
            make.right.equalTo(self.totalView.mas_right);
            make.height.equalTo(1);
            
        }
        
        saveButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.saveButton.mas_top);
            make.left.equalTo(self.saveButton.mas_right).with.offset(160);
            make.width.equalTo(130);
            make.height.equalTo(self.saveButton.mas_height);
            
        }
        
        logoutButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top).with.offset(27);
            make.left.equalTo(self.mas_left).with.offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
