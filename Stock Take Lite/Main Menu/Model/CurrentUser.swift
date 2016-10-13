//
//  CurrentUser.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 7/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class CurrentUser: NSObject {
    var user:UserModel!;
    class func current() -> CurrentUser {
        struct leton{
            static var preidicate:dispatch_once_t = 0;
            static var instacance:CurrentUser?=nil;
        }
        dispatch_once(&leton.preidicate, {
            leton.instacance = CurrentUser();
        })
        return leton.instacance!;
    }

    /**
    退出登陆
    */
    
    class func clearUser(){
        
        let user:CurrentUser = CurrentUser.current();
        user.user.userID = "";
        user.user.userName = "";
        user.user.password = "";
        user.user.administrator = "0";
    }
    
    class func isAdmin ()->Bool{
        let user:CurrentUser = CurrentUser.current();
        if user.user != nil{
            if (user.user.administrator?.isEqualToString("1") != false ){
                return true;
            }
        }
        
        return false;
    }
    
}
