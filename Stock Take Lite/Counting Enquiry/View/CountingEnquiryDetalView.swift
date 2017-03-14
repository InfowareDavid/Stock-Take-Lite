//
//  CountingEnquiryDetalView.swift
//  Stock Take Lite
//
//  Created by infoware on 16/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit
import SnapKit

class CountingEnquiryDetalView: CountingEntryView {

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("edTitle");
        self.fileNameLabel.text = localString("edDataAndTime");
        self.saveButton.removeFromSuperview();
        
        if DEVICE == .phone{
            addPhoneCountingEnquiryDetalConstraint()
        }else{
            addCountingEnquiryDetalConstraint()
        }
    }
    
    func addPhoneCountingEnquiryDetalConstraint(){
//        self.fileNameLabel.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
//            make.top.equalTo(self.middelView.mas_top).with.offset(10);
//            make.left.equalTo(self.middelView.mas_left).with.offset(SCREENWIDTH/10);
//            make.width.equalTo(SCREENWIDTH/7 * 2);
//            make.height.equalTo(25);
//        }
        
//        self.returnButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
//            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(15);
//            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
//            make.width.equalTo(SCREENWIDTH/5);
//            make.height.equalTo(25);
//            
//        }
        
        self.fileNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(10);
            make.left.equalTo(self.middelView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/7 * 2);
            make.height.equalTo(25);

        }
        
        self.returnButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
        }
       
    }

    func addCountingEnquiryDetalConstraint(){
//        self.fileNameLabel.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
//            make.top.equalTo(self.middelView.mas_top).with.offset(25);
//            make.left.equalTo(self.middelView.mas_left).with.offset(111);
//            make.width.equalTo(285);
//            make.height.equalTo(40);
//        }
        self.fileNameLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(25);
            make.left.equalTo(self.middelView.snp.left).offset(111);
            make.width.equalTo(150);//285
            make.height.equalTo(40);
        }

//        self.returnButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
//            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(35);
//            make.left.equalTo(self.mas_left).with.offset(111);
//            make.width.equalTo(118);
//            make.height.equalTo(37);
//            
//        }
        self.returnButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);

        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
