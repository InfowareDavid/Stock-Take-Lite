//
//  HelpViewController.swift
//  Stock Take Lite
//
//  Created by infoware on 13/11/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class HelpViewController: BaseViewController {
    
    var             helpView:               HelpView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRow = 99;
        self.view.backgroundColor = UIColor.whiteColor();
        helpView = HelpView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT));
        self.view.addSubview(helpView);
        self.addButtonAction();
    }
    
    func addButtonAction(){
        
        self.helpView.backButton.addTarget(self, action: #selector(HelpViewController.backButtonAction), forControlEvents: UIControlEvents.TouchUpInside);
        
    }
    
    func backButtonAction(){
        
        let mainVC = MainViewController();
        self.drawer?.repleaceCenterViewControllerWithViewController(mainVC);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
