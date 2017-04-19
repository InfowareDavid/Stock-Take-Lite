//
//  UIAlertViewController+Extension.swift
//  Stock Take Lite
//
//  Created by infoware on 13/3/17.
//  Copyright © 2017年 infoware. All rights reserved.
//

import Foundation


extension UIAlertController{
    class func creatAlertView(_ title:String ,message:String ,okAction:UIAlertAction?,cancelAction:UIAlertAction?,style:UIAlertControllerStyle = .alert) -> UIAlertController{
        let alertView = UIAlertController(title: title, message: message, preferredStyle: style)
        if let cancelAction = cancelAction{
            alertView.addAction(cancelAction)
        }
        if let okAction = okAction{
            alertView.addAction(okAction)
        }
       return alertView
    }
}
