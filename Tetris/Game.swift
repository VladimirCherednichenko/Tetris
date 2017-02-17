

import UIKit


class Game:GameProtocol{
    
    private var gameViewController:GameDraw
    private var provider = Provider()
    private var figure:Figure
    private var timer = Timer()
    var points:Int = 0
    private var applicationControllerObject:AppControllerProtocol
    //new values
    var objectOfMatrix:Matrix<UIImage>
    private var rows:Int
    private var columns:Int
    private var figureIsOnBottom = false
    private var figureIsInTouch = false
    private var gameOverIsHere = false
    
    init(gameViewController:GameDraw,applicationControllerObject:AppControllerProtocol, rows:Int, columns:Int)
    {
        
        
        self.applicationControllerObject = applicationControllerObject
        self.gameViewController = gameViewController
        self.figure = provider.getFigure()
        
        self.rows = rows
        self.columns = columns
        self.objectOfMatrix = Matrix<UIImage>(rows: rows, columns: columns)
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveElementDown), userInfo: nil, repeats: true)
    }
    
    
    
    func renewTheView()
    {
        for row in 0...rows
        {
            for column in 0...columns
            {
                
                if self.objectOfMatrix[row,column] != nil
                {
                    self.gameViewController.fillThePixel(x: column, y: row, blockImage: self.objectOfMatrix[row,column]!)
                }
            }
        }
    }
    
    func removeOvercrowdedLines()
    {
        for row in 0...rows-1
        {   var counter = 0
            for column in 0...columns-1
            {
                if self.objectOfMatrix[row,column] != nil
                {
                    counter = counter+1
                    if counter == 10
                    {
                        self.removeLine(lineNumber: row)
                    }
                } else {
                    counter  =  0
                }
            }
        }
        
        
    }
    
    func removeLine(lineNumber startRow:Int)
    {
        for row in (0...startRow).reversed()
        {
            for column in 0...columns-1
            {
                self.objectOfMatrix[row,column]  =  self.objectOfMatrix[row-1,column]
                
            }
        }
        points = points+1
    }
    
    
    @objc func moveElementDown() {
        self.gameViewController.clearView()
        
        let maxY = figure.getMaxY()
        
        for point in figure.offsetOfPoiIts{
            
            if self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] == nil
            {
                
                self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] = point.pointColour
            } else {
                for column in 0...columns-1
                {
                    if self.objectOfMatrix[0,column] != nil
                    {
                        self.gameOverIsHere = true
                    }
                }
            }
            //figure is on a flour?
            if point.y + figure.startPoint.y >= rows-1
            {
                self.figureIsOnBottom = true
                
            }
            
            
            if point.y == maxY
            {
                if self.objectOfMatrix[point.y + figure.startPoint.y + 1,point.x + figure.startPoint.x] != nil
                {
                    self.figureIsInTouch = true
                    
                }
            }
        }
        
        for point in figure.offsetOfPoiIts{
            if point.y == maxY
            {
                if self.objectOfMatrix[point.y + figure.startPoint.y + 1,point.x + figure.startPoint.x] != nil
                {
                    self.figureIsInTouch = true
                    
                }
            }
        }
        
        if gameOverIsHere
        {
            timer.invalidate()
            
            applicationControllerObject.sendGameOverScreen()
        }
        renewTheView()
        if figureIsOnBottom || figureIsInTouch
        {
            figure = provider.getFigure()
            figureIsOnBottom = false
            figureIsInTouch = false
        } else {
            
            for element in figure.offsetOfPoiIts
            {
                self.objectOfMatrix[element.y + figure.startPoint.y,element.x + figure.startPoint.x] = nil
            }
        }
        
        removeOvercrowdedLines()
        figure.moveFigureDown()
    }
    
    
    @objc func didSwipeRight()
    {
        
        if figure.getMaxX() + figure.startPoint.x < columns-1
        {
            figure.moveFigureRight()
            self.renewTheView()
        }
    }
    @objc func didSwipeLeft()
    {
        if figure.getMinX() + figure.startPoint.x > 0
        {
            figure.moveFigureLeft()
            self.renewTheView()
            
        }
    }
    @objc func didSwipeDown()
    {
        moveElementDown()
    }
    
    @objc func rotateElement()
    {
        figure.rotate()
    }
}


