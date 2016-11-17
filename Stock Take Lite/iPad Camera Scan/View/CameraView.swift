//
//  CameraView.swift
//  Stock Take Lite
//
//  Created by infoware on 17/12/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CameraView: CountingEntryView {
    var     cameraButton:           UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("icTitle");
        
        cameraButton = UIButton(type: UIButtonType.system);
        cameraButton.setTitle(localString("camera"), for: UIControlState());
        cameraButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        cameraButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        cameraButton.titleLabel?.font = FONT25();
        self.addSubview(cameraButton);
        if DEVICE == .phone{
          addPhoneCameraViewConstraint()
        }else{
           addCameraViewConstraint()
        }
    }
    
    func addPhoneCameraViewConstraint(){
        
        
        saveButton.snp.updateConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10 * 3 + 5);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        returnButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.saveButton.snp.top);
            make.left.equalTo(self.saveButton.snp.right).offset(5);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.saveButton.snp.height);
            
            
        }
        
        cameraButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(15);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
            //            make.top.equalTo(self.saveButton.snp.top).offset(0);
            //            make.left.equalTo(self.saveButton.snp.right).offset(15);
            //            make.width.equalTo(130);
            //            make.height.equalTo(37);
        }


    }
    

    
    func addCameraViewConstraint(){
        saveButton.snp.updateConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(241);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.saveButton.snp.top);
            make.left.equalTo(self.saveButton.snp.right).offset(15);
            make.width.equalTo(130);
            make.height.equalTo(self.saveButton.snp.height);
            
            
        }

        cameraButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.snp.bottom).offset(35);
            make.left.equalTo(self.snp.left).offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
            //            make.top.equalTo(self.saveButton.snp.top).offset(0);
            //            make.left.equalTo(self.saveButton.snp.right).offset(15);
            //            make.width.equalTo(130);
            //            make.height.equalTo(37);
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
