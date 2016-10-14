//
//  NetAddressFile.swift
//  Stock Take Lite
//
//  Created by infoware on 14/10/16.
//  Copyright © 2016年 infoware. All rights reserved.
//

import Foundation

//测试地址
let kURLHeader = "http://192.168.2.17:9090/"

//请求的命名空间
let kNameSpace = "http://infoware.com/"

//服务地址
enum Service:String {
        case UserService = "UserService.asmx"
        case ProductService = "ProductService.asmx"
        case StockService = "StockService.asmx"
}

//服务器接口地址
enum ServiceAction{
    
    enum UserServiceAction:String{
        case RegistAction = "Regist"
        case LogonAction = "LogonAction"
    }
    enum ProductServiceAction:String{
        case GetProductAction = "GetProduct"
        case AddProductAction = "AddProduct"
    }
    enum StockServiceAction :String{
        case AddStockAction = "AddStock"
        case UpdateCountAction = "UpdateCount"
        case GetStockAction = "GetStock"
    }
}

