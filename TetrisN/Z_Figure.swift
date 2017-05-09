//
//  Z_Figure.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class Z_Figure:Figure
{
    var figureWasRotated = false
    var startOffsetOfPoiIts:[Point] = []
    
    override init()
    {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0,colour: #imageLiteral(resourceName: "blockGreen")),Point(x:0, y:0,colour: #imageLiteral(resourceName: "blockGreen")),Point(x:0, y:-1,colour: #imageLiteral(resourceName: "blockGreen")),Point(x:1, y:-1,colour: #imageLiteral(resourceName: "blockGreen"))]
        self.startOffsetOfPoiIts = offsetOfPoiIts
    }
    
    override func rotateRight(){
        if !figureWasRotated
        {
            self.offsetOfPoiIts = offsetOfPoiIts.map {return Point(x: -$0.y, y: $0.x,colour: $0.pointColour)}
            figureWasRotated = true
            
        } else {
            self.offsetOfPoiIts = startOffsetOfPoiIts
            figureWasRotated = false
        }
    }
}
