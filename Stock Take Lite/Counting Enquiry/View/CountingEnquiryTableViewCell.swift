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
        
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        
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
        if DEVICE == .phone{
            numberOfSKULabel.textAlignment = .right
            onhandQtyLabel.textAlignment = .right
            countedQtyLabel.textAlignment = .right
            addPhoneCountingEnquiryConstraint()
        }else{
            addCountingEnquiryConstraint()
        }
    }
    
    func addPhoneCountingEnquiryConstraint(){
        dataAndTimeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(15);
            make.width.equalTo(SCREENWIDTH/2);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }

        dataAndTimeRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right).offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }

        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        numberOfSKURightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right).offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }

        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }

        onhandQtyRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right).offset(5);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }

        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right).offset(0);
            make.width.equalTo(SCREENWIDTH/7);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }

        cellBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.height.equalTo(1);
            
        }
    }
    
    func addCountingEnquiryConstraint(){
        dataAndTimeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(35);
            make.width.equalTo(368);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        dataAndTimeRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        numberOfSKULabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.dataAndTimeLabel.snp.right).offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        numberOfSKURightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        onhandQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.numberOfSKULabel.snp.right).offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        onhandQtyRightLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right);
            make.width.equalTo(1);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        countedQtyLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.onhandQtyLabel.snp.right).offset(20);
            make.width.equalTo(96);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        cellBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.height.equalTo(1);
            
        }
    }
    
    func FONT20()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 9)
        }
        return UIFont.systemFont(ofSize: 20)
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
