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
        self.view.backgroundColor = UIColor.white;
        self.loadMyView();
        //self.countingEntryView.tableView.reloadData();
    }
    
    func loadMyView(){
        countingEntryView = CountingEntryView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.view.addSubview(countingEntryView);
        countingEntryView.tableView.delegate = self;
        countingEntryView.tableView.dataSource = self;
        self.addButtonActions();
        self.updateLabelTextAndLoadData();
        self.updateTotalLabelText();
    }
    
    func addButtonActions(){
        
        self.countingEntryView.saveButton.addTarget(self, action: #selector(CountingEntryViewController.saveButtonAction), for: UIControlEvents.touchUpInside);
        self.countingEntryView.returnButton.addTarget(self, action: #selector(CountingEntryViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
        self.countingEntryView.logoutButton.addTarget(self, action: #selector(CountingEntryViewController.logoutAction), for: UIControlEvents.touchUpInside);
    }
    
    /**
    保存的时候，计算出各个数字的数值，并且保存在数据库中
    */
    
    func saveButtonAction(){
        self.view.endEditing(true);
        MBProgressHUD.showAdded(to: self.view, animated: true);
        self.updateCountDataBaseAndLabel();
        self.updateVrianceDataBaseAndLabel();
        let num = self.totalOnhandQty - self.totalCountQty;
        self.countingEntryView.varianceTotalLabel.text = String(format: "%0.0f", arguments: [Float(num)]);
        MBProgressHUD.hide(for: self.view, animated: true);
       // postData()
    }
    
    func postData(){
        
        var message = "<data>"
        for item in self.dataArray {
            let fileModel:FileDataModel = item  as! FileDataModel
            message += "<CountingEntryTable>"
            message += "<skuCode>\(fileModel.skuCode!)</skuCode>"
            message += "<skuName>\(fileModel.skuName!)</skuName>"
            message += "<onHandQty>\(fileModel.onhandQty!)</onHandQty>"
            message += "<countQty>\(fileModel.countQty!)</countQty>"
            message += "<varianceQty>\(fileModel.varianceQty!)</varianceQty>"
            message += "</CountingEntryTable>"
        }
        message += "</data>"
        
        networkManager.postRequest(Service.CountingEntry.rawValue, action: ServiceAction.CountEntryServiceAction.AddCount.rawValue, paramValues: message, success:{
            data in
            //            self.parse = NSXMLParser(data: data)
            //            self.parse!.delegate = self
            //            self.parse!.parse()
            
            let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            count+=1
            print("count------------>\(count)")
            print("\(string!)")
        })
    }

    
    
    func getCurrentTime()->NSString{
        let date:Date = Date();
        let dateFormate:DateFormatter = DateFormatter();
        dateFormate.dateStyle = DateFormatter.Style.none;
        dateFormate.timeStyle = DateFormatter.Style.none;
        dateFormate.locale = Locale.current;
        dateFormate.dateFormat = "dd-MMM-yyyy HH:mm";
        let   timeString = dateFormate.string(from: date);
        return timeString as NSString;
    }

    
    func updateVrianceDataBaseAndLabel(){
        
        for i in 0 ..< self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            let variance = Float((fileModel.onhandQty?.floatValue)!) - Float((fileModel.countQty?.floatValue)!);
                fileModel.varianceQty = String(format: "%0.0f", arguments: [variance]) as NSString?;
            fileModel.fileDate = self.getCurrentTime();
            dbManager.updateFileContentWithModel(fileModel);
        }
        self.performSelector(onMainThread: #selector(CountingEntryViewController.reloadTableView), with: nil, waitUntilDone: true);
    }
    
    func reloadTableView(){
        self.countingEntryView.tableView.reloadData();
    }
    
    func updateCountDataBaseAndLabel(){
        for i in 0 ..< self.dataArray.count{
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
        for i in 0 ..< self.dataArray.count{
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
        
        let currentUser:CurrentUser = CurrentUser.current;
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
            let defaults:UserDefaults = UserDefaults();
            let defaultsfileName = defaults.object(forKey: "DefaultsFileName");
            if defaultsfileName == nil {
                self.createAlertView(localString("warning"), message: localString("aeAlert"));
                return
            }
            self.fileName = defaultsfileName as! String as NSString!;
            self.countingEntryView.fileNameTextLabel.text = self.fileName as String;
            dataArray = dbManager.contentWithFileName(self.fileName);
            self.initCountEntryArray();
            self.countingEntryView.skuNumberTextLabel.text = "\(self.dataArray.count)";
        }else{
            self.countingEntryView.fileNameTextLabel.text = self.fileName as String;
            self.countingEntryView.skuNumberTextLabel.text = "\(self.numOfSKU!)";
            dataArray = dbManager.contentWithFileName(self.fileName);
            self.initCountEntryArray();
        }
        
    }
    
    func initCountEntryArray(){
        self.countEntryArray.removeAllObjects();
        for i in 0 ..< self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            let Str:NSString = fileModel.countQty!;
            self.countEntryArray.add(Str);
        }
        self.calculateCountQty();
    }
   
    /**
    计算底部总数量
    */

    func updateTotalLabelText(){
        
        for i in 0 ..< self.dataArray.count{
            let fileModel:FileDataModel = dataArray[i] as! FileDataModel;
            totalOnhandQty = Float(totalOnhandQty ) + Float((fileModel.onhandQty?.floatValue)!)
        }
        self.countingEntryView.onhandTotalLabel.text = String(format: "%0.0f", arguments: [totalOnhandQty]);
        let num = self.totalOnhandQty - self.totalCountQty;
        self.countingEntryView.varianceTotalLabel.text = String(format: "%0.0f", arguments: [Float(num)]);
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :CountingEntryTableViewCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? CountingEntryTableViewCell;
        if cell == nil {
            cell = CountingEntryTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
            cell?.countQtyTextField.delegate = self;
        }
        let fileModel:FileDataModel = dataArray[(indexPath as NSIndexPath).row] as! FileDataModel;
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyTextField.text = self.countEntryArray[(indexPath as NSIndexPath).row] as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as String?;
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if DEVICE == .phone{
            return 50 / 1024.0 * SCREENHEIGHT
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cell:  CountingEntryTableViewCell!;
        cell = tableView.cellForRow(at: indexPath) as? CountingEntryTableViewCell;
        didcell = cell;
        if lastcell != nil{
            if cell == lastcell {
                cell.isSelected = true;
            }else{
                lastcell.isSelected = false;
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //self.view.endEditing(true);
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if DEVICE == .phone{
            self.hiddenAnimation()

        }
        lastcell = textField.superview?.superview as? CountingEntryTableViewCell;
        //print("\((self.countingEntryView.tableView.indexPath(for: lastcell) as IndexPath?)?.row)----------")
       // print("\(lastcell.countQtyTextField.text)000");
        let  myIndex :IndexPath! = self.countingEntryView.tableView.indexPath(for: lastcell);
        
        self.countEntryArray[myIndex.row] = lastcell.countQtyTextField.text!;
        print("text=====\(textField.text!)");
        lastcell.isSelected = false;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if DEVICE == .phone{
            self.showAnimation()
        }
        lastcell = textField.superview?.superview as? CountingEntryTableViewCell;
       // print("\((self.countingEntryView.tableView.indexPath(for: lastcell) as IndexPath?)?.row)----------")
       // print("\(lastcell.countQtyTextField.text)000");
        print("text=====\(textField.text!)");
        if didcell != nil{
            didcell.isSelected = false;
        }
        lastcell.isSelected = true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if DEVICE == .phone{
            self.hiddenAnimation()
            textField.resignFirstResponder()
        }
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
