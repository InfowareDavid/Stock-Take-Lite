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
        
        self.topImageView.userInteractionEnabled = true;
        backButton = UIButton(type: UIButtonType.System);
        backButton.setTitle(localString("back"), forState: UIControlState.Normal);
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        backButton.titleLabel?.font = FONT20()
        self.topImageView.addSubview(backButton);
        
        helpScrollView = UIScrollView();
        helpScrollView.bounces = true;
        self.addSubview(helpScrollView);
        
        helpLabel = UILabel();
        helpLabel.numberOfLines = 0;
        helpLabel.text = localString("help");
        
        helpLabel.textColor = UIColor.blackColor();
        helpLabel.font = FONT20()
        helpScrollView.addSubview(helpLabel);
        if DEVICE == .Phone{
           addPhoneHelpViewConstraint()
        }else{
            addHelpViewConstraint()
        }
    }
    
    func addPhoneHelpViewConstraint(){
        backButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.bottom.equalTo(self.topImageView.mas_bottom).with.offset(-10);
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
            
        }

        helpScrollView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.bottom.equalTo(self.mas_bottom);
        }

        helpLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            let height = self.getTextRectSize(self.helpLabel.text!, font: self.FONT20(), size: CGSizeMake(SCREENWIDTH-60, CGFloat.max)).height;
            make.top.equalTo(self.helpScrollView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.bottom.equalTo(self.helpScrollView.mas_bottom);
            make.height.equalTo(height);
        }
    }
    
    func addHelpViewConstraint(){
        backButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.bottom.equalTo(self.topImageView.mas_bottom).with.offset(-20);
            make.right.equalTo(self.mas_right).with.offset(-30);
            make.width.equalTo(50);
            make.height.equalTo(50);
            
        }
        
        helpScrollView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.bottom.equalTo(self.mas_bottom);
        }
        
        helpLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            let height = self.getTextRectSize(self.helpLabel.text!, font: UIFont.systemFontOfSize(20), size: CGSizeMake(SCREENWIDTH-60, CGFloat.max)).height;
            make.top.equalTo(self.helpScrollView.mas_top);
            make.left.equalTo(self.mas_left).with.offset(20);
            make.right.equalTo(self.mas_right).with.offset(-20);
            make.bottom.equalTo(self.helpScrollView.mas_bottom);
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
    
    func getTextRectSize(text:NSString,font:UIFont,size:CGSize) -> CGRect {
        
        let attributes = [NSFontAttributeName: font]
        
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        let rect:CGRect = text.boundingRectWithSize(size, options: option, attributes: attributes, context: nil)
        
        return rect;
        
    }
       required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
