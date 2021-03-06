//
//  AppDelegate.swift
//  Stock Take Lite
//
//  Created by infoware on 29/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit
import Alamofire


let DEVICE = UIDevice.current.userInterfaceIdiom //获取当前设备类型
//let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
//let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let reachManager = NetworkReachabilityManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window?.backgroundColor = UIColor.white;
        
        
        reachManager!.listener = { status in
            
            switch status {
            case .notReachable,.unknown:
                            print("网络不可用")
            case .reachable(.ethernetOrWiFi),.reachable(.wwan):
             print("网络可用")
            
            }
        }
        reachManager?.startListening()
        
        let testVC = INFODrawerViewController();
        
        let logon = LogonViewController();
        
        let drawer = INFOViewController();
        drawer.initWithLeftViewController(testVC, centerViewController: logon);
        self.window?.rootViewController = drawer;
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
   // var window: UIWindow?
    

}

