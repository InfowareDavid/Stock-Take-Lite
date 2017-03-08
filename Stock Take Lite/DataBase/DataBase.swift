//
//  DataBase.swift
//  Stock Take Mobile Lite
//
//  Created by infoware on 6/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//
/// 数据库连接
import UIKit

class DataBase: NSObject ,UIAlertViewDelegate{
    
   static let manager = DataBase()
    var _dataBase:FMDatabase!;
//    class func manager() -> DataBase {
//        struct leton{
//            static var preidicate:Int = 0;
//            static var instacance:DataBase?=nil;
//            
//        }
//        _ = DataBase.__once
//        return leton.instacance!;
//    }
    
    override init() {
        super.init();
        self.initTables();
    }
    
    /**
    初始化数据表
    
    - returns: 
    */
    func initTables(){
        let dbPath = NSHomeDirectory() + "/Documents/DataBase.rdb";
        print("\(dbPath)");
        _dataBase = FMDatabase(path: dbPath);
        if !_dataBase.open(){
            print("数据库打开失败");
        }

        /**
        *
        *  UserTable
        *
        */
        
        if !_dataBase.executeStatements("create table if not exists UserTable(id integer primary key autoincrement,userID Varchar(256),userName Varchar(256),password text,administrator text)"){
            print("创建UserTable失败");
        }
        
        if !_dataBase.executeStatements("create table if not exists CurrentUserTable(id integer primary key autoincrement,userID Varchar(256),userName Varchar(256),password text,administrator text)"){
            print("创建CurrentUserTable失败");
        }
        
        if !_dataBase.executeStatements("create table if not exists CSVFileTable(id integer primary key autoincrement,FileName Varchar(256),FileDate Varchar(256),SKUCode Varchar(256),SKUName Varchar(256),OnhandQty Varchar(256),CountQty Varchar(256), VarianceQty Varchar(256),Barcode Varchar(256))"){
            print("创建CSVFileTable失败");
        }
        
        let userModel:UserModel! = UserModel();
        userModel.userID = "admin";
        userModel.userName = "admin";
        userModel.password = "admin";
        userModel.administrator = "1";
        
        if !isUserExists(userModel){
            addUser(userModel);
        }
    }
    
    /*
     *
     * UserTable ，增加用户，修改密码，用户查询，
     *
     */
    
    func addUser(_ user:UserModel)->Bool{
        
        if self.isUserExists(user){
           // self.createAlertView("警告", message: "该用户已经存在！");
            return false;
        }
        
        let sqlStr = "insert into UserTable(userID,userName,password,administrator) values(?,?,?,?)";
        if !_dataBase.executeUpdate(sqlStr, withArgumentsIn: [user.userID!,user.userName!,user.password!,user.administrator!]){
            print("插入UserTable失败");
        }
        return true;
    }

    func deleteUser(_ user:UserModel!)->Bool{
        let sqlStr = "delete from UserTable where userID = ?"
        if !_dataBase.executeUpdate(sqlStr, withArgumentsIn: [user.userID!]){
            print("删除\(user.userID)失败");
            return false;
        }
        return true;
    }
    
    func isUserExists(_ user:UserModel)->Bool{
        let sqlStr = "select * from UserTable where userID = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [user.userID!])
        if resultSet.next(){
            return true;
        }
        return false;
    }
    
    func isUserPasswordright(_ user:UserModel)->Bool{
        let sqlStr = "select * from UserTable where userID = ? and password = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [user.userID!,user.password!]);
        
        if resultSet.next(){
            
            return true;
        }
        return false;
    }
    
    func isAdmin(_ user:UserModel)->Bool{
        let sqlStr = "select * from UserTable where userID = ? and password = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [user.userID!,user.password!]);
        if resultSet.next() {
            let temStr = resultSet.object(forColumnName: "administrator") as? NSString;
            if  (temStr?.isEqual(to: "1") != false){
                return true;
            }
        }
        return false;
        
    }
    
