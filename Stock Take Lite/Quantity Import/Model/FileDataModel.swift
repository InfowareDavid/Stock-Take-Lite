//
//  FileDataModel.swift
//  Stock Take Lite
//
//  Created by infoware on 29/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class FileDataModel: NSObject {
    
    var             fileName:               NSString?;
    var             skuCode:                NSString?;
    var             skuName:                NSString?;
    var             onhandQty:              NSString? = "0";
    var             countQty:               NSString? = "0";
    var             varianceQty:            NSString? = "0";
    var             fileDate:               NSString? = "0";
    var             barcode:                NSString? = "0";
}
