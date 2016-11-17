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
        if DEVICE == .phone{
            topTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: 0.25);
            secondeTopLabel.font = UIFont.systemFont(ofSize: 15, weight: 0.15);

            addPhoneBaseImportConstraint()
        }else{
            topTitleLabel.font = UIFont.systemFont(ofSize: 40, weight: 0.5);
            secondeTopLabel.font = UIFont.systemFont(ofSize: 30, weight: 0.3);

            addBaseImportConstraint()
        }
    }
    
    func addPhoneBaseImportConstraint(){
        topImageView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(64);
            
        }
        
        topTitleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.topImageView.snp.top).offset(0);
            make.left.equalTo(self.topImageView.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.topImageView.snp.right);
            make.height.equalTo(self.topImageView.snp.height);
            
        }
        
        secondeTopLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.topTitleLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }
        
        bottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.secondeTopLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }

    }
    
    func addBaseImportConstraint(){
        topImageView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(109);
            
        }
        
        topTitleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.topImageView.snp.top).offset(0);
            make.left.equalTo(self.topImageView.snp.left).offset(111);
            make.right.equalTo(self.topImageView.snp.right);
            make.height.equalTo(self.topImageView.snp.height);
            
        }
        
        secondeTopLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.topTitleLabel.snp.bottom);
            make.left.equalTo(self.snp.left).offset(111);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(62.5);
            
        }
        
        bottomLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.secondeTopLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
            
        }
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
