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
      super.init(frame: CGRectZero)
        datePicView = UIDatePicker();
        datePicView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENWIDTH/2);
        datePicView.backgroundColor = UIColor.groupTableViewBackgroundColor();
        datePicView.datePickerMode = UIDatePickerMode.Date;
        datePicView.addTarget(self, action: #selector(DatePickerView.datePicViewAction(_:)), forControlEvents: UIControlEvents.ValueChanged);
        self.addSubview(datePicView);
    }
    func datePicViewAction(dataPic:UIDatePicker){
        
        if saveBlock != nil {
            let dataFromate:NSDateFormatter = NSDateFormatter();
            dataFromate.dateStyle = NSDateFormatterStyle.NoStyle;
            dataFromate.timeStyle = NSDateFormatterStyle.NoStyle;
            dataFromate.locale = NSLocale.currentLocale();
            
            let zone:NSTimeZone = NSTimeZone(name: "UTC")!;
            dataFromate.timeZone = zone;
            dataFromate.dateFormat = "dd-MMM-yyyy";
            let dataString:NSString = dataFromate.stringFromDate(dataPic.date);
            saveBlock!(dataString);
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
