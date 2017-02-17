//
//  File.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//
import UIKit
import Foundation
class Figure {
    
    private(set) var startPoint = Point(x:4,y:0, colour: #imageLiteral(resourceName: "pixelDark"))
    var offsetOfPoiIts:[Point] = []
    
    
    func rotate()
    {
        self.offsetOfPoiIts = offsetOfPoiIts.map{
            return Point(x: -$0.y, y: $0.x, colour: $0.pointColour)
        }
    }
    
    func moveFigureDown()
    {
        self.startPoint.y = self.startPoint.y + 1
    }
    
    func moveFigureUp()
    {
        self.startPoint.y = self.startPoint.y + 1
    }
    
    func moveFigureRight()
    {
        self.startPoint.x = self.startPoint.x + 1
    }
    
    func moveFigureLeft()
    {
        self.startPoint.x = self.startPoint.x - 1
    }
    
    
    func getMaxY()
        ->Int{
            var max:Int=0
            for element in offsetOfPoiIts
            {
                if element.y>max{max = element.y}
            }
            return max}
    
    
    
    func getIndexOfMinY()
        ->Int
    {
        var min:Int=50
        for element in offsetOfPoiIts
        {
            if element.y<min{min = element.y}
        }
        return min+startPoint.y}
    
    
    
    func getMaxX()
        ->Int
    {
        var max:Int = 0
        for element in offsetOfPoiIts
        {
            if element.x>max{max = element.x
            }
        }
        return max
    }
    
    
    
    func getMinX()
        ->Int
    {
        var min:Int = 50
        for element in offsetOfPoiIts
        {
            if element.x<min{min = element.x
            }
        }
        return min
    }
    
}
