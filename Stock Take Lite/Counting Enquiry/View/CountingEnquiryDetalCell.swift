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
        
        self.selectionStyle = UITableViewCellSelectionStyle.none;
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
        if DEVICE == .phone{
            onhandeQtyLabel.textAlignment = .right
            countQtyLabel.textAlignment = .right
            varianceQtyLabel.textAlignment = .right
            addPhoneDetailCellConstraint()
        }else{
           addDetailCellConstraint()
        }
        
    }
    func addPhoneDetailCellConstraint(){
        skuCodeLabel.snp.makeConstraints { (make)in
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(0);
            make.width.equalTo(SCREENWIDTH/3);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        skucodeLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        skuNameLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.skuCodeLabel.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
        }
        
        skuNameLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        onhandeQtyLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuNameLabel.snp.bottom);
            
        }
        
        onhandeQtyLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandeQtyLabel.snp.right).offset(0);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        countQtyLabel.snp.makeConstraints { (make)in
            make.top.equalTo(self.onhandeQtyLabel.snp.top);
            make.left.equalTo(self.onhandeQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.onhandeQtyLabel.snp.bottom);
        }
        
        countQtyLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        varianceQtyLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.countQtyLabel.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/6);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
            
        }
        
        bottomLineLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
    }

    func addDetailCellConstraint(){
        skuCodeLabel.snp.makeConstraints { (make)in
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(32);
            make.width.equalTo(150);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        skucodeLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(-2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        skuNameLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.skuCodeLabel.snp.top);
            make.left.equalTo(self.skuCodeLabel.snp.right).offset(25);
            make.width.equalTo(203);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
        }
        
        skuNameLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        onhandeQtyLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.skuNameLabel.snp.top);
            make.left.equalTo(self.skuNameLabel.snp.right).offset(25);
            make.width.equalTo(92);
            make.bottom.equalTo(self.skuNameLabel.snp.bottom);
            
        }
        
        onhandeQtyLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandeQtyLabel.snp.right).offset(-2);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        countQtyLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.onhandeQtyLabel.snp.top);
            make.left.equalTo(self.onhandeQtyLabel.snp.right).offset(25);
            make.width.equalTo(89);
            make.bottom.equalTo(self.onhandeQtyLabel.snp.bottom);
        }
        
        countQtyLeftLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        varianceQtyLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.countQtyLabel.snp.top);
            make.left.equalTo(self.countQtyLabel.snp.right).offset(25);
            make.width.equalTo(95);
            make.bottom.equalTo(self.skuCodeLabel.snp.bottom);
            
        }
        
        bottomLineLabel.snp.makeConstraints { (make)in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
    }

    func FONT20()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 9)
        }
        return UIFont.systemFont(ofSize: 20)
    }
    
    func FONT18()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 7)
        }
        return UIFont.systemFont(ofSize: 18)
    }
    
    func FONT19()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 9)
        }
        return UIFont.systemFont(ofSize: 19)
    }

    func colorWithString(_ aString:String)->UIColor{
        var aString = aString
        aString.replaceSubrange(aString.range(of: "#")!, with: "0x");
        
        let colorLong = strtoul(aString.cString(using: String.Encoding.utf8)!,
            nil, 16);
        let R = Double((colorLong & 0xFF0000)>>16);
        let G = Double((colorLong & 0x00FF00)>>8);
        let B = Double(colorLong & 0x0000FF);
        
        return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: 1.0);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = self.colorWithString("#CBEAF1");
        }else{
            self.contentView.backgroundColor = UIColor.white;
        }
    }
    
    

}
