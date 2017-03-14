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
        datePicView.frame = CGRect(x: 0, y: 0, width: 260, height: 216);
        datePicView.backgroundColor = UIColor.groupTableViewBackground;
        datePicView.datePickerMode = UIDatePickerMode.date;
        datePicView.addTarget(self, action: #selector(DatePickerViewController.datePicViewAction(_:)), for: UIControlEvents.valueChanged);
        self.view.addSubview(datePicView);
        
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
            //MARK: - CHANGE 3
            saveBlock!(dataString);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