    func allUsers()->NSMutableArray{
        var         returnBackArray:                NSMutableArray!;
        returnBackArray = NSMutableArray();
        let sqlStr = "select * from UserTable";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: nil);
        while resultSet.next() {
            let userModel:    UserModel!;
            userModel = UserModel();
            userModel.userID = resultSet.object(forColumnName: "userID") as? NSString;
            userModel.userName = resultSet.object(forColumnName: "userName") as? NSString;
            userModel.administrator = resultSet.object(forColumnName: "administrator") as? NSString;
            returnBackArray.add(userModel);
        }
        returnBackArray.removeObject(at: 0);
        return returnBackArray;
    }
    
    /**
    
        CurrentUserTable
   
    */
    
    func addCurrentUser(_ currentUser:CurrentUser)->Bool{
        
        if isCurrentUserExists(currentUser){

            return false;
        }
        
        let sqlStr = "insert into CurrentUserTable(userID,userName,password,administrator) values(?,?,?,?)";
        
        if !_dataBase.executeUpdate(sqlStr, withArgumentsIn: [currentUser.user.userID!,currentUser.user.userName!,"",currentUser.user.administrator!]){
            print("插入CurrentUserTable失败");
            return false;
        }
        return true;
    }
    
    func isCurrentUserExists(_ currentUser:CurrentUser)->Bool{
        
        let sqlStr = "select * from CurrentUserTable where userID = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [currentUser.user.userID!])
        if resultSet.next(){
            return true;
        }
        return false;
    }
    
    func isAnyCurrentUserExists()->Bool{
        let sqlStr = "select * from CurrentuserTable";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: nil);
        if resultSet.next(){
            return true;
        }
        return false;
    }
    
    /*
     *
     *  导入文件的表
     *
     *
     */
    @discardableResult
    func addFileData(_ fileModel:FileDataModel)->Bool{
       
        if self.isfileDataExists(fileModel.skuCode as! String){
            return false;
        }
        let sqlStr = "insert into CSVFileTable(FileName,FileDate,SKUCode,SKUName,OnhandQty,CountQty,VarianceQty,Barcode) values(?,?,?,?,?,?,?,?)";
        
        if !_dataBase.executeUpdate(sqlStr, withArgumentsIn: [fileModel.fileName!,fileModel.fileDate!,fileModel.skuCode!,fileModel.skuName!,fileModel.onhandQty!,fileModel.countQty!,fileModel.varianceQty!,fileModel.barcode!]){
            print("插入CSVFileTable失败");
        }
        return true;
    }
    /**
    更新表数据
    
    - parameter fileModel: 数据模型
    */

    func updateFileData(_ fileModel:FileDataModel){
        
        let sql = "update CSVFileTable set FileName = ?,SKUName = ?,OnhandQty = ? , CountQty = ? , FileDate = ? , VarianceQty = ? ,Barcode = ? where SKUCode = ?";
       // print("\(fileModel.fileName)--\(fileModel.skuName)--\(fileModel.onhandQty)--\(fileModel.countQty)--\(fileModel.fileDate)--\(fileModel.varianceQty)--\(fileModel.skuCode)");
        if !_dataBase.executeUpdate(sql, withArgumentsIn: [fileModel.fileName!,fileModel.skuName!,fileModel.onhandQty!,fileModel.countQty!,fileModel.fileDate!,fileModel.varianceQty!,fileModel.barcode!,fileModel.skuCode!]){
            print("更新CSVFileTable失败");
        }
    }
    
    /**
    该SKUCode是否存在
    
    - parameter sku:
    
    - returns: true：存在 false：不存在
    */
    
    func isfileDataExists(_ sku:String!)->Bool{
        
        let sql = "select * from CSVFileTable where SKUCode = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sql, withArgumentsIn:[sku]);
        if resultSet.next(){
            return true;
        }
        return false;
    }
    
    /**
    查询所有文件的日期
    
    - returns: 文件日期
    */
    
    func allFileDates()->NSMutableArray{
        let dataArray:NSMutableArray = NSMutableArray();
        let sql = "select FileDate from CSVFileTable";
        let resultSet:FMResultSet = _dataBase.executeQuery(sql, withArgumentsIn: nil);
        while resultSet.next(){
            let str:NSString = resultSet.object(forColumnName: "FileDate") as! NSString;
            if !dataArray.contains(str){
                dataArray.add(str);
            }
        }
        return dataArray;
    }
    
    /**
    查询对应日期的记录
    
    - parameter filedate: 日期
    
    - returns: 所有记录的数组
    */
    
    func recodesWithDate(_ filedate:NSString)->NSMutableArray{
        
        let  array:NSMutableArray = NSMutableArray()
        let sql = "select * from CSVFileTable where FileDate = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sql, withArgumentsIn:[filedate as String!]);
        while resultSet.next(){
            let fileDataModel:FileDataModel = FileDataModel();
            fileDataModel.fileDate = resultSet.object(forColumnName: "FileDate") as? NSString;
            fileDataModel.fileName = resultSet.object(forColumnName: "FileName") as? NSString;
            fileDataModel.onhandQty = resultSet.object(forColumnName: "OnhandQty") as? NSString;
            fileDataModel.countQty = resultSet.object(forColumnName: "CountQty") as? NSString;
            fileDataModel.skuCode = resultSet.object(forColumnName: "SKUCode") as? NSString;
            fileDataModel.skuName = resultSet.object(forColumnName: "SKUName") as? NSString;
            fileDataModel.varianceQty = resultSet.object(forColumnName: "VarianceQty") as? NSString;
            fileDataModel.barcode = resultSet.object(forColumnName: "Barcode") as?NSString;
            array.add(fileDataModel);
        }
        return array;
    }
    
    func recodeWithBarcode(_ barcode:String)->FileDataModel{
        let fileDataModel : FileDataModel = FileDataModel();
        let sqlStr = "select * from CSVFileTable where Barcode = ?";
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [barcode]);
        while resultSet.next(){
            fileDataModel.fileDate = resultSet.object(forColumnName: "FileDate") as? NSString;
            fileDataModel.fileName = resultSet.object(forColumnName: "FileName") as? NSString;
            fileDataModel.onhandQty = resultSet.object(forColumnName: "OnhandQty") as? NSString;
            fileDataModel.countQty = resultSet.object(forColumnName: "CountQty") as? NSString;
            fileDataModel.skuCode = resultSet.object(forColumnName: "SKUCode") as? NSString;
            fileDataModel.skuName = resultSet.object(forColumnName: "SKUName") as? NSString;
            fileDataModel.varianceQty = resultSet.object(forColumnName: "VarianceQty") as? NSString;
            fileDataModel.barcode = resultSet.object(forColumnName: "Barcode") as?NSString;
        }
        return fileDataModel;
    }
    
    /**
    查询文件中的所有记录
    
    - parameter fileName: 文件名
    
    - returns: 所有记录的数组
    */
    
    func contentWithFileName(_ fileName:NSString)->NSMutableArray{
        let contentArray:NSMutableArray = NSMutableArray();
        
        let sqlStr = "select * from CSVFileTable where FileName = ?";
        
        let resultSet:FMResultSet = _dataBase.executeQuery(sqlStr, withArgumentsIn: [fileName as String!]);
        while resultSet.next(){
            let fileModel:FileDataModel = FileDataModel();
            fileModel.fileName = fileName;
            fileModel.skuCode = resultSet.object(forColumnName: "SKUCode") as? NSString;
            fileModel.skuName = resultSet.object(forColumnName: "SKUName") as? NSString;
            fileModel.onhandQty = resultSet.object(forColumnName: "OnhandQty") as? NSString;
            fileModel.countQty = resultSet.object(forColumnName: "CountQty") as? NSString;
            fileModel.varianceQty = resultSet.object(forColumnName: "VarianceQty") as? NSString;
            fileModel.barcode = resultSet.object(forColumnName: "Barcode") as? NSString;
            contentArray.add(fileModel);
        }
        return contentArray;
    }
    
    /**
    存储盘点记录
    
    - parameter countArray: 盘点的数组
    */
    
    func updateCountQty(_ countArray:NSMutableArray){
        for item in countArray{
            let fileItem = item as! FileDataModel;
            let sqlStr = "update CSVFileTable set CountQty = ? , FileDate = ? where SKUCode = ?";
            if !_dataBase.executeUpdate(sqlStr, withArgumentsIn:[fileItem.countQty!,fileItem.fileDate!,fileItem.skuCode!]){
                print("更新\(fileItem.skuCode)失败");
            }
        }
    }
    
    
    /**
    更新记录
    
    - parameter fileModel: FiledataModel模型
    */
    
    func updateFileContentWithModel(_ fileModel:FileDataModel){
        
        let sql = "update CSVFileTable set CountQty = ? , FileDate = ? , VarianceQty = ? where SKUCode = ?";
        if !_dataBase.executeUpdate(sql, withArgumentsIn: [fileModel.countQty!,fileModel.fileDate!,fileModel.varianceQty!,fileModel.skuCode!]){
            print("更新VarianceQty失败");
        }
    }
    
    
    /**
    删除历史记录
    
    - parameter date: 截止日期
    
    - returns: true 删除成功  false 删除失败
    */
    
    func deleteRecodeWithDate(_ date:NSString)->Bool{
        
        let sql = "delete from CSVFileTable where FileDate = ? ";
        if !_dataBase.executeUpdate(sql, withArgumentsIn: [date]){
            print("删除\(date)失败");
            return false;
        }
        return true;
    }
    
//    func createAlertView(title:String,message:String?) {
//        var alertView:              UIAlertView!;
//        
//        alertView = UIAlertView(title: title, message: message!, delegate: nil, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok");
//        alertView.show();
//       
//    }
    
}
