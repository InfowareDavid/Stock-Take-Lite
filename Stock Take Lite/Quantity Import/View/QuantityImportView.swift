//
//  QuantityImportView.swift
//  Stock Take Lite
//
//  Created by infoware on 9/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityImportView: QuantityImportBaseView {
    var     middleView:                             UIView!;
    var     ftpServerLabel:                         UILabel!;
    var     ftpServerTextLabel:                     UILabel!;
    var     ftpUserLabel:                           UILabel!;
    var     ftpUserTextLabel:                       UILabel!;
    var     promptView:                             UIView!;
    var     promptLabel:                            UILabel!;
    var     promptFileNameAndTimeView:              UIView!;
    var     promptFileNameLabel:                    UILabel!;
    var     promptFileTimeLabel:                    UILabel!;
    var     promptLineLabel:                        UILabel!;
    var     tableView:                              UITableView!;
    var     okButton:                               UIButton!;
    var     returnButton:                           UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        middleView = UIView();
        middleView.backgroundColor = self.colorWithString("#FFFB94");
        self.addSubview(middleView);
        
        ftpServerLabel = UILabel();
        ftpServerLabel.text = localString("FTPServer");
        ftpServerLabel.textColor = self.colorWithString("#6D6E71");
        ftpServerLabel.font = FONT25()
        self.middleView.addSubview(ftpServerLabel);
        
        ftpServerTextLabel = UILabel();
        ftpServerTextLabel.text = "129.129.0.88";
        ftpServerTextLabel.textColor = self.colorWithString("#6D6E71");
        ftpServerTextLabel.font = FONT25()
        self.middleView.addSubview(ftpServerTextLabel);
        
        ftpUserLabel = UILabel();
        ftpUserLabel.text = localString("FTPUser");
        ftpUserLabel.textColor = self.colorWithString("#6D6E71");
        ftpUserLabel.font = FONT25()
        self.middleView.addSubview(ftpUserLabel);
        
        ftpUserTextLabel = UILabel();
        ftpUserTextLabel.text = "Jhonny_shaow_321";
        ftpUserTextLabel.textColor = self.colorWithString("#6D6E71");
        ftpUserTextLabel.font = FONT25()
        self.middleView.addSubview(ftpUserTextLabel);
        
        promptView = UIView();
        promptView.backgroundColor = self.colorWithString("#CBEAF1");
        self.addSubview(promptView);
        
        promptLabel = UILabel();
        promptLabel.text = localString("chooseFile");
        promptLabel.textColor = self.colorWithString("#2A9CAB");
    //    promptLabel.font = UIFont.systemFontOfSize(25, weight: 0.3);
        self.promptView.addSubview(promptLabel);
        
        promptFileNameAndTimeView = UIView();
        self.addSubview(promptFileNameAndTimeView);
        
        promptFileNameLabel = UILabel();
        promptFileNameLabel.text = localString("fileName");
        promptFileNameLabel.textColor = self.colorWithString("#2A9CAB");
       // promptFileNameLabel.font = UIFont.systemFontOfSize(23, weight: 0.3);
        self.promptFileNameAndTimeView.addSubview(promptFileNameLabel);
        
        promptFileTimeLabel = UILabel();
        promptFileTimeLabel.text = localString("dataAndTime");
        promptFileTimeLabel.textColor = self.colorWithString("#2A9CAB");
       // promptFileTimeLabel.font = UIFont.systemFontOfSize(23, weight: 0.3);
        self.promptFileNameAndTimeView.addSubview(promptFileTimeLabel);
        
        promptLineLabel = UILabel();
        promptLineLabel.backgroundColor = self.colorWithString("#2A9CAB");
        self.addSubview(promptLineLabel);
        
        tableView = UITableView();
        tableView.separatorColor = self.colorWithString("#2A9CAB");
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.addSubview(tableView);
        
        okButton = UIButton(type: UIButtonType.System);
        okButton.setTitle(localString("ok"), forState: UIControlState.Normal);
        okButton.titleLabel?.font = FONT25()
        okButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        self.addSubview(okButton);
        
        returnButton = UIButton(type: UIButtonType.System);
        returnButton.setTitle(localString("return"), forState: UIControlState.Normal);
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), forState: UIControlState.Normal);
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), forState: UIControlState.Normal);
        self.addSubview(returnButton);
        
        if DEVICE == .Phone{
            promptLabel.font = UIFont.systemFontOfSize(11, weight: 0.15);
            promptFileNameLabel.font = UIFont.systemFontOfSize(10, weight: 0.15);
            promptFileTimeLabel.font = UIFont.systemFontOfSize(10, weight: 0.15);

            addPhoneImportConstrain()
        }else{
            
            promptLabel.font = UIFont.systemFontOfSize(25, weight: 0.3);
            promptFileNameLabel.font = UIFont.systemFontOfSize(23, weight: 0.3);
            promptFileTimeLabel.font = UIFont.systemFontOfSize(23, weight: 0.3);

            addImportConstrain()
        }
    }
    
    func addPhoneImportConstrain(){
        middleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.bottomLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(SCREENHEIGHT * 0.14);
        }
        
        ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.middleView.mas_top).offset(10)
            make.left.equalTo(self.middleView.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(26);
            
        }
        ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_top);
            make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(10);
            make.width.equalTo(SCREENWIDTH/5.0 * 3);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        
        ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.ftpServerLabel.mas_left);
            make.width.equalTo(self.ftpServerLabel.mas_width);
            make.height.equalTo(self.ftpServerLabel.mas_height);
            
        }
        ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.ftpUserLabel.mas_top);
            make.left.equalTo(self.ftpServerTextLabel.mas_left);
            make.width.equalTo(self.ftpServerTextLabel.mas_width);
            make.height.equalTo(self.ftpServerTextLabel.mas_height);
            
        }
        
        promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.middleView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        
        promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_top)
            make.left.equalTo(self.promptView.mas_left).with.offset(SCREENWIDTH/10.0);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(30);
            
        }
        
        promptFileNameAndTimeView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(25);
        }
        
        promptFileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptView.mas_bottom);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        promptFileTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            make.top.equalTo(self.promptFileNameLabel.mas_top);
            make.left.equalTo(self.promptFileNameLabel.mas_right).with.offset(SCREENWIDTH/5);
            make.width.equalTo(SCREENWIDTH/5.0);
            make.height.equalTo(25);
        }
        
        promptLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptFileNameAndTimeView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(1);
        }
        
        tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.promptLineLabel.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 8);
            
        }
        
        okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.tableView.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
            
            make.top.equalTo(self.okButton.mas_top);
            make.left.equalTo(self.okButton.mas_right).with.offset(SCREENWIDTH/5);
            make.width.equalTo(self.okButton.mas_width);
            make.height.equalTo(self.okButton.mas_height);
            
        }
    }
    
        func addImportConstrain(){
            middleView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.bottomLineLabel.mas_bottom);
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(140.5);
            }
            
            ftpServerLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.middleView.mas_top).with.offset(25);
                make.left.equalTo(self.middleView.mas_left).with.offset(111);
                make.width.equalTo(130);
                make.height.equalTo(40);
                
            }
            ftpServerTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.ftpServerLabel.mas_top);
                make.left.equalTo(self.ftpServerLabel.mas_right).with.offset(40);
                make.width.equalTo(300);
                make.height.equalTo(self.ftpServerLabel.mas_height);
                
            }
            
            ftpUserLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.ftpServerLabel.mas_bottom).with.offset(10);
                make.left.equalTo(self.ftpServerLabel.mas_left);
                make.width.equalTo(self.ftpServerLabel.mas_width);
                make.height.equalTo(self.ftpServerLabel.mas_height);
                
            }
            ftpUserTextLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.ftpUserLabel.mas_top);
                make.left.equalTo(self.ftpServerTextLabel.mas_left);
                make.width.equalTo(self.ftpServerTextLabel.mas_width);
                make.height.equalTo(self.ftpServerTextLabel.mas_height);
                
            }
            
            promptView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.middleView.mas_bottom);
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(63);
                
            }
            
            promptLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.promptView.mas_top).with.offset(15);
                make.left.equalTo(self.promptView.mas_left).with.offset(111);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(30);
                
            }
            
            promptFileNameAndTimeView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.promptView.mas_bottom);
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(50);
            }
            
            promptFileNameLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.promptView.mas_bottom);
                make.left.equalTo(self.mas_left).with.offset(111);
                make.width.equalTo(150);
                make.height.equalTo(50);
                
            }
            
            promptFileTimeLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.top.equalTo(self.promptFileNameLabel.mas_top);
                make.left.equalTo(self.promptFileNameLabel.mas_right).with.offset(150);
                make.width.equalTo(120);
                make.height.equalTo(49);
            }
            
            promptLineLabel.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.promptFileNameAndTimeView.mas_bottom);
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(1);
            }
            
            tableView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.promptLineLabel.mas_bottom);
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.height.equalTo(500);
                
            }
            
            okButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.tableView.mas_bottom).with.offset(35);
                make.left.equalTo(self.mas_left).with.offset(111);
                make.width.equalTo(112);
                make.height.equalTo(32);
                
            }
            
            returnButton.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                
                make.top.equalTo(self.okButton.mas_top);
                make.left.equalTo(self.okButton.mas_right).with.offset(160);
                make.width.equalTo(self.okButton.mas_width);
                make.height.equalTo(self.okButton.mas_height);
                
            }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
