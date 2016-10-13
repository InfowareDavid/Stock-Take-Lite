//
//  QuantityExportView.swift
//  Stock Take Lite
//
//  Created by infoware on 16/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class QuantityExportView: CountingEnquiryView {

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.secondeTopLabel.text = localString("exTitle");
        self.promptLabel.text = localString("exPrompt");
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
