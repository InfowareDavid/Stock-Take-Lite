//
//  BaseView.swift
//  Stock Take Lite
//
//  Created by infoware on 8/10/15.
//  Copyright © 2015年 infoware. All rights reserved.
//

import UIKit

class BaseView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func localString(aString:String)->String{
        return NSLocalizedString(aString, comment: "");
    }
    
    func colorWithString(aString:String)->UIColor{
        var aString = aString
        aString.replaceRange(aString.rangeOfString("#")!, with: "0x");
        
        let colorLong = strtoul(aString.cStringUsingEncoding(NSUTF8StringEncoding)!,
            nil, 16);
        let R = Double((colorLong & 0xFF0000)>>16);
        let G = Double((colorLong & 0x00FF00)>>8);
        let B = Double(colorLong & 0x0000FF);
        return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: 1.0);
    }
    func FONT25()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(14)
        }
        return UIFont.systemFontOfSize(25)
    }
    func FONT25WEIGHT03()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(14, weight: 0.15)
        }
        return UIFont.systemFontOfSize(25, weight: 0.3)
    }
    func FONT22()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(11)
        }
        return UIFont.systemFontOfSize(22)
    }

    func FONT20()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9)
        }
        return UIFont.systemFontOfSize(20)
    }
    
    func FONT20WEIGHT03()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9, weight: 0.15)
        }
        return UIFont.systemFontOfSize(20, weight: 0.3)
    }
    func FONT20WEIGHT02()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9, weight: 0.1)
        }
        return UIFont.systemFontOfSize(20, weight: 0.2)
    }
    func FONT15WEIGHT04()->UIFont{
        if DEVICE == .Phone{
            return UIFont.systemFontOfSize(9, weight: 0.2)
        }
        return UIFont.systemFontOfSize(15, weight: 0.4)
    }
    
}
