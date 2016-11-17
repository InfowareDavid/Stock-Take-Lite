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
    var            fileManager:                      FileManager!;
    var            datePicker:                       DatePickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dbManager = DataBase();
        previousRow = 5;
        fileManager = FileManager.default;
        datesArray = NSMutableArray();
        dataArray = NSMutableArray();
        enquryDataArray = NSMutableArray();
        self.view.backgroundColor = UIColor.white;
        recordsRemoveView = RecordsRemoveView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
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
            
            let dataFromate:DateFormatter = DateFormatter();
            dataFromate.dateStyle = DateFormatter.Style.none;
            dataFromate.timeStyle = DateFormatter.Style.none;
            dataFromate.locale = Locale.current;
            let zone:TimeZone = TimeZone(identifier: "UTC")!;
            dataFromate.timeZone = zone;
            dataFromate.dateFormat = "dd-MMM-yyyy";
            let seletedDate:Date = dataFromate.date(from: self.selecteDateString as String)!;
            dataFromate.dateFormat = "dd-MMM-yyyy HH:mm";
            var     dataBaseDate:Date;
            self.dataArray.removeAllObjects()
            for i in 0..<self.dataArray.count{
                print(self.datesArray)
                dataBaseDate = dataFromate.date(from: self.datesArray[i] as! String)!;
                if dataBaseDate.compare(seletedDate) == ComparisonResult.orderedAscending{
                    let tempArray = dbManager.recodesWithDate(self.datesArray[i] as! NSString);
                    self.dataArray.add(tempArray);
                    
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
            let string = "\((self.dataArray[i] as AnyObject).count)"
            enquiryModel.skuNum = string as NSString?
            for j in 0..<(self.dataArray[i] as AnyObject).count{
                let array:NSArray = self.dataArray[i] as! NSArray
                let fileDataModel = array[j] as! FileDataModel;
                enquiryModel.date = fileDataModel.fileDate;
                
                tempOnhandQty = tempOnhandQty + (fileDataModel.onhandQty?.integerValue)!;
                tempCountedQty = tempCountedQty + (fileDataModel.countQty?.integerValue)!
            }
            enquiryModel.onhandQty = "\(tempOnhandQty)" as NSString?;
            enquiryModel.countedQty = "\(tempCountedQty)" as NSString?;
            self.enquryDataArray.add(enquiryModel);
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
            for j in 0..<(self.dataArray[i] as AnyObject).count{
                let array:NSArray = self.dataArray[i] as! NSArray
                let fileDataModel:FileDataModel = array[j] as! FileDataModel;
                if !tempdateArray.contains(fileDataModel.fileDate!){
                    tempdateArray.add(fileDataModel.fileDate!);
                }
                if !tempnameArray.contains(fileDataModel.fileName!){
                    tempnameArray.add(fileDataModel.fileName!);
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
    
    func removeFileFromFTPServer(_ name:NSString){
        
        let filePath = CSVFILEPATH + "/\(name)";
        do{
            try  self.fileManager.removeItem(atPath: filePath as String);
        }catch{
            
        }
    }
    
    func updateRemoveStatusLabel(){
        var recodes = 0;
        for i in 0..<self.dataArray.count{
            recodes = recodes + (self.dataArray[i] as AnyObject).count;
        }
        self.recordsRemoveView.removeStateLabel.text = "\(recodes)" + localString("arPrompt");
    }
    
    /**
     为每一个按钮添加处理事件
     */
    
    func addButtonActions(){
        
        self.recordsRemoveView.chooseRemoveDateButton.addTarget(self, action: #selector(RecordsRemovalViewController.chooseDateAction(_:)), for: UIControlEvents.touchUpInside);
        self.recordsRemoveView.okButton.addTarget(self, action: #selector(RecordsRemovalViewController.okButtonAction), for: UIControlEvents.touchUpInside);
        self.recordsRemoveView.returnButton.addTarget(self, action: #selector(RecordsRemovalViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
    }
    
    func okButtonAction(){
        self.removeAllData();
        self.updateRemoveStatusLabel();
    }
    
    func returnButtonAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    func chooseDateAction(_ btn:UIButton!){
        if DEVICE == .phone{
            if datePicker == nil {
                datePicker = DatePickerView()
            }
            
            unowned let weakself = self;
            datePicker.saveBlock = {
                (value:NSString)->Void in
                btn.setTitle("\(value)", for: UIControlState());
                if value != "" {
                    weakself.isDateSelected = true;
                }
                weakself.selecteDateString = value;
                weakself.dataBeforeTheSelectedDate();
            }
            self.view.addSubview(datePicker)
            self.view.bringSubview(toFront: datePicker)
            datePicker.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.recordsRemoveView.snp.bottom)
                make.left.equalTo(self.view.snp.left)
                make.width.equalTo(SCREENWIDTH)
                make.height.equalTo(SCREENWIDTH/2)
            })
        }else{
            datePickerViewController = DatePickerViewController();
            
            unowned let weakself = self;
            datePickerViewController.saveBlock = {
                (value:NSString)->Void in
                btn.setTitle("\(value)", for: UIControlState());
                if value != "" {
                    weakself.isDateSelected = true;
                }
                weakself.selecteDateString = value;
                weakself.dataBeforeTheSelectedDate();
            }
            popViewController = UIPopoverController(contentViewController: datePickerViewController);
            popViewController.contentSize = CGSize(width: 260,height: 210);
            popViewController.delegate = self;
            //popViewController.backgroundColor = UIColor.greenColor();
            popViewController.present(from: CGRect(x: 50, y: 130, width: 260, height: 210), in: self.view, permittedArrowDirections: UIPopoverArrowDirection.left, animated: true);
        }
        
    }
    //MARK: - TableView的代理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :CountingEnquiryTableViewCell?;
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? CountingEnquiryTableViewCell;
        
        if cell == nil {
            cell = CountingEnquiryTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
        let enquiryModel:EnquiryModel = self.enquryDataArray[(indexPath as NSIndexPath).row] as! EnquiryModel;
        cell?.dataAndTimeLabel.text = enquiryModel.date as? String;
        cell?.numberOfSKULabel.text = enquiryModel.skuNum as? String;
        cell?.onhandQtyLabel.text = enquiryModel.onhandQty as? String;
        cell?.countedQtyLabel.text = enquiryModel.countedQty as? String;
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDateSelected {
            return self.enquryDataArray.count;
        }
        return 0;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if datePicker != nil {
            datePicker.removeFromSuperview()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
