//
//  DatePickerView.swift
//  Stock Take Lite
//
//  Created by infoware on 29/4/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit

class DatePickerView: UIView {
    var         saveBlock:                          postValueBlock?;
    var         datePicView:                        UIDatePicker!;
    
    init(){
      super.init(frame: CGRect.zero)
        datePicView = UIDatePicker();
        datePicView.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENWIDTH/2);
        datePicView.backgroundColor = UIColor.groupTableViewBackground;
        datePicView.datePickerMode = UIDatePickerMode.date;
        datePicView.addTarget(self, action: #selector(DatePickerView.datePicViewAction(_:)), for: UIControlEvents.valueChanged);
        self.addSubview(datePicView);
    }
    func datePicViewAction(_ dataPic:UIDatePicker){
        
        if saveBlock != nil {
            let dataFromate:DateFormatter = DateFormatter();
            dataFromate.dateStyle = DateFormatter.Style.none;
            dataFromate.timeStyle = DateFormatter.Style.none;
            dataFromate.locale = Locale.current;
            
            let zone:TimeZone = TimeZone(identifier: "UTC")!;
            dataFromate.timeZone = zone;
            dataFromate.dateFormat = "dd-MMM-yyyy";
            let dataString:NSString = dataFromate.string(from: dataPic.date) as NSString;
            saveBlock!(dataString);
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
