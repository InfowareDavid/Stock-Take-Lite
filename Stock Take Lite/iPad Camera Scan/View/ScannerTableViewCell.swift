//
//  ScannerTableViewCell.swift
//  Stock Take Lite
//
//  Created by infoware on 10/3/17.
//  Copyright © 2017年 infoware. All rights reserved.
//

import UIKit

class ScannerTableViewCell: UITableViewCell {
    /// Code 标签
    var skuCodeLabel:UILabel!
    
    /// Code 值
    var skuCode:UILabel!
    
    /// Count Qty 标签
    var countQtyLable:UILabel!
    
    /// Count Qty 值
    var countQty:UILabel!
    
    /// SKU 名称 标签
    var skuNameLabel:UILabel!
    
    /// SKU 名称 值
    var skuName:UILabel!
    
    /// 库存数量 标签
    var onhandLabel:UILabel!
    
    /// 库存数量 值
    var onhand:UILabel!
    
    /// 差值 标签
    var varianceQtyLabel:UILabel!
    
    /// 差值
    var varianceQty:UILabel!
    
    /// 线
    var line:UILabel!
    
//    var model:FileDataModel?{
//        
//        set{
//            skuCode.text = model?.barcode as String?
//            countQty.text = model?.countQty as String?
//            self.textLabel?.text = model?.countQty as String?
//            
//        }
//        get{
//            return self.model
//        }
//        
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier )
        self.backgroundColor = UIColor.clear
        
        self.selectionStyle = UITableViewCellSelectionStyle.none;

        skuCodeLabel = UILabel()
        skuCodeLabel.text = "SKU Code:"
        skuCodeLabel.textColor = UIColor.blue
        skuCodeLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(skuCodeLabel)
        
        skuCode = UILabel()
        skuCode.text = ""
        skuCode.textColor = UIColor.red
        skuCode.textAlignment = .left
        skuCode.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(skuCode)
        
        onhandLabel = UILabel()
        onhandLabel.text = "Onhand Qty:"
        onhandLabel.textColor = UIColor.blue
        onhandLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(onhandLabel)
        
        onhand = UILabel()
        onhand.text = ""
        onhand.textColor = UIColor.red
        onhand.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(onhand)
        
        skuNameLabel = UILabel()
        skuNameLabel.text = "SKU Name:"
        skuNameLabel.textColor = UIColor.blue
        skuNameLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(skuNameLabel)
        
        skuName = UILabel()
        skuName.text = ""
        skuName.textColor = UIColor.red
        skuName.textAlignment = .left
        skuName.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(skuName)
        
        countQtyLable = UILabel()
        countQtyLable.text = "Count Qty:"
        countQtyLable.textColor = UIColor.blue
        countQtyLable.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(countQtyLable)
        
        countQty = UILabel()
        countQty.text = ""
        countQty.textColor = UIColor.red
        countQty.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(countQty)
        
        varianceQtyLabel = UILabel()
        varianceQtyLabel.text = "Variance Qty:"
        varianceQtyLabel.textColor = UIColor.blue
        varianceQtyLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(varianceQtyLabel)
        
        varianceQty = UILabel()
        varianceQty.text = ""
        varianceQty.textColor = UIColor.red
        varianceQty.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(varianceQty)
        
        line = UILabel()
        line.backgroundColor = UIColor.black
        self.contentView.addSubview(line)

        addScannerCellConstraint()
        
        
    }
    
    func addScannerCellConstraint(){
        
        skuCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.height.equalTo(self.skuNameLabel.snp.height)
            make.width.equalTo(150)//self.skuCode.snp.width
            
            make.top.equalTo(self.contentView.snp.top)
        }
        
        skuCode.snp.makeConstraints { (make) in
            make.left.equalTo(self.skuCodeLabel.snp.right)
            make.top.equalTo(self.skuCodeLabel.snp.top)
            make.height.equalTo(self.skuCodeLabel.snp.height)
            make.right.equalTo(self.contentView.snp.right)
        }
        
        
        skuNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.top.equalTo(self.skuCodeLabel.snp.bottom)
            make.bottom.equalTo(self.onhandLabel.snp.top)
            make.right.equalTo(self.skuName.snp.left)
            make.width.equalTo(150)
            make.height.equalTo(self.skuCodeLabel.snp.height)
            //make.width.equalTo(self.skuName.snp.width)
        }
        
        skuName.snp.makeConstraints { (make) in
            make.left.equalTo(self.skuNameLabel.snp.right)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.skuNameLabel.snp.bottom)
            make.top.equalTo(self.skuNameLabel.snp.top)
            
        }
        
        onhandLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.height.equalTo(self.skuNameLabel.snp.height)
            make.top.equalTo(self.skuNameLabel.snp.bottom)
            make.right.equalTo(self.onhand.snp.left)
            make.width.equalTo(self.onhand.snp.width)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        onhand.snp.makeConstraints { (make) in
            make.left.equalTo(self.onhandLabel.snp.right)
            make.centerY.equalTo(self.onhandLabel.snp.centerY)
            make.width.equalTo(self.onhandLabel.snp.width)
            make.height.equalTo(self.onhandLabel.snp.height)
            make.right.equalTo(self.countQtyLable.snp.left)
        }
        
        
        countQtyLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.onhand.snp.right)
            make.centerY.equalTo(self.onhand.snp.centerY)
            make.width.equalTo(self.onhand.snp.width)
            make.height.equalTo(self.onhand.snp.height)
            make.right.equalTo(self.countQty.snp.left)
        }
        
        countQty.snp.makeConstraints { (make) in
            make.left.equalTo(self.countQtyLable.snp.right)
            make.height.width.centerY.equalTo(self.countQtyLable)
            make.right.equalTo(self.varianceQtyLabel.snp.left)
        }
        
        varianceQtyLabel.snp.makeConstraints { (make) in
            make.height.width.centerY.equalTo(self.countQty)
            make.left.equalTo(self.countQty.snp.right)
            make.right.equalTo(self.varianceQty.snp.left)
        }
        
        varianceQty.snp.makeConstraints { (make) in
            make.width.height.centerY.equalTo(self.varianceQtyLabel)
            make.left.equalTo(self.varianceQtyLabel.snp.right)
            make.right.equalTo(self.contentView.snp.right)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.contentView.backgroundColor = self.colorWithString("#CBEAF1")
        }else{
            self.contentView.backgroundColor = UIColor.clear;
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
