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
    var      networkManager:         NetWorkManager = NetWorkManager()
    var      activityIndicatorView:                   UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        activityIndicatorView.frame = CGRect(x: 80,y: 10, width: 0,height: 0)
        activityIndicatorView.activityIndicatorViewStyle = .white
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = UIColor.black
     //   activityIndicatorView.startAnimating()
        self.view.addSubview(activityIndicatorView)
        

        
    }
    
//    func netWorkAvailable()->Bool{
//        
//        var isAvailable:Bool = false
//        let NetworkManager = NetworkReachabilityManager()
//
//        NetworkManager!.listener = { status in
//            
//            switch status {
//            case .NotReachable:
//                isAvailable = false
//            case .Unknown:
//               isAvailable = false
//            case .Reachable(.EthernetOrWiFi):
//                
//               isAvailable = true
//            case .Reachable(.WWAN):
//                isAvailable = true
//            }
//        }
//       // NetworkManager!.startListening()
//        
//        return isAvailable
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:SHOW TextFeild Animation
    
    func showAnimation(){
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame = CGRect(x: 0, y: -SCREENHEIGHT/3, width: SCREENWIDTH, height: SCREENHEIGHT)
        }) 
    }
    
    func hiddenAnimation(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)
        }) 
    }

    /**
    提示框
    
    - parameter title:标题
    - parameter message:内容
    */
    func createAlertView(_ title:String,message:String?) {
        var alertView:              UIAlertView!;
        
        alertView = UIAlertView(title: title, message: message!, delegate: nil, cancelButtonTitle: localString("ok"));
        alertView.delegate = self;
        alertView.show();
        
    }
    
     @objc(alertView:clickedButtonAtIndex:) func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int)  {
        
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    func localString(_ aString:String)->String{
        return NSLocalizedString(aString, comment: "");
    }

    
}
