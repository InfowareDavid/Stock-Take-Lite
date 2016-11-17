//
//  LogonViewController.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 6/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//
/*
 
 #if LITE_VERSION
 print("lite")
 
 #elseif PRO_VERSION
 print("pro")
 
 #elseif ENTERPRISE_VERSION
 print("enterprise")
 
 #endif
 
 */


/// 登陆页面

import UIKit


let SCREENWIDTH = UIScreen.main.bounds.width;
let SCREENHEIGHT = UIScreen.main.bounds.height;
let CSVFILEPATH = NSHomeDirectory() + "/Documents/CSVfile"
//Documents
var count = 0
class LogonViewController: BaseViewController,UITextFieldDelegate,XMLParserDelegate {
    var         logonView:                               LogonView!;
    var         database:                                DataBase = DataBase.manager;
    var         fileManager:                             FileManager!;
    var         currentElement:                          String=""
    var         statusString:                            String=""
    let         user:                                    UserModel = UserModel();
    
    var parse:XMLParser? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad();
        fileManager = FileManager();
        self.cteateUI();
        self.createDirectorAtCSVPath();
        
    }
    
    
    
    func cteateUI(){
        
        logonView = LogonView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT));
        logonView.userIDTextField?.delegate = self
        logonView.passwordTextField?.delegate = self
        self.view.addSubview(logonView);
        logonView.userAccountSetupButton?.addTarget(self, action: #selector(LogonViewController.userAccountSetupButtonAction(_:)), for: UIControlEvents.touchUpInside);
        logonView.logonButton?.addTarget(self, action: #selector(LogonViewController.logonAction(_:)), for: UIControlEvents.touchUpInside);
        self.setUserAccountButtonState();
    }
    
    func userAccountSetupButtonAction(_ regist:UIButton){
        
        let userAccountSetupVC = UserAccountsSetupViewController();
        userAccountSetupVC.lastVC = self;
        
        self.drawer?.repleaceCenterViewControllerWithViewController(userAccountSetupVC);
        
    }
    
    func createDirectorAtCSVPath(){
        
        try! self.fileManager.createDirectory(atPath: CSVFILEPATH, withIntermediateDirectories: true, attributes: nil);
        
    }
    
    func logonAction(_ logon:UIButton){
        
        
        self.hiddenAnimation()
        user.userID = logonView.userIDTextField?.text as NSString?;
        user.password = logonView.passwordTextField?.text as NSString?;
        user.userName = nil;
        
//        let app = AppDelegate()
//        
//        for index in 0..<1000{
//            user.userID = "\(index)"
//            user.password = "\(index+5)"
//             self.postPassword(self.user)
//            print("index-------------------->\(index)")
//        }
//        
//        
//        if ((app.reachManager?.isReachable) != nil){
//        
//            self.postPassword(self.user)
//            self.activityIndicatorView.startAnimating()
//        }
        
        
        
        
               // MARK:- 之前FTP版本的密码校验
        
                if database.isUserPasswordright(user){
                    let currentUser:CurrentUser = CurrentUser.current;
                    currentUser.user = user;
                    let mainVC:MainViewController = MainViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
                }else{
                    self.createAlertView("警告", message: "账户或密码有误！");
                }
    }
    
    func logonToMainViewController(){
        let currentUser:CurrentUser = CurrentUser.current;
        currentUser.user = user;
        let mainVC:MainViewController = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
    }
    
    func postPassword(_ user:UserModel){
        
        let message = "<userName>\(user.userID!)</userName><password>\(user.password!)</password>"
        
        networkManager.postRequest(Service.UserService.rawValue, action: ServiceAction.UserServiceAction.RegistAction.rawValue, paramValues: message, success:{
            data in
//            self.parse = NSXMLParser(data: data)
//            self.parse!.delegate = self
//            self.parse!.parse()
            
            let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            count+=1
            print("count------------>\(count)")
            print("\(string!)")
        })
    }
    
    
    /**
     设置按钮的状态
     */
    
    func setUserAccountButtonState(){
        if database.isAnyCurrentUserExists(){
            self.logonView.userAccountSetupButton?.isHighlighted = true;
            self.logonView.userAccountSetupButton?.isEnabled = false;
        }else{
            self.logonView.userAccountSetupButton?.isEnabled = true;
        }
    }
    //MARK: - TextField Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if DEVICE == .phone{
            showAnimation()
            
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if DEVICE == .phone{
            textField.resignFirstResponder()
            hiddenAnimation()
        }
        return true
    }
    
    
    override func createAlertView(_ title:String,message:String?) {
        
        let  alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        let cancelAction:UIAlertAction = UIAlertAction(title: localString("cancel"), style: UIAlertActionStyle.default, handler: nil);
        let OkAction:UIAlertAction = UIAlertAction(title: localString("ok"), style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            //这是一个空的代码块
        });
        alertView.addAction(cancelAction);
        alertView.addAction(OkAction);
        self.present(alertView, animated: true, completion: nil);
    }
    
    
    //MARK: - XMLParseDelegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "LogonResult"{
            statusString = string
        }
        
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if statusString=="ok"{
            print("登录成功")
            parser.abortParsing()
            activityIndicatorView.stopAnimating()
            logonToMainViewController()
            
        }else if statusString=="no"{
            print("登录失败")
            parser.abortParsing()
            activityIndicatorView.stopAnimating()
            self.createAlertView("警告", message: "账户或密码有误！");
        }
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("statusString---->\(statusString)")
        print("endendend")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
