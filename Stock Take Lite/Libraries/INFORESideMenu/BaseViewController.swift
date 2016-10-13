//
//  CustomViewController.swift
//  Stock Take Little
//
//  Created by infoware on 29/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,INFODrawerControllerChild,INFODrawerControllerPressenting {
    weak var drawer:            INFOViewController?;

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:SHOW TextFeild Animation
    
    func showAnimation(){
        UIView.animateWithDuration(0.2) {
            self.view.frame = CGRectMake(0, -SCREENHEIGHT/3, SCREENWIDTH, SCREENHEIGHT)
        }
    }
    
    func hiddenAnimation(){
        UIView.animateWithDuration(0.25) {
            self.view.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)
        }
    }

    /**
    提示框
    
    - parameter title:标题
    - parameter message:内容
    */
    func createAlertView(title:String,message:String?) {
        var alertView:              UIAlertView!;
        
        alertView = UIAlertView(title: title, message: message!, delegate: nil, cancelButtonTitle: localString("ok"));
        alertView.delegate = self;
        alertView.show();
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    func localString(aString:String)->String{
        return NSLocalizedString(aString, comment: "");
    }

    
}
