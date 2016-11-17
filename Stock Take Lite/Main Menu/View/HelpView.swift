//
//  HelpView.swift
//  Stock Take Lite
//
//  Created by infoware on 13/11/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class HelpView: QuantityImportBaseView {
    
    var     helpLabel:                       UILabel!;
    var     backButton:                      UIButton!
    var     helpScrollView:                  UIScrollView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = self.localString("objective");
        
        self.topImageView.isUserInteractionEnabled = true;
        backButton = UIButton(type: UIButtonType.system);
        backButton.setTitle(localString("back"), for: UIControlState());
        backButton.setTitleColor(UIColor.white, for: UIControlState());
        backButton.titleLabel?.font = FONT20()
        self.topImageView.addSubview(backButton);
        
        helpScrollView = UIScrollView();
        helpScrollView.bounces = true;
        self.addSubview(helpScrollView);
        
        helpLabel = UILabel();
        helpLabel.numberOfLines = 0;
        helpLabel.text = localString("help");
        
        helpLabel.textColor = UIColor.black;
        helpLabel.font = FONT20()
        helpScrollView.addSubview(helpLabel);
        if DEVICE == .phone{
           addPhoneHelpViewConstraint()
        }else{
            addHelpViewConstraint()
        }
    }
    
    func addPhoneHelpViewConstraint(){
        backButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.topImageView.snp.bottom).offset(-10);
            make.right.equalTo(self.snp.right).offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
            
        }

        helpScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom);
        }

        helpLabel.snp.makeConstraints { (make) in
            let height = self.getTextRectSize(self.helpLabel.text! as NSString, font: self.FONT20(), size: CGSize(width: SCREENWIDTH-60, height: CGFloat.greatestFiniteMagnitude)).height;
            make.top.equalTo(self.helpScrollView.snp.top);
            make.left.equalTo(self.snp.left).offset(10);
            make.right.equalTo(self.snp.right).offset(-10);
            make.bottom.equalTo(self.helpScrollView.snp.bottom);
            make.height.equalTo(height);
        }
    }
    
    func addHelpViewConstraint(){
        backButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.topImageView.snp.bottom).offset(-20);
            make.right.equalTo(self.snp.right).offset(-30);
            make.width.equalTo(50);
            make.height.equalTo(50);
            
        }
        
        helpScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom);
        }
        
        helpLabel.snp.makeConstraints { (make) in
            let height = self.getTextRectSize(self.helpLabel.text! as NSString, font: UIFont.systemFont(ofSize: 20), size: CGSize(width: SCREENWIDTH-60, height: CGFloat.greatestFiniteMagnitude)).height;
            make.top.equalTo(self.helpScrollView.snp.top);
            make.left.equalTo(self.snp.left).offset(20);
            make.right.equalTo(self.snp.right).offset(-20);
            make.bottom.equalTo(self.helpScrollView.snp.bottom);
            make.height.equalTo(height);
        }
    }

    /**
    计算字符串的高度、宽度
    
    - parameter text: NSString
    - parameter font: UIFont
    - parameter size: CGRect
    
    - returns: CGRect
    */
    
    func getTextRectSize(_ text:NSString,font:UIFont,size:CGSize) -> CGRect {
        
        let attributes = [NSFontAttributeName: font]
        
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        
        return rect;
        
    }
       required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
