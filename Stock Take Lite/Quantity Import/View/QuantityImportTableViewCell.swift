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
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        fileNameLabel = UILabel();
        fileNameLabel.font = FONT20()
        self.contentView.addSubview(fileNameLabel);
        
        fileTimeLabel = UILabel();
        fileTimeLabel.font = FONT20()
        self.contentView.addSubview(fileTimeLabel);
        
        cellBottomLine = UILabel();
        cellBottomLine.backgroundColor = self.colorWithString("#2A9CAB");
        self.contentView.addSubview(cellBottomLine);
        if DEVICE == .phone{
            addPhoneCellConstraint()
        }else{
            addCellConstraint()
        }
    }
    
    func FONT20()->UIFont{
        if DEVICE == .phone{
            return UIFont.systemFont(ofSize: 9)
        }
        return UIFont.systemFont(ofSize: 20)
    }
    func addPhoneCellConstraint(){
        fileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH*0.3);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        fileTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH*0.32);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        cellBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
            make.height.equalTo(1);
            
        }
    }

    func addCellConstraint(){
        fileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.contentView.snp.left).offset(111);
            make.width.equalTo(200);
            make.bottom.equalTo(self.contentView.snp.bottom);
            
        }
        
        fileTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top);
            make.left.equalTo(self.fileNameLabel.snp.right).offset(100);
            make.width.equalTo(250);
            make.bottom.equalTo(self.contentView.snp.bottom);
        }
        
        cellBottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView.snp.bottom).offset(-1);
            make.left.equalTo(self.contentView.snp.left);
            make.right.equalTo(self.contentView.snp.right);
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = self.colorWithString("#CBEAF1");
        }else{
            self.contentView.backgroundColor = UIColor.white;
        }
        // Configure the view for the selected state
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
