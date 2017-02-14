//
//  File.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class T_Figure:Figure{
    
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0, colour: #imageLiteral(resourceName: "block_pink")),Point(x:0, y:0, colour: #imageLiteral(resourceName: "block_pink")),Point(x:1, y:0, colour: #imageLiteral(resourceName: "block_pink")),Point(x:0, y:1, colour: #imageLiteral(resourceName: "block_pink"))]}
}
