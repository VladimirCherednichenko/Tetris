//
//  Elements.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class Provider{
    
    private var currentElementIndex = 0
    private var figures: [()->Figure]
    init()
    {
        self.figures = [Factory.element1,Factory.element2,Factory.element3,Factory.element4,Factory.element5]
    }
    
    
    func getNextFigure()
        -> Figure
    {
        self.currentElementIndex = self.currentElementIndex + 1
        if self.figures.count <= self.currentElementIndex {
            self.currentElementIndex = 0
            
        }
        
        return self.figures[self.currentElementIndex]()
    }
    
    func getFigure()
        ->Figure
    {
     return self.figures[self.currentElementIndex]()
    }
    
}

class Figure {
    
    private(set) var startPoint=Point(x:4,y:0)
    private(set) var offsetOfPoiIts:[Point] = []
    
    init(offsetPoints: [Point])
    {
        self.offsetOfPoiIts = offsetPoints
    }
    func rotate(){
        self.offsetOfPoiIts = offsetOfPoiIts.map {
            return Point(x: -$0.y, y: $0.x)
        }}
    
    func moveFigureDown(){
        self.startPoint.y = self.startPoint.y + 1 }
    
    func moveFigureRight(){
        self.startPoint.x=self.startPoint.x+1}
    
    func moveFigureLeft(){
        self.startPoint.x=self.startPoint.x-1}
    
    func getIndexForView()->[Int]{
        var figureWithMovement:[Int]=[]
        
        
        for element in self.offsetOfPoiIts{
            
            let ellementIllappend = element.x + element.y*10+startPoint.x+startPoint.y*10
            
            figureWithMovement.append(ellementIllappend)
            
            
        }
        return figureWithMovement.sorted(by: >).filter({return $0>=0})
    }
    func getIndexOfMaxY()->Int{
        var max:Int=0
        for element in offsetOfPoiIts{
            if element.y>max{max=element.y}
        }
        return max+startPoint.y}
    
    
    
    func getIndexOfMinY()->Int{
        var min:Int=50
        for element in offsetOfPoiIts{
            if element.y<min{min=element.y}
        }
        return min+startPoint.y}
    
    
    
    func getMaxX()->Int{
        var max:Int=0
        for element in offsetOfPoiIts{
            if element.x>max{max=element.x}
        }
        return max}
    
    
    
    func getMinX()->Int{
        var min:Int=50
        for element in offsetOfPoiIts{
            if element.x<min{min=element.x}
        }
        return min}
    
}


struct Point{
    var x:Int
    var y:Int
    init(x:Int,y:Int){
        self.x=x
        self.y=y
    }
}





class Factory
{
    static func element1()
        -> Figure
    {
        return Figure(offsetPoints: [Point(x:-1,y:0),Point(x:0, y:0),Point(x:1, y:0),Point(x:2, y:0)])
    }
    
    static func element2()
        -> Figure
    {
        return Figure(offsetPoints: [Point(x:-1,y:0),Point(x:0, y:0),Point(x:1, y:0),Point(x:0, y:1)])
    }
    
    static func element3()
        -> Figure
    {
        return Figure(offsetPoints: [Point(x:-1,y:-1),Point(x:0, y:-1),Point(x:0, y:0),Point(x:0, y:1)])
    }
    static func element4()
        -> Figure
    {
        return Figure(offsetPoints: [Point(x:0,y:0),Point(x:1, y:0),Point(x:0, y:1),Point(x:1, y:1)])
    }
    static func element5()
        -> Figure
    {
        return Figure(offsetPoints: [Point(x:-1,y:0),Point(x:0, y:0),Point(x:0, y:-1),Point(x:1, y:-1)])
    }
    
}






















