//
//  Z_Figure.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class Z_Figure:Figure{
    var figureWasRotated=false
    var startOffsetOfPoiIts:[Point] = []
    
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0),Point(x:0, y:0),Point(x:0, y:-1),Point(x:1, y:-1)]
        self.startOffsetOfPoiIts=offsetOfPoiIts
    }
    
    override func rotate(){
        if !figureWasRotated {
            
            self.offsetOfPoiIts = offsetOfPoiIts.map {return Point(x: -$0.y, y: $0.x)}
            figureWasRotated=true
            
        } else {
            self.offsetOfPoiIts = startOffsetOfPoiIts
            figureWasRotated=false
        }
    }
}
