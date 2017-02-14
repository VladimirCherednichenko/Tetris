//
//  Point.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
struct Point{
    var x:Int
    var y:Int
    var pointColour:UIImage
    init(x:Int,y:Int,colour pointColour:UIImage){
        self.x=x
        self.y=y
        
        self.pointColour=pointColour
    }
}
