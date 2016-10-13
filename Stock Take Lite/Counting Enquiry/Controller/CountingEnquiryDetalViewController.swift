//
//  CountingEnquiryDetalViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 16/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CountingEnquiryDetalViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var         countingDetalView:                  CountingEnquiryDetalView!;
    var         fileDate:                           NSString!;
    var         skuNum:                             NSString!;
    var         dataArray:                          NSMutableArray!;
    var         dbManager:                          DataBase!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray = NSMutableArray();
        dbManager = DataBase();
        self.view.backgroundColor = UIColor.whiteColor();
        countingDetalView = CountingEnquiryDetalView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(countingDetalView);
        self.countingDetalView.tableView.delegate = self;
        self.countingDetalView.tableView.dataSource = self;
        self.updataPromptLabel();
        self.loadDataFromDataBase();
        self.countingDetalView.tableView.reloadData();
        self.updateTotalLabel();
        self.addButtonAction();
    }
    
    func loadDataFromDataBase(){
      self.dataArray = dbManager.recodesWithDate(self.fileDate);
    }
    
    /**
    更新提示标签
    */
    func updataPromptLabel(){
        self.countingDetalView.fileNameTextLabel.text = self.fileDate as String;
        self.countingDetalView.skuNumberTextLabel.text = self.skuNum as String;
    }
    
    func updateTotalLabel(){
        var temOhand:Float = 0;
        var temCounted:Float = 0.0;
        var variance:Float = 0.0;
        for i in 0 ... self.dataArray.count{
            let fileModel:FileDataModel = self.dataArray[i] as! FileDataModel;
            temOhand = Float(temOhand) + Float((fileModel.onhandQty?.floatValue)!);
            temCounted = Float(temCounted) + Float((fileModel.countQty?.floatValue)!);
            variance = Float(variance) + Float((fileModel.varianceQty?.floatValue)!);
        }
        
        self.countingDetalView.onhandTotalLabel.text = String(format: "%0.0f", arguments: [temOhand]);
        self.countingDetalView.countTotalLabel.text = String(format: "%0.0f", arguments: [temCounted]);
        self.countingDetalView.varianceTotalLabel.text = String(format: "%0.0f", arguments: [variance]);
    }
    
    // MARK: - ButtonAction
    
    func addButtonAction(){
        self.countingDetalView.returnButton.addTarget(self, action: #selector(CountingEnquiryDetalViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        self.countingDetalView.logoutButton.addTarget(self, action: #selector(CountingEnquiryDetalViewController.returnButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func returnButtonAction(){
        let countingVC = CountingEnquiryViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(countingVC);
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current();
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }

    // MARK: - tableview
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :CountingEnquiryDetalCell?;
        cell = tableView.dequeueReusableCellWithIdentifier("cellid") as? CountingEnquiryDetalCell;
        if cell == nil {
            cell = CountingEnquiryDetalCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[indexPath.row] as! FileDataModel;
        
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyLabel.text = fileModel.countQty as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
