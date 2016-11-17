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
        
        self.selectionStyle = UITableViewCellSelectionStyle.none;
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
        
        if DEVICE == .phone{
            addPhoneUserAccountsCellConstraint()
        }else{
            addUserAccountsCellConstraint()
        }
        
    }
    
    func addPhoneUserAccountsCellConstraint(){
        
        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(0);
            make.left.equalTo(self.contentView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.snp.height);
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userIDLabel.snp.top).offset(0);
            make.left.equalTo(self.userIDLabel.snp.right).offset(100);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.snp.height);
        }

        administratorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.top).offset(0);
            make.left.equalTo(self.userNameLabel.snp.right).offset(100);
            make.width.equalTo(SCREENWIDTH/10 * 3.0);
            make.height.equalTo(self.contentView.snp.height);
        }
        bottomLine.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(self.contentView.snp.bottom);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.height.equalTo(1);
            
        }

    }
    func addUserAccountsCellConstraint(){
        
        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(0);
            make.left.equalTo(self.contentView.snp.left).offset(111);
            make.width.equalTo(100);
            make.height.equalTo(48);
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userIDLabel.snp.top).offset(0);
            make.left.equalTo(self.userIDLabel.snp.right).offset(100);
            make.width.equalTo(130);
            make.height.equalTo(48);
        }
        
        administratorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.top).offset(0);
            make.left.equalTo(self.userNameLabel.snp.right).offset(100);
            make.width.equalTo(160);
            make.height.equalTo(48);
        }
        bottomLine.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(self.contentView.snp.bottom);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.height.equalTo(1);
            
        }
        
    }

    
    func FONT25()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 14)
        }
        return UIFont.systemFont(ofSize: 25)
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

}
