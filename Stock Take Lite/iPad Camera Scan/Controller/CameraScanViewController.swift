//
//  CameraScanViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 17/12/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CameraScanViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var         cameraView:             CameraView!;
    var         dataArray:              NSMutableArray!;
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 7;
        dataArray = NSMutableArray();
        self.view.backgroundColor = UIColor.white;
        cameraView = CameraView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        self.cameraView.tableView.delegate = self;
        self.cameraView.tableView.dataSource = self;
        self.view.addSubview(cameraView);
        self.addButtonActions();
        self.cameraView.tableView.reloadData();
    }
    //MARK:- 添加按钮处理事件
    
    func addButtonActions(){
        
    }

    //MARK:- TableView代理
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :BluetoothScannerCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? BluetoothScannerCell;
        if cell == nil {
            cell = BluetoothScannerCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
//        let fileModel: FileDataModel = self.dataArray[indexPath.row] as! FileDataModel;
//        
//        cell?.skuNameLabel.text = fileModel.skuName as? String;
//        cell?.skuCodeLabel.text = fileModel.skuCode as? String;
//        cell?.onhandeQtyLabel.text = fileModel.onhandQty as? String;
//        cell?.countQtyLabel.text = fileModel.countQty as? String;
//        cell?.varianceQtyLabel.text = fileModel.varianceQty as? String;
        return cell!;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return self.dataArray.count;
        return 2;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DEVICE == .phone{
            return 50/1024.0 * SCREENHEIGHT
        }
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
