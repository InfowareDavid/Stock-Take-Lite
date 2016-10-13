//
//  QuantityImportTableViewCell.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityImportTableViewCell: UITableViewCell {

    var  fileNameLabel:                     UILabel!;
    var  fileTimeLabel:                     UILabel!;
    var  cellBottomLine:                    UILabel!;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        fileNameLabel = UILabel();
        fileNameLabel.font = FONT20()
        self.contentView.addSubview(fileNameLabel);
        
        fileTimeLabel = UILabel();
        fileTimeLabel.font = FONT20()
        self.contentView.addSubview(fileTimeLabel);
        
        cellBottomLine = UILabel();
        cellBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(cellBottomLine);
        if DEVICE == .Phone{
            addPhoneCellConstraint()
        }else{
            addCellConstraint()
        }
    }
    
    func FONT20()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9)
        }
        return UIFont.systemFontOfSize(20)
    }
    func addPhoneCellConstraint(){
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH*0.3);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        fileTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH*0.32);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        cellBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }
    }

    func addCellConstraint(){
        fileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).with.offset(111);
            make.width.equalTo(200);
            make.bottom.equalTo(self.contentView.mas_bottom);
            
        }
        
        fileTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.fileNameLabel.mas_right).with.offset(100);
            make.width.equalTo(250);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }
        
        cellBottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.contentView.mas_bottom).with.offset(-1);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = self.colorWithString("#CBEAF1");
        }else{
            self.contentView.backgroundColor = UIColor.whiteColor();
        }
        // Configure the view for the selected state
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
    


}
