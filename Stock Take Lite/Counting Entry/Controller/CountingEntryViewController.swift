//
//  CountingEntryViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEntryViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource ,UITextFieldDelegate,UIAlertViewDelegate{
    
    var         countingEntryView:                      CountingEntryView!;
    var         tempCell:                               CountingEntryTableViewCell?;
    var         dbManager:                              DataBase!;
    var         fileNameArray:                          NSMutableArray!;
    var         dataArray:                              NSMutableArray!;
    var         fileName:                               NSString!;
    var         numOfSKU:                               NSInteger!;
    var         totalOnhandQty:                         Float! = 0.0;
    var         totalCountQty:                          Float! = 0.0;
    var         totalViranceRty:                        Float! = 0.0;
    var         lastcell:                               CountingEntryTableViewCell!;
    var         didcell:                                CountingEntryTableViewCell!;
    var         countEntryArray:                        NSMutableArray!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        previousRow = 2;
        dbManager = DataBase();
        fileNameArray = NSMutableArray();
        dataArray = NSMutableArray();
        countEntryArray = NSMutableArray();
        self.view.backgroundColor = UIColor.whiteColor();
        self.loadMyView();
        //self.countingEntryView.tableView.reloadData();
    }
    
    func loadMyView(){
        countingEntryView = CountingEntryView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(countingEntryView);
        countingEntryView.tableView.delegate = self;
        countingEntryView.tableView.dataSource = self;
        self.addButtonActions();
        self.updateLabelTextAndLoadData();
        self.updateTotalLabelText();
    }
    
    func addButtonActions(){
        
        self.countingEntryView.saveButton.addTarget(self, action: #selector(CountingEntryViewController.saveButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.countingEntryView.returnButton.addTarget(self, action: #selector(CountingEntryViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.countingEntryView.logoutButton.addTarget(self, action: #selector(CountingEntryViewController.logoutAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    /**
    保存的时候，计算出各个数字的数值，并且保存在数据库中
    */
    
    func saveButtonAction(){
        self.view.endEditing(true);
        MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        self.updateCountDataBaseAndLabel();
        self.updateVrianceDataBaseAndLabel();
        let num = self.totalOnhandQty - self.totalCountQty;
        self.countingEntryView.varianceTotalLabel.text = String(format: "%0.0f", arguments: [Float(num)]);
        MBProgressHUD.hideHUDForView(self.view, animated: true);
    }
    
    
    func getCurrentTime()->NSString{
        let date:NSDate = NSDate();
        let dateFormate:NSDateFormatter = NSDateFormatter();
        dateFormate.dateStyle = NSDateFormatterStyle.NoStyle;
        dateFormate.timeStyle = NSDateFormatterStyle.NoStyle;
        dateFormate.locale = NSLocale.currentLocale();
        dateFormate.dateFormat = "dd-MMM-yyyy HH:mm";
        let   timeString = dateFormate.stringFromDate(date);
        return timeString;
    }

    
    func updateVrianceDataBaseAndLabel(){
        
        for i in 0 ... self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            let variance = Float((fileModel.onhandQty?.floatValue)!) - Float((fileModel.countQty?.floatValue)!);
                fileModel.varianceQty = String(format: "%0.0f", arguments: [variance]);
            fileModel.fileDate = self.getCurrentTime();
            dbManager.updateFileContentWithModel(fileModel);
        }
        self.performSelectorOnMainThread(#selector(CountingEntryViewController.reloadTableView), withObject: nil, waitUntilDone: true);
    }
    
    func reloadTableView(){
        self.countingEntryView.tableView.reloadData();
    }
    
    func updateCountDataBaseAndLabel(){
        for i in 0 ... self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            let Str:NSString = countEntryArray[i] as! NSString;
            fileModel.countQty = Str;
            fileModel.fileDate = self.getCurrentTime();
        }
        self.calculateCountQty();
        dbManager.updateCountQty(self.dataArray);
    }
    
    func calculateCountQty(){
        self.totalCountQty = 0.0;
        for i in 0 ... self.dataArray.count{
            let Str:NSString = countEntryArray[i] as! NSString;
            self.totalCountQty = Float(self.totalCountQty) + Float(Str.floatValue);
        }
         self.countingEntryView.countTotalLabel.text = String(format: "%0.0f", arguments: [self.totalCountQty]);
    }
    
    func returnButtonAction(){
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current();
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    func updateLabelTextAndLoadData(){
        
        /**
        *  如果用户是第一次使用这个APP并且直接进入这个模块
           应该提示让用户首先导入一个文件
        */
        
        if self.fileName == nil{
            let defaults:NSUserDefaults = NSUserDefaults();
            let defaultsfileName = defaults.objectForKey("DefaultsFileName");
            if defaultsfileName == nil {
                self.createAlertView(localString("warning"), message: localString("aeAlert"));
                return
            }
            self.fileName = defaultsfileName as! String;
            self.countingEntryView.fileNameTextLabel.text = self.fileName as String;
            dataArray = dbManager.contentWithFileName(self.fileName);
            self.initCountEntryArray();
            self.countingEntryView.skuNumberTextLabel.text = "\(self.dataArray.count)";
        }else{
            self.countingEntryView.fileNameTextLabel.text = self.fileName as String;
            self.countingEntryView.skuNumberTextLabel.text = "\(self.numOfSKU)";
            dataArray = dbManager.contentWithFileName(self.fileName);
            self.initCountEntryArray();
        }
        
    }
    
    func initCountEntryArray(){
        self.countEntryArray.removeAllObjects();
        for i in 0 ... self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            let Str:NSString = fileModel.countQty!;
            self.countEntryArray.addObject(Str);
        }
        self.calculateCountQty();
    }
   
    /**
    计算底部总数量
    */

    func updateTotalLabelText(){
        
        for i in 0 ... self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            totalOnhandQty = Float(totalOnhandQty ) + Float((fileModel.onhandQty?.floatValue)!)
        }
        self.countingEntryView.onhandTotalLabel.text = String(format: "%0.0f", arguments: [totalOnhandQty]);
        let num = self.totalOnhandQty - self.totalCountQty;
        self.countingEntryView.varianceTotalLabel.text = String(format: "%0.0f", arguments: [Float(num)]);
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :CountingEntryTableViewCell?;
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? CountingEntryTableViewCell;
        if cell == nil {
            cell = CountingEntryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
            cell?.countQtyTextField.delegate = self;
        }
        let fileModel:FileDataModel = dataArray[indexPath.row] as! FileDataModel;
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyTextField.text = self.countEntryArray[indexPath.row] as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      
        if DEVICE == .Phone{
            return 50 / 1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell:  CountingEntryTableViewCell!;
        cell = tableView.cellForRowAtIndexPath(indexPath) as? CountingEntryTableViewCell;
        didcell = cell;
        if lastcell != nil{
            if cell == lastcell {
                cell.selected = true;
            }else{
                lastcell.selected = false;
            }
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        //self.view.endEditing(true);
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if DEVICE == .Phone{
            self.hiddenAnimation()

        }
        lastcell = textField.superview?.superview as? CountingEntryTableViewCell;
        print("\(self.countingEntryView.tableView.indexPathForCell(lastcell)?.row)----------")
        print("\(lastcell.countQtyTextField.text)000");
        
        let  myIndex :NSIndexPath! = self.countingEntryView.tableView.indexPathForCell(lastcell);
        
        self.countEntryArray[myIndex.row] = lastcell.countQtyTextField.text!;
        print("text=====\(textField.text!)");
        lastcell.selected = false;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if DEVICE == .Phone{
            self.showAnimation()
        }
        lastcell = textField.superview?.superview as? CountingEntryTableViewCell;
        print("\(self.countingEntryView.tableView.indexPathForCell(lastcell)?.row)----------")
        print("\(lastcell.countQtyTextField.text)000");
        print("text=====\(textField.text!)");
        if didcell != nil{
            didcell.selected = false;
        }
        lastcell.selected = true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if DEVICE == .Phone{
            self.hiddenAnimation()
            textField.resignFirstResponder()
        }
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
