//
//  File.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//
import UIKit
import Foundation
class Figure
{
    
    var startPoint = Point(x:4,y:-2, colour: #imageLiteral(resourceName: "pixelDark"))
    var offsetOfPoiIts:[Point] = []
    
    func getPointsWithStartPoint()
        ->[Point]{
            let pointsWithStartPoint = self.offsetOfPoiIts.map {
                return Point(x:$0.x+startPoint.x, y:$0.y+startPoint.y, colour: $0.pointColour)
            }
            return pointsWithStartPoint
    }
    func rotateRight()
    {
        self.offsetOfPoiIts = offsetOfPoiIts.map{
            return Point(x: -$0.y, y: $0.x, colour: $0.pointColour)
        }
    }
    
    func rotateLeft()
    {
        self.offsetOfPoiIts = offsetOfPoiIts.map{
            return Point(x: $0.y, y: -$0.x, colour: $0.pointColour)
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
        ->Int
    {
        var max:Int=0
        for element in offsetOfPoiIts
        {
            if element.y>max{max = element.y}
        }
        return max
    }
    
    
    
    func getIndexOfMinY()
        ->Int
    {
        var min:Int=50
        for element in offsetOfPoiIts
        {
            if element.y<min{min = element.y}
        }
        return min+startPoint.y
    }
    
    
    
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
    
    func duplicateX(x:Int)
        ->Bool
    {
        var duplicate = false
        var foundFirstTime = true
        for elemnt in offsetOfPoiIts{
            
            if elemnt.x == x {
                if foundFirstTime {
                    
                    foundFirstTime = false
                } else {
                    duplicate = true
                }
            }
        }
        return duplicate
    }
    
    func verifyingExistenceOfPoint(x:Int,y:Int)
        ->Bool
    {
        var status=false
        for point in offsetOfPoiIts{
            if point.x==x && point.y==y {
                status=true
            }
        }
        return status
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
    func copy()
        ->Figure
    {
        let figure = Figure()
        figure.startPoint = self.startPoint
        figure.offsetOfPoiIts = self.offsetOfPoiIts
        return figure
    }
}
