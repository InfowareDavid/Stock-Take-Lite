//
//  CountingEnquiryDetalCell.swift
//  Stock Take Lite
//
//  Created by infoware on 3/11/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEnquiryDetalCell: UITableViewCell {

    var     skuCodeLabel:               UILabel!;
    var     skuNameLabel:               UILabel!;
    var     onhandeQtyLabel:            UILabel!;
    var     countQtyLabel:              UILabel!;
    var     varianceQtyLabel:           UILabel!;
    var     bottomLineLabel:            UILabel!;
    var     skucodeLeftLabel:           UILabel!;
    var     skuNameLeftLabel:           UILabel!;
    var     onhandeQtyLeftLabel:        UILabel!;
    var     countQtyLeftLabel:          UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        skuCodeLabel = UILabel();
        skuCodeLabel.text = "A000";
        skuCodeLabel.font = FONT19()
        skuCodeLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(skuCodeLabel);
        
        skucodeLeftLabel = UILabel();
        // skucodeLeftLabel.backgroundColor = UIColor.redColor();
        skucodeLeftLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(skucodeLeftLabel);
        
        skuNameLabel = UILabel();
        skuNameLabel.text = "A000";
        skuNameLabel.font = FONT18()
        skuNameLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(skuNameLabel);
        
        skuNameLeftLabel = UILabel();
        skuNameLeftLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(skuNameLeftLabel);
        
        onhandeQtyLabel = UILabel();
        onhandeQtyLabel.text = "33333";
        onhandeQtyLabel.font = FONT20()
        onhandeQtyLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(onhandeQtyLabel);
        
        onhandeQtyLeftLabel = UILabel();
        onhandeQtyLeftLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(onhandeQtyLeftLabel);
        
        
        countQtyLabel = UILabel();
        countQtyLabel.text = "33333";
        countQtyLabel.font = FONT20()
        countQtyLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(countQtyLabel);
        
        countQtyLeftLabel = UILabel();
        countQtyLeftLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(countQtyLeftLabel);
        
        varianceQtyLabel = UILabel();
        varianceQtyLabel.text = "00000";
        varianceQtyLabel.textColor = self.colorWithString("#636466");
        varianceQtyLabel.font = FONT20()
        self.contentView.addSubview(varianceQtyLabel);
        
        bottomLineLabel = UILabel();
        bottomLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(bottomLineLabel);
        if DEVICE == .Phone{
            onhandeQtyLabel.textAlignment = .Right
            countQtyLabel.textAlignment = .Right
            varianceQtyLabel.textAlignment = .Right
            addPhoneDetailCellConstraint()
        }else{
           addDetailCellConstraint()
        }
        
    }
    func addPhoneDetailCellConstraint(){
        skuCodeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.width.equalTo(SCREENWIDTH/3);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        skucodeLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        skuNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuCodeLabel.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
        }
        
        skuNameLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        onhandeQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuNameLabel.mas_bottom);
            
        }
        
        onhandeQtyLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandeQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        countQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.onhandeQtyLabel.mas_top);
            make.left.equalTo(self.onhandeQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.onhandeQtyLabel.mas_bottom);
        }
        
        countQtyLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        varianceQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countQtyLabel.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
            
        }
        
        bottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
    }

    func addDetailCellConstraint(){
        skuCodeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(32);
            make.width.equalTo(150);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        skucodeLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(-2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        skuNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuCodeLabel.mas_top);
            make.left.equalTo(self.skuCodeLabel.mas_right).with.offset(25);
            make.width.equalTo(203);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
        }
        
        skuNameLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        onhandeQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.skuNameLabel.mas_top);
            make.left.equalTo(self.skuNameLabel.mas_right).with.offset(25);
            make.width.equalTo(92);
            make.bottom.equalTo(self.skuNameLabel.mas_bottom);
            
        }
        
        onhandeQtyLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandeQtyLabel.mas_right).with.offset(-2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        countQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.onhandeQtyLabel.mas_top);
            make.left.equalTo(self.onhandeQtyLabel.mas_right).with.offset(25);
            make.width.equalTo(89);
            make.bottom.equalTo(self.onhandeQtyLabel.mas_bottom);
        }
        
        countQtyLeftLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        varianceQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.countQtyLabel.mas_top);
            make.left.equalTo(self.countQtyLabel.mas_right).with.offset(25);
            make.width.equalTo(95);
            make.bottom.equalTo(self.skuCodeLabel.mas_bottom);
            
        }
        
        bottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
    }

    func FONT20()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9)
        }
        return UIFont.systemFontOfSize(20)
    }
    
    func FONT18()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(7)
        }
        return UIFont.systemFontOfSize(18)
    }
    
    func FONT19()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9)
        }
        return UIFont.systemFontOfSize(19)
    }

    func colorWithString(aString:String)->UIColor{
        var aString = aString
        aString.replaceRange(aString.rangeOfString("#")!, with: "0x");
        
        let colorLong = strtoul(aString.cStringUsingEncoding(NSUTF8StringEncoding)!,
            nil, 16);
        let R = Double((colorLong & 0xFF0000)>>16);
        let G = Double((colorLong & 0x00FF00)>>8);
        let B = Double(colorLong & 0x0000FF);
        
        return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: 1.0);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = self.colorWithString("#CBEAF1");
        }else{
            self.contentView.backgroundColor = UIColor.whiteColor();
        }
    }
    
    

}
