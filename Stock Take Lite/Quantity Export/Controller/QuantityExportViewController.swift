//
//  QuantityExportViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityExportViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {
    
    var         quantityExportView:                         QuantityExportView!;
    var         dataArray:                                  NSMutableArray!;
    var         dbManager:                                  DataBase!;
    var         nameArray:                                  NSArray!;
    var         currenrow:                                  NSInteger = 0;
    var         isSelected:                                 Bool = false;
    var         exportAlert:                                UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        previousRow = 4;
        self.view.backgroundColor = UIColor.white;
        dbManager = DataBase();
        dataArray = NSMutableArray();
        nameArray = NSArray();
         exportAlert = UIAlertView(title: localString("warning"), message: localString("inchoose"), delegate: self, cancelButtonTitle: localString("ok"));
        self.loadMyView();
        MBProgressHUD.showAdded(to: self.view , animated: true);
        // self.performSelectorInBackground("loadDataFromDataBase", withObject: nil);
        self.loadDataFromDataBase();
        self.quantityExportView.tableView.reloadData();
        MBProgressHUD.hideAllHUDs(for: self.view , animated: true);
        
    }
    
    func loadMyView(){
        
        quantityExportView = QuantityExportView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.view.addSubview(quantityExportView);
        self.quantityExportView.tableView.dataSource = self;
        self.quantityExportView.tableView.delegate = self;
        self.addButtonAction();
    }
    
    func loadDataFromDataBase(){
        self.nameArray = dbManager.allFileDates();
        if self.nameArray.count != 0{
            for item in self.nameArray {
                let enquiryModel:EnquiryModel = EnquiryModel();
                let itemArray:NSMutableArray = dbManager.recodesWithDate(item as! NSString);
                enquiryModel.date = item as? NSString;
                enquiryModel.skuNum = "\(itemArray.count)" as NSString?;
                var temOnhandNum = 0;
                var temcountedNum = 0;
               // for var i = 0;i < itemArray.count; i = i+1 {
                    for i in 0 ..< itemArray.count {
                    let fileModel:FileDataModel = itemArray[i] as!FileDataModel;
                    temOnhandNum = temOnhandNum + (fileModel.onhandQty?.integerValue)!;
                    temcountedNum = temcountedNum + (fileModel.countQty?.integerValue)!;
                }
                enquiryModel.onhandQty = "\(temOnhandNum)" as NSString?;
                enquiryModel.countedQty = "\(temcountedNum)" as NSString?;
                self.dataArray.add(enquiryModel);
            }
        }else{
            self.createAlertView(localString("warning"), message: localString("aexportAlert"));
        }
    }
    
    func addButtonAction(){
        
        self.quantityExportView.okButton.addTarget(self, action: #selector(QuantityExportViewController.okButtonAction), for: UIControlEvents.touchUpInside);
        self.quantityExportView.returnButton.addTarget(self, action: #selector(QuantityExportViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
        self.quantityExportView.logoutButton.addTarget(self, action: #selector(QuantityExportViewController.logoutAction), for: UIControlEvents.touchUpInside);
    }
    
    func okButtonAction(){
        if isSelected {
            let successVC = ExportSuccessViewController();
            let enquiryModel:EnquiryModel = self.dataArray[currenrow] as! EnquiryModel;
            successVC.fileDate = enquiryModel.date;
            successVC.skuNum = enquiryModel.skuNum;
            self.drawer?.repleaceCenterViewControllerWithViewController(successVC);
        }else{
            exportAlert.show();
        }
    }
    
    func returnButtonAction(){
        currenrow = 0;
        isSelected = false;
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }

    
    //MARK: - tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :CountingEnquiryTableViewCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? CountingEnquiryTableViewCell;
        if cell == nil {
            cell = CountingEnquiryTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        let enquiryModel:EnquiryModel = self.dataArray[(indexPath as NSIndexPath).row] as!EnquiryModel;
        cell?.dataAndTimeLabel.text = enquiryModel.date as? String;
        cell?.onhandQtyLabel.text = enquiryModel.onhandQty as? String;
        cell?.countedQtyLabel.text = enquiryModel.countedQty as? String;
        cell?.numberOfSKULabel.text = enquiryModel.skuNum as? String;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
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
        isSelected = true;
        currenrow = (indexPath as NSIndexPath).row;
    }
    
    override func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if alertView == exportAlert{
            
        }else{
            super.alertView(alertView, clickedButtonAt: buttonIndex);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
