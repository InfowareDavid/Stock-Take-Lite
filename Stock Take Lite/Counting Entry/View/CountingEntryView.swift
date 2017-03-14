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
        skuCodeLabel.textAlignment = NSTextAlignment.left;
        skuCodeLabel.numberOfLines = 0;
        skuCodeLabel.textColor = self.colorWithString("#2A9CAB");
        skuCodeLabel.font = FONT15WEIGHT04()
        self.tableViewTitleView.addSubview(skuCodeLabel);
        
        
        skuNameLabel = UILabel();
        skuNameLabel.text = localString("eSKUName");
        skuNameLabel.textAlignment = NSTextAlignment.left;
        skuNameLabel.numberOfLines = 0;
        skuNameLabel.textColor = self.colorWithString("#2A9CAB");
        skuNameLabel.font = FONT15WEIGHT04()
        self.tableViewTitleView.addSubview(skuNameLabel);
       
        
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = localString("eOnhandQty");
        onhandQtyLabel.textAlignment = NSTextAlignment.left;
        onhandQtyLabel.textColor = self.colorWithString("#2A9CAB");
        onhandQtyLabel.font = FONT15WEIGHT04()
        onhandQtyLabel.numberOfLines = 0;
        self.tableViewTitleView.addSubview(onhandQtyLabel);
       
        
        countQtyLabel = UILabel();
        countQtyLabel.text = localString("eCountQty");
        countQtyLabel.textAlignment = NSTextAlignment.left;
        countQtyLabel.textColor = self.colorWithString("#2A9CAB");
        countQtyLabel.font = FONT15WEIGHT04()
        countQtyLabel.numberOfLines = 0;
        self.tableViewTitleView.addSubview(countQtyLabel);
        
        varianceQtyLabe = UILabel();
        varianceQtyLabe.text = localString("eVarianceQty");
        varianceQtyLabe.textColor = self.colorWithString("#2A9CAB");
        varianceQtyLabe.textAlignment = NSTextAlignment.left;
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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
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
        totalLabel.textAlignment = NSTextAlignment.left;
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
        onhandTotalLabel.textAlignment = NSTextAlignment.left;
        self.totalView.addSubview(onhandTotalLabel);
        
        totalOnhandRightLine = UILabel();
        totalOnhandRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalOnhandRightLine);
       
        
        countTotalLabel = UILabel();
        countTotalLabel.text = "99999";
        countTotalLabel.textColor = self.colorWithString("#636466");
        countTotalLabel.font = FONT20()
        countTotalLabel.textAlignment = NSTextAlignment.left;
        self.totalView.addSubview(countTotalLabel);
        
        totalCountRightLine = UILabel();
        totalCountRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalCountRightLine);
        
        varianceTotalLabel = UILabel();
        varianceTotalLabel.text = "99999";
        //varianceTotalLabel.backgroundColor = UIColor.redColor()
        varianceTotalLabel.textColor = self.colorWithString("#636466");
        varianceTotalLabel.font = FONT20()
        varianceTotalLabel.textAlignment = NSTextAlignment.left;
        self.totalView.addSubview(varianceTotalLabel);
        
        totalLabelBottomLineLabel = UILabel();
        totalLabelBottomLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.totalView.addSubview(totalLabelBottomLineLabel);
        
        saveButton = UIButton(type: UIButtonType.system);
        saveButton.setTitle(localString("save"), for: UIControlState());
        saveButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        saveButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        saveButton.titleLabel?.font = FONT25()
        self.addSubview(saveButton);
        
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_2"), for: UIControlState());
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
       
        logoutButton = UIButton(type: UIButtonType.custom);
        logoutButton.setImage(UIImage(named: "logout"), for: UIControlState());
        self.topImageView.isUserInteractionEnabled = true;
        self.topImageView.addSubview(logoutButton);
        if DEVICE == .phone{
            onhandQtyLabel.textAlignment = .right;
            countQtyLabel.textAlignment = .right
            varianceQtyLabe.textAlignment = .right
            onhandTotalLabel.textAlignment = .right
            countTotalLabel.textAlignment = .right
            varianceTotalLabel.textAlignment = .right
            addPhoneCountingEntryConstraint()
        }else{
            addCountingEntryConstraint()
        }
    }
    
    
    func addPhoneCountingEntryConstraint(){
        middelView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.14);
        }
        fileNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(10);
            make.left.equalTo(self.middelView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        fileNameTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(15);
            make.right.equalTo(self.middelView.snp.right);
            make.bottom.equalTo(self.fileNameLabel.snp.bottom);
            
        }
        skuNumberLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.bottom).offset(10);
            make.left.equalTo(self.fileNameLabel.snp.left);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
            
        }
        skuNumberTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuNumberLabel.snp.top);
            make.left.equalTo(self.skuNumberLabel.snp.right).offset(15);
            make.right.equalTo(self.middelView.snp.right);
            make.bottom.equalTo(self.skuNumberLabel.snp.bottom);
            
        }
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.middelView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }
        skuCodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/3);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        skuNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuCodeLabel.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
        }
        onhandQtyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuNameLabel.snp.bottom);
            
        }
        countQtyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.onhandQtyLabel.snp.bottom);
        }

        varianceQtyLabe.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.countQtyLabel.snp.bottom);
            
        }

        tableViewTopLineLable.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTopLineLable.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 8);
        }
        
        tableViewBottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        totalView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewBottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/3);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(25);
        }

        totalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalView.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalLeftLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalView.snp.left).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }

        totalRightLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        
        onhandTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalRightLineLabel.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }
        
        totalOnhandRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.onhandTotalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        countTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalOnhandRightLine.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalCountRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.countTotalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }

        varianceTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalCountRightLine.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.height.equalTo(25);
            
        }

        totalLabelBottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.bottom);
            make.left.equalTo(self.totalLeftLineLabel.snp.left).offset(0);
            make.right.equalTo(self.totalView.snp.right);
            make.height.equalTo(1);
            
        }

        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }

        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.saveButton.snp.top);
            make.left.equalTo(self.saveButton.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.saveButton.snp.height);
            
        }

        logoutButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.topImageView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-60);
            make.width.equalTo(34);
            make.height.equalTo(30);

            
        }

    }
    
    func addCountingEntryConstraint(){
        middelView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(140);
        }
        fileNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(25);
            make.left.equalTo(self.middelView.snp.left).offset(111);
            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        fileNameTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(40);
            make.right.equalTo(self.middelView.snp.right);
            make.bottom.equalTo(self.fileNameLabel.snp.bottom);
            
        }
        skuNumberLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.fileNameLabel.snp.bottom).offset(10);
            make.left.equalTo(self.fileNameLabel.snp.left);
            make.width.equalTo(140);
            make.height.equalTo(40);
            
        }
        skuNumberTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuNumberLabel.snp.top);
            make.left.equalTo(self.skuNumberLabel.snp.right).offset(30);
            make.right.equalTo(self.middelView.snp.right);
            make.bottom.equalTo(self.skuNumberLabel.snp.bottom);
            
        }
        tableViewTitleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.middelView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(48);
            
        }
        skuCodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTitleView.snp.top);
            make.left.equalTo(self.tableViewTitleView.snp.left).offset(35);
            make.width.equalTo(178);
            make.bottom.equalTo(self.tableViewTitleView.snp.bottom);
            
        }
        skuNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuCodeLabel.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(0);
            make.width.equalTo(200);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
        }
        onhandQtyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right);
            make.width.equalTo(117);
            make.bottom.equalTo(self.skuNameLabel.snp.bottom);
            
        }
        countQtyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right);
            make.width.equalTo(115);
            make.bottom.equalTo(self.onhandQtyLabel.snp.bottom);
        }
        
        varianceQtyLabe.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right).offset(0);
            make.width.equalTo(114);
            make.bottom.equalTo(self.countQtyLabel.snp.bottom);
            
        }
        
        tableViewTopLineLable.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableViewTitleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewTopLineLable.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(480);
        }
        
        tableViewBottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
        totalView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableViewBottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(178);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(48);
        }
        
        totalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalView.snp.left).offset(35);
            make.width.equalTo(197);
            make.height.equalTo(48);
            
        }
        
        totalLeftLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalView.snp.left).offset(2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        
        totalRightLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        
        onhandTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalRightLineLabel.snp.left).offset(25);
            make.width.equalTo(90);
            make.height.equalTo(48);
            
        }
        
        totalOnhandRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.onhandTotalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        countTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalOnhandRightLine.snp.left).offset(25);
            make.width.equalTo(91);
            make.height.equalTo(48);
            
        }
        
        totalCountRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.countTotalLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.totalView.snp.bottom);
            
        }
        
        varianceTotalLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.top);
            make.left.equalTo(self.totalCountRightLine.snp.left).offset(25);
            make.width.equalTo(100);
            make.height.equalTo(48);
            
        }
        
        totalLabelBottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalView.snp.bottom);
            make.left.equalTo(self.totalView.snp.left).offset(2);
            make.right.equalTo(self.totalView.snp.right);
            make.height.equalTo(1);
            
        }
        
        saveButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.saveButton.snp.top);
            make.left.equalTo(self.saveButton.snp.right).offset(160);
            make.width.equalTo(130);
            make.height.equalTo(self.saveButton.snp.height);
            
        }
        
        logoutButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(27);
            make.left.equalTo(self.snp.left).offset(577);
            make.width.equalTo(68);
            make.height.equalTo(55);
            
        }
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
