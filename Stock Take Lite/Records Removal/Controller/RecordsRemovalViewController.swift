//
//  RecordsRemovalViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class RecordsRemovalViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverControllerDelegate {
    
    var            recordsRemoveView:                RecordsRemoveView!;
    var            datePickerViewController:         DatePickerViewController!;
    var            popViewController:                UIPopoverController!;
    var            dbManager:                        DataBase!;
    //日期
    var            datesArray:                       NSMutableArray!;
    //fileDataModel
    var            dataArray:                        NSMutableArray!;
    //选择的日期
    var            selecteDateString:                NSString!;
    //显示在页面的数据enquiryModel
    var            enquryDataArray:                  NSMutableArray!;
    //是否选择日期
    var            isDateSelected:                   Bool = false;
    var            fileManager:                      NSFileManager!;
    var            datePicker:                       DatePickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dbManager = DataBase();
        previousRow = 5;
        fileManager = NSFileManager.defaultManager();
        datesArray = NSMutableArray();
        dataArray = NSMutableArray();
        enquryDataArray = NSMutableArray();
        self.view.backgroundColor = UIColor.whiteColor();
        recordsRemoveView = RecordsRemoveView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(recordsRemoveView);
        self.recordsRemoveView.tableView.delegate = self;
        self.recordsRemoveView.tableView.dataSource = self;
        self.addButtonActions();
        self.datesFromDataBase();
    }
    
    /**
     读取数据库中的所有日期
     */
    
    func datesFromDataBase(){
        self.datesArray = dbManager.allFileDates();
    }
    
    func dataBeforeTheSelectedDate(){
        
        if self.selecteDateString != nil{
            
            let dataFromate:NSDateFormatter = NSDateFormatter();
            dataFromate.dateStyle = NSDateFormatterStyle.NoStyle;
            dataFromate.timeStyle = NSDateFormatterStyle.NoStyle;
            dataFromate.locale = NSLocale.currentLocale();
            let zone:NSTimeZone = NSTimeZone(name: "UTC")!;
            dataFromate.timeZone = zone;
            dataFromate.dateFormat = "dd-MMM-yyyy";
            let seletedDate:NSDate = dataFromate.dateFromString(self.selecteDateString as String)!;
            dataFromate.dateFormat = "dd-MMM-yyyy HH:mm";
            var     dataBaseDate:NSDate;
            self.dataArray.removeAllObjects()
            for i in 0..<self.dataArray.count{
                print(self.datesArray)
                dataBaseDate = dataFromate.dateFromString(self.datesArray[i] as! String)!;
                if dataBaseDate.compare(seletedDate) == NSComparisonResult.OrderedAscending{
                    let tempArray = dbManager.recodesWithDate(self.datesArray[i] as! NSString);
                    self.dataArray.addObject(tempArray);
                    
                }
            }
            
            self.parseEnquiryModel();
            self.recordsRemoveView.tableView.reloadData();
        }else{
            /**
             若需要选择，则需要处理没有选择的情况
             */
        }
    }
    
    /**
     解析出EnquiryModel的数据，存入EnquiryModelArray
     */
    
    func parseEnquiryModel(){
        enquryDataArray.removeAllObjects();
        for i in 0..<self.dataArray.count{
            var tempOnhandQty = 0;
            var tempCountedQty = 0;
            let enquiryModel = EnquiryModel();
            enquiryModel.skuNum = "\(self.dataArray[i].count)";
            for j in 0..<self.dataArray[i].count{
                let array:NSArray = self.dataArray[i] as! NSArray
                let fileDataModel = array[j] as! FileDataModel;
                enquiryModel.date = fileDataModel.fileDate;
                
                tempOnhandQty = tempOnhandQty + (fileDataModel.onhandQty?.integerValue)!;
                tempCountedQty = tempCountedQty + (fileDataModel.countQty?.integerValue)!
            }
            enquiryModel.onhandQty = "\(tempOnhandQty)";
            enquiryModel.countedQty = "\(tempCountedQty)";
            self.enquryDataArray.addObject(enquiryModel);
        }
        
    }
    
    /**
     删除数据库的数据
     */
    //MARK: - 这里
    func removeAllData(){
        let tempnameArray:NSMutableArray = NSMutableArray();
        let tempdateArray:NSMutableArray = NSMutableArray();
        for i in 0..<self.dataArray.count{
            for j in 0..<self.dataArray[i].count{
                let array:NSArray = self.dataArray[i] as! NSArray
                let fileDataModel:FileDataModel = array[j] as! FileDataModel;
                if !tempdateArray.containsObject(fileDataModel.fileDate!){
                    tempdateArray.addObject(fileDataModel.fileDate!);
                }
                if !tempnameArray.containsObject(fileDataModel.fileName!){
                    tempnameArray.addObject(fileDataModel.fileName!);
                }
            }
        }
        
        for i in 0..<tempdateArray.count{
            print("\(tempdateArray[i])");
            dbManager.deleteRecodeWithDate(tempdateArray[i] as! NSString);
        }
        for i in 0..<tempnameArray.count{
            self.removeFileFromFTPServer(tempnameArray[i] as! NSString);
        }
    }
    
    /**
     删除从服务器中下载的文件
     */
    
    func removeFileFromFTPServer(name:NSString){
        
        let filePath = CSVFILEPATH.stringByAppendingString("/\(name)");
        do{
            try  self.fileManager.removeItemAtPath(filePath as String);
        }catch{
            
        }
    }
    
    func updateRemoveStatusLabel(){
        var recodes = 0;
        for i in 0..<self.dataArray.count{
            recodes = recodes + self.dataArray[i].count;
        }
        self.recordsRemoveView.removeStateLabel.text = "\(recodes)" + localString("arPrompt");
    }
    
    /**
     为每一个按钮添加处理事件
     */
    
    func addButtonActions(){
        
        self.recordsRemoveView.chooseRemoveDateButton.addTarget(self, action: #selector(RecordsRemovalViewController.chooseDateAction(_:)), forControlEvents: UIControlEvents.TouchUpInside);
        self.recordsRemoveView.okButton.addTarget(self, action: #selector(RecordsRemovalViewController.okButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.recordsRemoveView.returnButton.addTarget(self, action: #selector(RecordsRemovalViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func okButtonAction(){
        self.removeAllData();
        self.updateRemoveStatusLabel();
    }
    
    func returnButtonAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    func chooseDateAction(btn:UIButton!){
        if DEVICE == .Phone{
            if datePicker == nil {
                datePicker = DatePickerView()
            }
            
            unowned let weakself = self;
            datePicker.saveBlock = {
                (value:NSString)->Void in
                btn.setTitle("\(value)", forState: UIControlState.Normal);
                if value != "" {
                    weakself.isDateSelected = true;
                }
                weakself.selecteDateString = value;
                weakself.dataBeforeTheSelectedDate();
            }
            self.view.addSubview(datePicker)
            self.view.bringSubviewToFront(datePicker)
            datePicker.mas_makeConstraints({ (make) in
                make.bottom.equalTo(self.recordsRemoveView.mas_bottom)
                make.left.equalTo(self.view.mas_left)
                make.width.equalTo(SCREENWIDTH)
                make.height.equalTo(SCREENWIDTH/2)
            })
        }else{
            datePickerViewController = DatePickerViewController();
            
            unowned let weakself = self;
            datePickerViewController.saveBlock = {
                (value:NSString)->Void in
                btn.setTitle("\(value)", forState: UIControlState.Normal);
                if value != "" {
                    weakself.isDateSelected = true;
                }
                weakself.selecteDateString = value;
                weakself.dataBeforeTheSelectedDate();
            }
            popViewController = UIPopoverController(contentViewController: datePickerViewController);
            popViewController.popoverContentSize = CGSizeMake(260,210);
            popViewController.delegate = self;
            //popViewController.backgroundColor = UIColor.greenColor();
            popViewController.presentPopoverFromRect(CGRectMake(50, 130, 260, 210), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Left, animated: true);
        }
        
    }
    //MARK: - TableView的代理
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :CountingEnquiryTableViewCell?;
        
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? CountingEnquiryTableViewCell;
        
        if cell == nil {
            cell = CountingEnquiryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        
        let enquiryModel:EnquiryModel = self.enquryDataArray[indexPath.row] as! EnquiryModel;
        cell?.dataAndTimeLabel.text = enquiryModel.date as? String;
        cell?.numberOfSKULabel.text = enquiryModel.skuNum as? String;
        cell?.onhandQtyLabel.text = enquiryModel.onhandQty as? String;
        cell?.countedQtyLabel.text = enquiryModel.countedQty as? String;
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDateSelected {
            return self.enquryDataArray.count;
        }
        return 0;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if DEVICE == .Phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        if datePicker != nil {
            datePicker.removeFromSuperview()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
