//
//  SquareFigure.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class SquareFigure:Figure{
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:0,y:0,colour: #imageLiteral(resourceName: "blockYellow")),Point(x:1, y:0, colour: #imageLiteral(resourceName: "blockYellow")),Point(x:0, y:1, colour: #imageLiteral(resourceName: "blockYellow")),Point(x:1, y:1, colour: #imageLiteral(resourceName: "blockYellow"))]
        
    }
    override func rotate() {}
}
