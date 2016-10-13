//
//  CurrentFTP.swift
//  Stock Take Lite
//
//  Created by infoware on 27/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CurrentFTP: NSObject {

    var             ftpServer:                  NSString!;
    var             ftpUser:                    NSString!;
    var             ftpPassword:                NSString!;
    
    class func current() -> CurrentFTP {
        struct leton{
            static var preidicate:dispatch_once_t = 0;
            static var instacance:CurrentFTP?=nil;
        }
        dispatch_once(&leton.preidicate, {
            leton.instacance = CurrentFTP();
        })
        return leton.instacance!;
    }

    
}
