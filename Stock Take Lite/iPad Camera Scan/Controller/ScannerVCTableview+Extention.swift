//
//  ScannerViewController+Extention.swift
//  Stock Take Lite
//
//  Created by infoware on 10/3/17.
//  Copyright © 2017年 infoware. All rights reserved.
//

import Foundation

let NUMBERS = "0123456789"

extension ScannerViewController:UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    
    
    //MARK: - Data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :ScannerTableViewCell?;
        cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? ScannerTableViewCell;
        if cell == nil {
            cell = ScannerTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellid");
        }
        
        let fileModel: FileDataModel = self.dataArray[(indexPath as NSIndexPath).row] as! FileDataModel;
        
        cell?.skuCode.text = fileModel.barcode as? String
        cell?.countQty.text = fileModel.countQty as? String
        cell?.onhand.text = fileModel.onhandQty as? String
        cell?.varianceQty.text = fileModel.varianceQty as? String
        cell?.skuName.text = fileModel.skuName as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fileModel:FileDataModel = self.dataArray[indexPath.row] as! FileDataModel
        let alertView = UIAlertController(title: fileModel.barcode as String? , message: "Please input the CountQty of \(fileModel.skuName!)", preferredStyle: .alert)
        alertView.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.delegate = self
        }
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
            //okAction
            var  countNum = alertView.textFields?.last?.text!
            if countNum == ""{
                countNum = fileModel.countQty! as String
            }
            fileModel.countQty = countNum as NSString?
            let temVrianceQty = (fileModel.onhandQty?.integerValue)! - (fileModel.countQty?.integerValue)!;
            fileModel.varianceQty = "\(temVrianceQty)" as NSString?;
            self.displayTableView?.reloadData()
            self.dbManager.updateFileContentWithModel(fileModel)

        }))
        self.present(alertView, animated: true, completion: nil)
    }
    
    // MARK: - UITextField Delegate 返回数字
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var     cs:     CharacterSet
        cs = CharacterSet(charactersIn: NUMBERS).inverted
        let     toFiltered:NSArray = string.components(separatedBy: cs) as NSArray
        let    filetered:String = toFiltered.componentsJoined(by: ",")
        if string != filetered{
            return false
        }        
        return true
    }
    
    
}
