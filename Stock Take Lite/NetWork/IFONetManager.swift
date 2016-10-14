//
//  IFONetManager.swift
//  Stock Take Lite
//
//  Created by infoware on 14/10/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessBlock = (NSData)->Void

class IFONetManager: NSObject{
    
    var         webData:                    NSMutableData!
    var         soapResults:                String = String()
    var         elementFound:               Bool = false
    var         matchingElement:            String!
    var         currentService:             String = String()
    var         currentAction:              String = String()
    var         successBlock:               SuccessBlock?
    
    func getRequest(service:String,action:String,paramValues:String,success:SuccessBlock)->NSMutableURLRequest{
        
        self.successBlock = success
        
        self.currentService = service
        
        self.currentAction = action
        
        
        let URL = getURL(service, action: action)
        
        let soapMsg:String = toSoapMessage(action, pams: paramValues)
        
        let mutableURLRequest: NSMutableURLRequest = getMutableRequest(action, URL: URL, soapMsg: soapMsg)
        
        
        Alamofire.request(mutableURLRequest).responseData { response in
            
//            let string:NSString = NSString(data: response.data!, encoding: NSUTF8StringEncoding)!
//            print("response----------->\(string)")
//            let parse:NSXMLParser = NSXMLParser(data: response.data!)
//            parse.delegate = self
//            parse.parse()
            
            //这里直接调用返回数据的Block，放在其他地方解析Model?
            if let successful = self.successBlock{
                successful(response.data!)
            }
        }
        
        return mutableURLRequest
    }
    
    func getMutableRequest(action:String,URL:NSURL,soapMsg:String)->NSMutableURLRequest{
        
        let mutableURLRequest: NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        mutableURLRequest.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        mutableURLRequest.setValue(kNameSpace+action, forHTTPHeaderField: "SOAPAction")
        mutableURLRequest.setValue("\(soapMsg.characters.count)", forHTTPHeaderField: "Content-Length")
        mutableURLRequest.HTTPMethod = "POST"
        mutableURLRequest.HTTPBody = soapMsg.dataUsingEncoding(NSUTF8StringEncoding)
        
        return mutableURLRequest
    }
    
    /*
     Param:
     
        service:服务地址 eg.  ProductService.asmx
     
        action: 服务端口 eg.  GetProduct
     
     Return: "http://192.168.2.17:9090/ProductService.asmx/GetProduct"
     
     */
    
    func getURL(service:String,action:String)->NSURL{
        let urlStr = kURLHeader+service+"/"+action
        return NSURL(string: urlStr)!
    }
    

    /*
     Description: 拼接请求的字符串
     
     Param:
     
        action:服务端口 eg.  GetProduct
     
        pams:需要上传的参数
     
     Return: 字符串
     */
    
    func toSoapMessage(action: String, pams: String) -> String {
        var message: String = String()
        message += "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        message += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        message += "<soap:Body>"
        message += "<\(action) xmlns=\(kNameSpace)/\">"
        message += "\(pams)"
        message += "</\(action)>"
        message += "</soap:Body>"
        message += "</soap:Envelope>"
        return message
    }
    
//
//    
//    //MARK:- Parse Delegate
//    
//    
//    func parser(parser: NSXMLParser, foundCharacters string: String) {
//       
//        //在这里判断是哪一个服务，即可知应该是用哪一个Model
//        
//    }
//    
//    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        
//        if elementName == "Product"{
//            // print("\(elementName)-------\(soapResults)")
//        }
//    }
//    
//    func parserDidEndDocument(parser: NSXMLParser) {
//        // print(soapResults)
//        soapResults = ""
//    }
//    
//    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
//        soapResults = ""
//    }
//    

}
