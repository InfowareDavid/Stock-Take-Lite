//
//  QuantityImportBaseView.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityImportBaseView: BaseView {
    var     topImageView:               UIImageView!;
    var     topTitleLabel:              UILabel!;
    var     bottomLineLabel:            UILabel!;
    var     secondeTopLabel:            UILabel!;
    var     topImage:                   UIImage!;
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        topImage = UIImage(named: "bar");
        topImageView = UIImageView(image: topImage);
        self.addSubview(topImageView);
        
        topTitleLabel = UILabel();
        #if LITE_VERSION
            topTitleLabel.text = localString("topTitle");
        #elseif PRO_VERSION
            topTitleLabel.text = localString("topTitle_pro");
        #elseif ENTERPRISE_VERSION
            topTitleLabel.text = localString("topTitle_ent");
        #endif
        topTitleLabel.textColor = self.colorWithString("#FFFFFF");
        //topTitleLabel.font = UIFont.systemFontOfSize(40, weight: 0.5);
        self.topImageView.addSubview(topTitleLabel);
        
        secondeTopLabel = UILabel();
        secondeTopLabel.text = localString("title");
        secondeTopLabel.textColor = self.colorWithString("#7B7C7F");
        //secondeTopLabel.font = UIFont.systemFontOfSize(30, weight: 0.3);
        self.addSubview(secondeTopLabel);
        
        bottomLineLabel = UILabel();
        bottomLineLabel.backgroundColor = self.colorWithString("#58595B");
        self.addSubview(bottomLineLabel);
        if DEVICE == .Phone{
            topTitleLabel.font = UIFont.systemFontOfSize(20, weight: 0.25);
            secondeTopLabel.font = UIFont.systemFontOfSize(15, weight: 0.15);

            addPhoneBaseImportConstraint()
        }else{
            topTitleLabel.font = UIFont.systemFontOfSize(40, weight: 0.5);
            secondeTopLabel.font = UIFont.systemFontOfSize(30, weight: 0.3);

            addBaseImportConstraint()
        }
    }
    
    func addPhoneBaseImportConstraint(){
        topImageView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(64);
            
        }
        
        topTitleLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.topImageView.mas_top).with.offset(0);
            make.left.equalTo(self.topImageView.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.topImageView.mas_right);
            make.height.equalTo(self.topImageView.mas_height);
            
        }
        
        secondeTopLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.topTitleLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        
        bottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.secondeTopLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }

    }
    
    func addBaseImportConstraint(){
        topImageView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(109);
            
        }
        
        topTitleLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.topImageView.mas_top).with.offset(0);
            make.left.equalTo(self.topImageView.mas_left).with.offset(111);
            make.right.equalTo(self.topImageView.mas_right);
            make.height.equalTo(self.topImageView.mas_height);
            
        }
        
        secondeTopLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.topTitleLabel.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(62.5);
            
        }
        
        bottomLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.secondeTopLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
            
        }
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
