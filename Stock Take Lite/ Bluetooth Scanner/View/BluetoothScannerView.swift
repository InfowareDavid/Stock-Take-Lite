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
        barcodeTextFiled.borderStyle = UITextBorderStyle.RoundedRect;
       // fileNameTextLabel.text = "File 3";
       // fileNameTextLabel.textColor = self.colorWithString("#6D6E71");
        //fileNameTextLabel.font = FONT22()
        barcodeTextFiled.font = FONT25()
        barcodeTextFiled.returnKeyType = .Search
        self.middelView.addSubview(barcodeTextFiled);
        if DEVICE == .Phone{
          bluetoothPhoneConstraint()
        }else{
            bluetoothConstraint()
        }
        
    }
    
    
    func bluetoothPhoneConstraint(){
        
        self.fileNameLabel.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middelView.mas_top).with.offset(10);
            make.left.equalTo(self.middelView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        self.middelView.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.23);
        }
        barcodeLable.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNumberLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.skuNumberLabel.mas_left);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(25);
        }

        barcodeTextFiled.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.barcodeLable.mas_top);
            make.left.equalTo(self.barcodeLable.mas_right).with.offset(15);
            make.width.equalTo(SCREENWIDTH * 0.4);
            make.bottom.equalTo(self.barcodeLable.mas_bottom);
            
        }

        self.tableView.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLineLable.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 7);
        }

    }
    
    func bluetoothConstraint(){
        
        self.fileNameLabel.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middelView.mas_top).with.offset(25);
            make.left.equalTo(self.middelView.mas_left).with.offset(111);
            make.width.equalTo(135);
            make.height.equalTo(40);
        }
        
        
        self.middelView.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(190);
        }
        barcodeLable.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.skuNumberLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.skuNumberLabel.mas_left);            make.width.equalTo(130);
            make.height.equalTo(40);
        }
        
        barcodeTextFiled.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.barcodeLable.mas_top);
            make.left.equalTo(self.barcodeLable.mas_right).with.offset(40);
            make.width.equalTo(200);
            make.bottom.equalTo(self.barcodeLable.mas_bottom);
            
        }
        
        self.tableView.mas_updateConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.tableViewTopLineLable.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(440);
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
