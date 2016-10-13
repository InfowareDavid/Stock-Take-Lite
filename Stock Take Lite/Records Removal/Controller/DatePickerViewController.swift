//
//  DatePickerViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 20/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit
//NMARK: - CHANGE 2
typealias postValueBlock = (NSString)->Void;


class DatePickerViewController: UIViewController {
    
    var         saveBlock:                          postValueBlock?;
    var         datePicView:                        UIDatePicker!;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        datePicView = UIDatePicker();
        datePicView.frame = CGRectMake(0, 0, 260, 216);
        datePicView.backgroundColor = UIColor.groupTableViewBackgroundColor();
        datePicView.datePickerMode = UIDatePickerMode.Date;
        datePicView.addTarget(self, action: #selector(DatePickerViewController.datePicViewAction(_:)), forControlEvents: UIControlEvents.ValueChanged);
        self.view.addSubview(datePicView);
        
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
            //MARK: - CHANGE 3
            saveBlock!(dataString);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
