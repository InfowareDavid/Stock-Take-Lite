//
//  RectView.swift
//  Stock Take Lite
//
//  Created by infoware on 14/3/17.
//  Copyright © 2017年 infoware. All rights reserved.
//

import UIKit

class RectView: UIView {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        let aPath = UIBezierPath()
        aPath.lineWidth = 5

        // 左上角 横线
        aPath.move(to: CGPoint(x:SCREENWIDTH/4.0 , y:SCREENHEIGHT/3.0))
        aPath.addLine(to:CGPoint(x:SCREENWIDTH/4.0 + 20, y:SCREENHEIGHT/3.0))
        
        //左上角 竖线
        aPath.move(to: CGPoint(x:SCREENWIDTH/4.0 , y:SCREENHEIGHT/3.0-2.5))
        aPath.addLine(to:CGPoint(x:SCREENWIDTH/4.0, y:SCREENHEIGHT/3.0 + 20))
        
        
        //右上角 横线
        aPath.move(to: CGPoint(x:3*SCREENWIDTH/4.0 , y:SCREENHEIGHT/3.0))
        aPath.addLine(to:CGPoint(x:3*SCREENWIDTH/4.0 - 20, y:SCREENHEIGHT/3.0))
       
        //右上角 竖线
        aPath.move(to: CGPoint(x:3*SCREENWIDTH/4.0 , y:SCREENHEIGHT/3.0-2.5))
        aPath.addLine(to:CGPoint(x:3*SCREENWIDTH/4.0, y:SCREENHEIGHT/3.0 + 20))
        
        // 左下角 横线
        aPath.move(to: CGPoint(x:SCREENWIDTH/4.0 , y:2*SCREENHEIGHT/3.0))
        aPath.addLine(to:CGPoint(x:SCREENWIDTH/4.0 + 20, y:2*SCREENHEIGHT/3.0))
        
        //左下角 竖线
        aPath.move(to: CGPoint(x:SCREENWIDTH/4.0 , y:2*SCREENHEIGHT/3.0+2.5))
        aPath.addLine(to:CGPoint(x:SCREENWIDTH/4.0, y:2*SCREENHEIGHT/3.0 - 20))

        //右下角 横线
        aPath.move(to: CGPoint(x:3*SCREENWIDTH/4.0 , y:2*SCREENHEIGHT/3.0))
        aPath.addLine(to:CGPoint(x:3*SCREENWIDTH/4.0 - 20, y:2*SCREENHEIGHT/3.0))
        
        //右下角 竖线
        aPath.move(to: CGPoint(x:3*SCREENWIDTH/4.0 , y:2*SCREENHEIGHT/3.0+2.5))
        aPath.addLine(to:CGPoint(x:3*SCREENWIDTH/4.0, y:2*SCREENHEIGHT/3.0 - 20))
        
        aPath.close()
        UIColor.green.set()
        aPath.stroke()
        
        
    }
    
}
