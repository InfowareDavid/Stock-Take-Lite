//
//  IFONetManager.swift
//  Stock Take Lite
//
//  Created by infoware on 14/10/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import UIKit

import Alamofire

typealias SuccessBlock = (Data)->Void
typealias FaileBlock = (NSError)->Void

class NetWorkManager: NSObject{
    
    var         webData:                    NSMutableData!
    var         currentService:             String = String()
    var         currentAction:              String = String()
    var         successBlock:               SuccessBlock?
    var         faileBlock:                 FaileBlock?
    
    func postRequest(_ service:String,action:String,paramValues:String,success:@escaping SuccessBlock){
        
        self.successBlock = success
        
        self.currentService = service
        
        self.currentAction = action
        
        let URL = getURL(service, action: action)
        print(URL)
        
        let soapMsg:String = toSoapMessage(action, pams: paramValues)
        
        let mutableURLRequest: NSMutableURLRequest = getMutableRequest(action, URL: URL, soapMsg: soapMsg)
        
        //MARK: - 修改过后
        Alamofire.request(mutableURLRequest as! URLRequestConvertible).responseData { response in

            if response.result.isSuccess{
                if let successful = self.successBlock{
                    successful(response.data!)
                }
            }else{
                 print("请求数据失败----》\(response.result.error.debugDescription)")
            //    self.faileBlock!(response.result.error!)
            }
        }
        
    }
    
   
    func getMutableRequest(_ action:String,URL:Foundation.URL,soapMsg:String)->NSMutableURLRequest{
        
       // let mutableURLRequest: NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        let mutableURLRequest:NSMutableURLRequest = NSMutableURLRequest(url: URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 1)
        mutableURLRequest.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
         let soapAction = kNameSpace+action
        print("\(soapAction)")
        mutableURLRequest.setValue(soapAction, forHTTPHeaderField: "SOAPAction")
        mutableURLRequest.setValue("\(soapMsg.characters.count)", forHTTPHeaderField: "Content-Length")
        mutableURLRequest.httpMethod = "POST"
        mutableURLRequest.httpBody = soapMsg.data(using: String.Encoding.utf8)
        
        return mutableURLRequest
    }
    
    /*
     Param:
     
        service:服务地址 eg.  ProductService.asmx
     
        action: 服务端口 eg.  GetProduct
     
     Return: "http://192.168.2.17:9090/ProductService.asmx?op=GetProduct"
     ?op=
     */
    
    func getURL(_ service:String,action:String)->URL{
        let urlStr = kURLHeader+service+"?op="+action
        return URL(string: urlStr)!
    }
    

    /*
     Description: 拼接请求的字符串
     
     Param:
     
        action:服务端口 eg.  GetProduct
     
        pams:需要上传的参数
     
     Return: 字符串
     */
    
    func toSoapMessage(_ action: String, pams: String) -> String {
        var message: String = String()
        message += "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        message += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        message += "<soap:Body>"
        message += "<\(action) xmlns=\"\(kNameSpace)\">"
        message += "\(pams)"
        message += "</\(action)>"
        message += "</soap:Body>"
        message += "</soap:Envelope>"
        print(message)
        return message
    }

}
