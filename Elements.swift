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
        self.figures = [{ let figure=Figure1(); return figure}, { let figure=Figure2(); return figure}, { let figure=Figure3(); return figure},{ let figure=Figure4(); return figure},{ let figure=Figure5(); return figure}]
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
    var offsetOfPoiIts:[Point] = []
    
  
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








//new code



class Figure1:Figure{
    var figureWasRotated=false
    var startOffsetOfPoiIts:[Point] = []
    
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0),Point(x:0, y:0),Point(x:1, y:0),Point(x:2, y:0)]
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
class Figure2:Figure{
    
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:0),Point(x:0, y:0),Point(x:1, y:0),Point(x:0, y:1)]}
}

class Figure3:Figure{
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:-1,y:-1),Point(x:0, y:-1),Point(x:0, y:0),Point(x:0, y:1)]}
}
class Figure4:Figure{
    override init() {
        super.init()
        self.offsetOfPoiIts = [Point(x:0,y:0),Point(x:1, y:0),Point(x:0, y:1),Point(x:1, y:1)]
        
    }
    override func rotate() {}
}
class Figure5:Figure{
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















