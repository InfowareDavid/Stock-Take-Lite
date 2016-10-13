//
//  UserAccountsSetupTableViewCell.swift
//  Stock Take Lite
//
//  Created by infoware on 19/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class UserAccountsSetupTableViewCell: UITableViewCell {
    
    var             userIDLabel:                        UILabel!;
    var             userNameLabel:                      UILabel!;
    var             administratorLabel:                 UILabel!;
    var             bottomLine:                         UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        userIDLabel = UILabel();
        userIDLabel.text = "User ID";
        userIDLabel.textColor = self.colorWithString("#6D6E71");
        userIDLabel.font = FONT25()
        self.contentView.addSubview(userIDLabel);
       
        
        userNameLabel = UILabel();
        userNameLabel.text = "Name";
        userNameLabel.textColor = self.colorWithString("#6D6E71");
        userNameLabel.font = FONT25()
        self.contentView.addSubview(userNameLabel);
        
        administratorLabel = UILabel();
        administratorLabel.text = "Administrator";
        administratorLabel.textColor = self.colorWithString("#6D6E71");
        administratorLabel.font = FONT25()
        self.contentView.addSubview(administratorLabel);
       
        
        bottomLine = UILabel();
        bottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(bottomLine);
        
        if DEVICE == .Phone{
            addPhoneUserAccountsCellConstraint()
        }else{
            addUserAccountsCellConstraint()
        }
        
    }
    
    func addPhoneUserAccountsCellConstraint(){
        
        userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top).with.offset(0);
            make.left.equalTo(self.contentView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.mas_height);
        }
        userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userIDLabel.mas_top).with.offset(0);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(100);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.mas_height);
        }

        administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userNameLabel.mas_top).with.offset(0);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(100);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.mas_height);
        }
        bottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }

    }
    func addUserAccountsCellConstraint(){
        
        userIDLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.contentView.mas_top).with.offset(0);
            make.left.equalTo(self.contentView.mas_left).with.offset(111);
            make.width.equalTo(100);
            make.height.equalTo(48);
        }
        userNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userIDLabel.mas_top).with.offset(0);
            make.left.equalTo(self.userIDLabel.mas_right).with.offset(100);
            make.width.equalTo(130);
            make.height.equalTo(48);
        }
        
        administratorLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.userNameLabel.mas_top).with.offset(0);
            make.left.equalTo(self.userNameLabel.mas_right).with.offset(100);
            make.width.equalTo(160);
            make.height.equalTo(48);
        }
        bottomLine.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(1);
            
        }
        
    }

    
    func FONT25()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(14)
        }
        return UIFont.systemFontOfSize(25)
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
