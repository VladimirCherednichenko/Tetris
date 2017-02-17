//
//  LineFigure.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class LineFigure:Figure
{
    var figureWasRotated=false
    var startOffsetOfPoiIts:[Point] = []
    
    override init()
    {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0,colour: #imageLiteral(resourceName: "blockBlue")),Point(x:0, y:0,colour: #imageLiteral(resourceName: "blockBlue")),Point(x:1, y:0,colour: #imageLiteral(resourceName: "blockBlue")),Point(x:2, y:0, colour: #imageLiteral(resourceName: "blockBlue"))]
        self.startOffsetOfPoiIts=offsetOfPoiIts
    }
    
    override func rotate(){
        if !figureWasRotated {
            
            self.offsetOfPoiIts = offsetOfPoiIts.map {return Point(x: -$0.y, y: $0.x, colour: $0.pointColour)}
            figureWasRotated = true
            
        } else {
            self.offsetOfPoiIts = startOffsetOfPoiIts
            figureWasRotated = false
        }
    }
}
