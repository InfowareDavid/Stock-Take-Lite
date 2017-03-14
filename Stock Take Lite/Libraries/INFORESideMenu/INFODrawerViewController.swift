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
        
        super.init(style: UITableViewStyle.plain);
        self.tableView.register(INFOTableViewCell.classForCoder(), forCellReuseIdentifier: reusedID);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count;
    }

   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if DEVICE == .phone{
        return 64
    }
    return 108;
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusedID, for: indexPath) as? INFOTableViewCell;
        
        cell?.infocellTextLabel.text = self.nameArray[(indexPath as NSIndexPath).row] as? String;

        return cell!
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if DEVICE == .phone{
        return 50/1024.0 * SCREENHEIGHT
    }
        return 50;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\((indexPath as NSIndexPath).row) -------- \(previousRow)");
        if (indexPath as NSIndexPath).row == previousRow{
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
                switch (indexPath as NSIndexPath).row {
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
        previousRow = (indexPath as NSIndexPath).row;
        
    }
    
    

    func drawerControllerDidClose(_ drawerController: INFOViewController) {
        self.view.isUserInteractionEnabled = true;

    }
    
    func drawerControllerWillClose(_ drawerController: INFOViewController) {
        self.view.isUserInteractionEnabled = false;

    }
    func drawerControllerDidOpen(_ drawerController: INFOViewController) {
        self.view.isUserInteractionEnabled = true;

    }
    func drawerControllerWillOpen(_ drawerController: INFOViewController) {
        self.view.isUserInteractionEnabled = false;

    }
/******************************************************/
    
    func localString(_ aString:String)->String{
        return NSLocalizedString(aString, comment: "");
    }

}
