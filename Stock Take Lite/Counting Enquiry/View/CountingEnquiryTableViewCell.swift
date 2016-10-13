//
//  CountingEnquiryTableViewCell.swift
//  Stock Take Lite
//
//  Created by infoware on 15/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEnquiryTableViewCell: UITableViewCell {
    
    var     dataAndTimeLabel:               UILabel!;
    var     numberOfSKULabel:               UILabel!;
    var     onhandQtyLabel:                 UILabel!;
    var     countedQtyLabel:                UILabel!;
    var     dataAndTimeRightLine:           UILabel!;
    var     numberOfSKURightLine:           UILabel!;
    var     onhandQtyRightLine:             UILabel!;
    var     cellBottomLine:                 UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        
        dataAndTimeLabel = UILabel();
        dataAndTimeLabel.text = "DD MMM YY HH:MM";
        dataAndTimeLabel.font = FONT20()
        dataAndTimeLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(dataAndTimeLabel);
        
        dataAndTimeRightLine = UILabel();
        dataAndTimeRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(dataAndTimeRightLine);
        
        numberOfSKULabel = UILabel();
        numberOfSKULabel.text = "999";
        numberOfSKULabel.font = FONT20()
        numberOfSKULabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(numberOfSKULabel);
        
        numberOfSKURightLine = UILabel();
        numberOfSKURightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(numberOfSKURightLine);
        
        onhandQtyLabel = UILabel();
        onhandQtyLabel.text = "999";
        onhandQtyLabel.font = FONT20()
        onhandQtyLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(onhandQtyLabel);
        
        onhandQtyRightLine = UILabel();
        onhandQtyRightLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(onhandQtyRightLine);
        
        countedQtyLabel = UILabel();
        countedQtyLabel.text = "999";
        countedQtyLabel.font = FONT20()
        countedQtyLabel.textColor = self.colorWithString("#636466");
        self.contentView.addSubview(countedQtyLabel);
        
        cellBottomLine = UILabel();
        cellBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(cellBottomLine);
        if DEVICE == .Phone{
            numberOfSKULabel.textAlignment = .Right
            onhandQtyLabel.textAlignment = .Right
            countedQtyLabel.textAlignment = .Right
            addPhoneCountingEnquiryConstraint()
        }else{
            addCountingEnquiryConstraint()
        }
    }
    
    func addPhoneCountingEnquiryConstraint(){
        dataAndTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }

        dataAndTimeRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right).with.offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }

        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        numberOfSKURightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right).with.offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }

        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }

        onhandQtyRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right).with.offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }

        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right).with.offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }

        cellBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }
    }
    
    func addCountingEnquiryConstraint(){
        dataAndTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(35);
            make.width.equalTo(368);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        dataAndTimeRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        numberOfSKULabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.dataAndTimeLabel.mas_right).with.offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        numberOfSKURightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        onhandQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.numberOfSKULabel.mas_right).with.offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        onhandQtyRightLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        countedQtyLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.onhandQtyLabel.mas_right).with.offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        cellBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }
    }
    
    func FONT20()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9)
        }
        return UIFont.systemFontOfSize(20)
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
