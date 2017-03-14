//
//  BluetoothScannerView.swift
//  Stock Take Lite
//
//  Created by infoware on 4/12/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class BluetoothScannerView: CountingEntryView {
    
    var         barcodeLable:           UILabel!;
    var         barcodeTextFiled:       UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("blTitle");
        self.fileNameLabel.text = localString("blFileName");
        
        barcodeLable = UILabel();
        barcodeLable.text = localString("blBarcode");
        
        barcodeLable.textColor = self.colorWithString("#6D6E71");
        barcodeLable.font = FONT25()
        self.middelView.addSubview(barcodeLable);
        
        barcodeTextFiled = UITextField();
        barcodeTextFiled.borderStyle = UITextBorderStyle.roundedRect;
       // fileNameTextLabel.text = "File 3";
       // fileNameTextLabel.textColor = self.colorWithString("#6D6E71");
        //fileNameTextLabel.font = FONT22()
        barcodeTextFiled.font = FONT25()
        barcodeTextFiled.returnKeyType = .search
        self.middelView.addSubview(barcodeTextFiled);
        if DEVICE == .phone{
          bluetoothPhoneConstraint()
        }else{
            bluetoothConstraint()
        }
        
    }
    
    
    func bluetoothPhoneConstraint(){
        
        self.fileNameLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(10);
            make.left.equalTo(self.middelView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        self.middelView.snp.updateConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
        }
        barcodeLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNumberLabel.snp.bottom).offset(10);
            make.left.equalTo(self.skuNumberLabel.snp.left);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        barcodeTextFiled.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.barcodeLable.snp.top);
            make.left.equalTo(self.barcodeLable.snp.right).offset(15);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.bottom.equalTo(self.barcodeLable.snp.bottom);
            
        }

        self.tableView.snp.updateConstraints { (make) in
            make.top.equalTo(self.tableViewTopLineLable.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 7);
        }

    }
    
    func bluetoothConstraint(){
        
        self.fileNameLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.middelView.snp.top).offset(25);
            make.left.equalTo(self.middelView.snp.left).offset(111);
            make.width.equalTo(135);
            make.height.equalTo(40);
        }
        
        
        self.middelView.snp.updateConstraints { (make) in
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(190);
        }
        barcodeLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.skuNumberLabel.snp.bottom).offset(10);
            make.left.equalTo(self.skuNumberLabel.snp.left);            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        barcodeTextFiled.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.barcodeLable.snp.top);
            make.left.equalTo(self.barcodeLable.snp.right).offset(40);
            make.width.equalTo(200);
            make.bottom.equalTo(self.barcodeLable.snp.bottom);
            
        }
        
        self.tableView.snp.updateConstraints { (make) in
            make.top.equalTo(self.tableViewTopLineLable.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(440);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
