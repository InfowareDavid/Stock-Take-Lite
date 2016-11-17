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
        self.view.backgroundColor = UIColor.white;
        countingDetalView = CountingEnquiryDetalView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
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
        for i in 0 ..< self.dataArray.count{
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
        self.countingDetalView.returnButton.addTarget(self, action: #selector(CountingEnquiryDetalViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
        self.countingDetalView.logoutButton.addTarget(self, action: #selector(CountingEnquiryDetalViewController.returnButtonAction), for: UIControlEvents.touchUpInside);
    }
    
    func returnButtonAction(){
        let countingVC = CountingEnquiryViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(countingVC);
    }
    
    func logoutAction(){
        
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = nil;
        let logonVC = LogonViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(logonVC);
        
    }

    // MARK: - tableview
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :CountingEnquiryDetalCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? CountingEnquiryDetalCell;
        if cell == nil {
            cell = CountingEnquiryDetalCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[(indexPath as NSIndexPath).row] as! FileDataModel;
        
        cell?.skuNameLabel.text = fileModel.skuName as? String;
        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
        cell?.countQtyLabel.text = fileModel.countQty as? String;
        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
