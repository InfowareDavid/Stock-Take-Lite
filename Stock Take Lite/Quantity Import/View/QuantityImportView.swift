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
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.addSubview(tableView);
        
        okButton = UIButton(type: UIButtonType.system);
        okButton.setTitle(localString("ok"), for: UIControlState());
        okButton.titleLabel?.font = FONT25()
        okButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        okButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        self.addSubview(okButton);
        
        returnButton = UIButton(type: UIButtonType.system);
        returnButton.setTitle(localString("return"), for: UIControlState());
        returnButton.setBackgroundImage(UIImage(named: "buttom_1"), for: UIControlState());
        returnButton.titleLabel?.font = FONT25()
        returnButton.setTitleColor(self.colorWithString("#007B83"), for: UIControlState());
        self.addSubview(returnButton);
        
        if DEVICE == .phone{
            promptLabel.font = UIFont.systemFont(ofSize: 11, weight: 0.15);
            promptFileNameLabel.font = UIFont.systemFont(ofSize: 10, weight: 0.15);
            promptFileTimeLabel.font = UIFont.systemFont(ofSize: 10, weight: 0.15);

            addPhoneImportConstrain()
        }else{
            
            promptLabel.font = UIFont.systemFont(ofSize: 25, weight: 0.3);
            promptFileNameLabel.font = UIFont.systemFont(ofSize: 23, weight: 0.3);
            promptFileTimeLabel.font = UIFont.systemFont(ofSize: 23, weight: 0.3);

            addImportConstrain()
        }
    }
    
    func addPhoneImportConstrain(){
        middleView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bottomLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(SCREENHEIGHT * 0.14);
        }
        
        ftpServerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.middleView.snp.top).offset(10)
            make.left.equalTo(self.middleView.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/10 * 3);
            make.height.equalTo(26);
            
        }
        ftpServerTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.top);
            make.left.equalTo(self.ftpServerLabel.snp.right).offset(10);
            make.width.equalTo(SCREENWIDTH/5.0 * 3);
            make.height.equalTo(self.ftpServerLabel.snp.height);
            
        }
        
        ftpUserLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(5);
            make.left.equalTo(self.ftpServerLabel.snp.left);
            make.width.equalTo(self.ftpServerLabel.snp.width);
            make.height.equalTo(self.ftpServerLabel.snp.height);
            
        }
        ftpUserTextLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.ftpUserLabel.snp.top);
            make.left.equalTo(self.ftpServerTextLabel.snp.left);
            make.width.equalTo(self.ftpServerTextLabel.snp.width);
            make.height.equalTo(self.ftpServerTextLabel.snp.height);
            
        }
        
        promptView.snp.makeConstraints { (make) in
            make.top.equalTo(self.middleView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }
        
        promptLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.top)
            make.left.equalTo(self.promptView.snp.left).offset(SCREENWIDTH/10.0);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(30);
            
        }
        
        promptFileNameAndTimeView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(25);
        }
        
        promptFileNameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptView.snp.bottom);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        promptFileTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.promptFileNameLabel.snp.top);
            make.left.equalTo(self.promptFileNameLabel.snp.right).offset(SCREENWIDTH/5);
            make.width.equalTo(SCREENWIDTH/5.0);
            make.height.equalTo(25);
        }
        
        promptLineLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptFileNameAndTimeView.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(1);
        }
        
        tableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.promptLineLabel.snp.bottom);
            make.left.equalTo(self.snp.left);
            make.right.equalTo(self.snp.right);
            make.height.equalTo(50/1024.0 * SCREENHEIGHT * 8);
            
        }
        
        okButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.tableView.snp.bottom).offset(10);
            make.left.equalTo(self.snp.left).offset(SCREENWIDTH/10);
            make.width.equalTo(SCREENWIDTH/5);
            make.height.equalTo(25);
            
        }
        
        returnButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.okButton.snp.top);
            make.left.equalTo(self.okButton.snp.right).offset(SCREENWIDTH/5);
            make.width.equalTo(self.okButton.snp.width);
            make.height.equalTo(self.okButton.snp.height);
            
        }
    }
    
        func addImportConstrain(){
            middleView.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.bottomLineLabel.snp.bottom);
                make.left.equalTo(self.snp.left);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(140.5);
            }
            
            ftpServerLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.middleView.snp.top).offset(25);
                make.left.equalTo(self.middleView.snp.left).offset(111);
                make.width.equalTo(130);
                make.height.equalTo(40);
                
            }
            ftpServerTextLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.ftpServerLabel.snp.top);
                make.left.equalTo(self.ftpServerLabel.snp.right).offset(40);
                make.width.equalTo(300);
                make.height.equalTo(self.ftpServerLabel.snp.height);
                
            }
            
            ftpUserLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.ftpServerLabel.snp.bottom).offset(10);
                make.left.equalTo(self.ftpServerLabel.snp.left);
                make.width.equalTo(self.ftpServerLabel.snp.width);
                make.height.equalTo(self.ftpServerLabel.snp.height);
                
            }
            ftpUserTextLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.ftpUserLabel.snp.top);
                make.left.equalTo(self.ftpServerTextLabel.snp.left);
                make.width.equalTo(self.ftpServerTextLabel.snp.width);
                make.height.equalTo(self.ftpServerTextLabel.snp.height);
                
            }
            
            promptView.snp.makeConstraints { (make) in
                make.top.equalTo(self.middleView.snp.bottom);
                make.left.equalTo(self.snp.left);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(63);
                
            }
            
            promptLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.promptView.snp.top).offset(15);
                make.left.equalTo(self.promptView.snp.left).offset(111);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(30);
                
            }
            
            promptFileNameAndTimeView.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.promptView.snp.bottom);
                make.left.equalTo(self.snp.left);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(50);
            }
            
            promptFileNameLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.promptView.snp.bottom);
                make.left.equalTo(self.snp.left).offset(111);
                make.width.equalTo(150);
                make.height.equalTo(50);
                
            }
            
            promptFileTimeLabel.snp.makeConstraints { (make) in
                make.top.equalTo(self.promptFileNameLabel.snp.top);
                make.left.equalTo(self.promptFileNameLabel.snp.right).offset(150);
                make.width.equalTo(120);
                make.height.equalTo(49);
            }
            
            promptLineLabel.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.promptFileNameAndTimeView.snp.bottom);
                make.left.equalTo(self.snp.left);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(1);
            }
            
            tableView.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.promptLineLabel.snp.bottom);
                make.left.equalTo(self.snp.left);
                make.right.equalTo(self.snp.right);
                make.height.equalTo(500);
                
            }
            
            okButton.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.tableView.snp.bottom).offset(35);
                make.left.equalTo(self.snp.left).offset(111);
                make.width.equalTo(112);
                make.height.equalTo(32);
                
            }
            
            returnButton.snp.makeConstraints { (make) in
                
                make.top.equalTo(self.okButton.snp.top);
                make.left.equalTo(self.okButton.snp.right).offset(160);
                make.width.equalTo(self.okButton.snp.width);
                make.height.equalTo(self.okButton.snp.height);
                
            }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
