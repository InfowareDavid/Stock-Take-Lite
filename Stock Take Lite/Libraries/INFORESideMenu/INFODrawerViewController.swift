//
//  TableViewController.swift
//  Stock Take Little
//
//  Created by infoware on 28/9/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

let reusedID = "resuleID";
var      previousRow:       NSInteger! = 100;


class INFODrawerViewController: UITableViewController ,INFODrawerControllerChild,INFODrawerControllerPressenting{
    
    weak var drawer:            INFOViewController?;
    var      nameArray:         NSArray!;
   // var      previousRow:       NSInteger! = 100;
    
    init(){
        
        super.init(style: UITableViewStyle.Plain);
        self.tableView.registerClass(INFOTableViewCell.classForCoder(), forCellReuseIdentifier: reusedID);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if ENTERPRISE_VERSION
            nameArray = [localString("lMainMenu"),localString("limport"),localString("lEntry"),localString("lEnquiry"),localString("lExport"),localString("lRemove"),localString("lBluetooth"),localString("mCamera"),localString("mEmail")];
        #else
            
            nameArray = [localString("lMainMenu"),localString("limport"),localString("lEntry"),localString("lEnquiry"),localString("lExport"),localString("lRemove"),localString("lBluetooth"),localString("mEmail")];
            
        #endif
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count;
    }

   override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if DEVICE == .Phone{
        return 64
    }
    return 108;
    }
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reusedID, forIndexPath: indexPath) as? INFOTableViewCell;
        
        cell?.infocellTextLabel.text = self.nameArray[indexPath.row] as? String;

        return cell!
    }
    
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if DEVICE == .Phone{
        return 50/1024.0 * SCREENHEIGHT
    }
        return 50;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("\(indexPath.row) -------- \(previousRow)");
        if indexPath.row == previousRow{
            self.drawer?.close();
        }else{
            #if ENTERPRISE_VERSION
            switch indexPath.row {
            case 0:
                let mainVC = MainViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
              
            case 1:
                let quantityVC = QuantityImportViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(quantityVC);
            case 2:
                
                let entryVC = CountingEntryViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(entryVC);
            case 3:
                let enquiryVC = CountingEnquiryViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(enquiryVC);

            case 4:
                
                let exportVC = QuantityExportViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(exportVC);
            case 5:
                
                let removalVC = RecordsRemovalViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(removalVC);
            case 6:
                
                let blutoothVC = BluetoothScannerViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(blutoothVC);
            case 7:
                
                let cameraVC = CameraScanViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(cameraVC);
            default :
                
                let emailVC = AttachmentViewController();
                self.drawer?.repleaceCenterViewControllerWithViewController(emailVC);
            }
            #else
                switch indexPath.row {
                case 0:
                    let mainVC = MainViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
                    
                case 1:
                    let quantityVC = QuantityImportViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(quantityVC);
                case 2:
                    
                    let entryVC = CountingEntryViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(entryVC);
                case 3:
                    let enquiryVC = CountingEnquiryViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(enquiryVC);
                    
                case 4:
                    
                    let exportVC = QuantityExportViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(exportVC);
                case 5:
                    
                    let removalVC = RecordsRemovalViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(removalVC);
                case 6:
                    
                    let blutoothVC = BluetoothScannerViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(blutoothVC);
                default :
                    
                    
                    let emailVC = AttachmentViewController();
                    self.drawer?.repleaceCenterViewControllerWithViewController(emailVC);
                }

            #endif
            
            // Reload the current center view controller and update its background color
//            typeof(self) __weak weakSelf = self;
//            [self.drawer reloadCenterViewControllerUsingBlock:^(){
//                NSParameterAssert(weakSelf.colors);
//                weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
//                }];
            //self.drawer?.close();
//            self.drawer?.reloadCenterViewControllerUsingBlock({ () -> Void in
//              //  self.drawer?.centerViewController.view.backgroundColor = self.colors[indexPath.row] as? UIColor;
//            })
            
//            let center = HGWViewController();
//            center.view.backgroundColor = UIColor.magentaColor();
//            self.drawer?.repleaceCenterViewControllerWithViewController(center);
            
            
        }
        previousRow = indexPath.row;
        
    }
    
    

    func drawerControllerDidClose(drawerController: INFOViewController) {
        self.view.userInteractionEnabled = true;

    }
    
    func drawerControllerWillClose(drawerController: INFOViewController) {
        self.view.userInteractionEnabled = false;

    }
    func drawerControllerDidOpen(drawerController: INFOViewController) {
        self.view.userInteractionEnabled = true;

    }
    func drawerControllerWillOpen(drawerController: INFOViewController) {
        self.view.userInteractionEnabled = false;

    }
/******************************************************/
    
    func localString(aString:String)->String{
        return NSLocalizedString(aString, comment: "");
    }

}
