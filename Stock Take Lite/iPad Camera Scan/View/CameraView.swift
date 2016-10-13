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
        
        cameraButton = UIButton(type: UIButtonType.System);
        cameraButton.setTitle(localString("camera"), forState: UIControlState.Normal);
        cameraButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        cameraButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        cameraButton.titleLabel?.font = FONT25();
        self.addSubview(cameraButton);
        if DEVICE == .Phone{
          addPhoneCameraViewConstraint()
        }else{
           addCameraViewConstraint()
        }
    }
    
    func addPhoneCameraViewConstraint(){
        
        
        saveButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10 * 3 + 5);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        returnButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.saveButton.mas_top);
            make.left.equalTo(self.saveButton.mas_right).with.offset(5);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(self.saveButton.mas_height);
            
            
        }
        
        cameraButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
            //            make.top.equalTo(self.saveButton.mas_top).with.offset(0);
            //            make.left.equalTo(self.saveButton.mas_right).with.offset(15);
            //            make.width.equalTo(130);
            //            make.height.equalTo(37);
        }


    }
    

    
    func addCameraViewConstraint(){
        saveButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(241);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
        }
        
        returnButton.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.saveButton.mas_top);
            make.left.equalTo(self.saveButton.mas_right).with.offset(15);
            make.width.equalTo(130);
            make.height.equalTo(self.saveButton.mas_height);
            
            
        }

        cameraButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.totalLabelBottomLineLabel.mas_bottom).with.offset(35);
            make.left.equalTo(self.mas_left).with.offset(111);
            make.width.equalTo(118);
            make.height.equalTo(37);
            
            //            make.top.equalTo(self.saveButton.mas_top).with.offset(0);
            //            make.left.equalTo(self.saveButton.mas_right).with.offset(15);
            //            make.width.equalTo(130);
            //            make.height.equalTo(37);
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
