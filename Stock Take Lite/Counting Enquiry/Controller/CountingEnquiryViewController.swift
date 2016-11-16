//
//  CountingEnquiryViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEnquiryViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource ,UIAlertViewDelegate{
    
    var         countingEnquiryView:                        CountingEnquiryView!;
    var         dataArray:                                  NSMutableArray!;
    var         dbManager:                                  DataBase!;
    var         nameArray:                                  NSArray!;
    var         currenrow:                                  NSInteger = 0;
    var         isSelected:                                 Bool = false;
    var         chooseAlert:                                UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 3;
        self.view.backgroundColor = UIColor.whiteColor();
        dbManager = DataBase();
        dataArray = NSMutableArray();
        nameArray = NSArray();
        chooseAlert = UIAlertView(title: localString("warning"), message: localString("inchoose"), delegate: self, cancelButtonTitle: localString("ok"));
        self.loadMyView();
        MBProgressHUD.showHUDAddedTo(self.view , animated: true);
        self.loadDataFromDataBase();
        self.countingEnquiryView.tableView.reloadData();
        MBProgressHUD.hideAllHUDsForView(self.view , animated: true);

    }
    
    func loadMyView(){
        countingEnquiryView = CountingEnquiryView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(countingEnquiryView);
        self.countingEnquiryView.tableView.delegate = self;
        self.countingEnquiryView.tableView.dataSource = self;
        self.addButtonAction();
       
    }
    
    func loadDataFromDataBase(){
        self.nameArray = dbManager.allFileDates();
        if self.nameArray.count != 0{
            for item in self.nameArray {
                let enquiryModel:EnquiryModel = EnquiryModel();
                let itemArray:NSMutableArray = dbManager.recodesWithDate(item as! NSString);
                enquiryModel.date = item as? NSString;
                enquiryModel.skuNum = "\(itemArray.count)";
                var temOnhandNum = 0;
                var temcountedNum = 0;
                //MARK: CHANGE 4
                for i in 0 ..< itemArray.count {
                    let fileModel:FileDataModel = itemArray[i] as!FileDataModel;
                    temOnhandNum = temOnhandNum + (fileModel.onhandQty?.integerValue)!;
                    temcountedNum = temcountedNum + (fileModel.countQty?.integerValue)!;
                }
                enquiryModel.onhandQty = "\(temOnhandNum)";
                enquiryModel.countedQty = "\(temcountedNum)";
                self.dataArray.addObject(enquiryModel);
            }
        }else{
            self.createAlertView(localString("warning"), message: localString("aeAlert"));
        }
    }
    
    //MARK: - 按钮点击事件 -
    
    func  addButtonAction(){
        
        self.countingEnquiryView.okButton.addTarget(self, action: #selector(CountingEnquiryViewController.okButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.countingEnquiryView.returnButton.addTarget(self, action: #selector(CountingEnquiryViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.countingEnquiryView.logoutButton.addTarget(self, action: #selector(CountingEnquiryViewController.logoutAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current();
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }
    
    func returnButtonAction(){
        currenrow = 0;
        isSelected = false;
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func okButtonAction(){
        if isSelected {
            let detaVC:CountingEnquiryDetalViewController = CountingEnquiryDetalViewController();
            let enquiryModel:EnquiryModel = self.dataArray[currenrow] as! EnquiryModel;
            detaVC.fileDate = enquiryModel.date;
            detaVC.skuNum = enquiryModel.skuNum;
            self.drawer?.repleaceCenterViewControllerWithViewController(detaVC);
        }else{
           // self.createAlertView(localString("warning"), message: localString("inchoose"));
            chooseAlert.show();
        }
    }
    
    // MARK: - tableView delegate -
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :CountingEnquiryTableViewCell?;
        
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? CountingEnquiryTableViewCell;
        
        if cell == nil {
            cell = CountingEnquiryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        let enquiryModel:EnquiryModel = self.dataArray[indexPath.row] as!EnquiryModel;
        
        cell?.dataAndTimeLabel.text = enquiryModel.date as? String;
        cell?.onhandQtyLabel.text = enquiryModel.onhandQty as? String;
        cell?.countedQtyLabel.text = enquiryModel.countedQty as? String;
        cell?.numberOfSKULabel.text = enquiryModel.skuNum as? String;
        
        return cell!;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
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
        isSelected = true;
        currenrow = indexPath.row;
    }
    
    
    override func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView == chooseAlert{
            
        }else{
            super.alertView(alertView, clickedButtonAtIndex: buttonIndex);
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
