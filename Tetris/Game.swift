

import UIKit


class Game:GameProtocol{
    
    var gameViewController:GameDraw?
    var provider = Provider()
    var figure:Figure
    private var timer = Timer()
    var points:Int = 0
    var applicationControllerObject:AppControllerProtocol?
    var objectOfMatrix:Matrix<UIImage>
    private var rows:Int
    private var columns:Int
    private var figureIsOnBottom = false
    private var figureIsInTouch = false
    private var gameOverIsHere = false
    var maxXRepeat = false
    var minXrepeat = false
    init(gameViewController:GameDraw?, applicationControllerObject:AppControllerProtocol?, rows:Int, columns:Int)
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
                    self.gameViewController?.fillThePixel(x: column, y: row, blockImage: self.objectOfMatrix[row,column]!)
                }
            }
        }
    }
    
    func removeOvercrowdedLines()
    {
        for row in 0...rows - 1
        {   var counter = 0
            for column in 0...columns - 1
            {
                if self.objectOfMatrix[row,column] != nil
                {
                    counter = counter + 1
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
            for column in 0...columns - 1
            {
                self.objectOfMatrix[row,column]  =  self.objectOfMatrix[row - 1,column]
                
            }
        }
        points = points + 1
    }
    
    
    
    
    
    @objc func moveElementDown() {
        self.gameViewController?.clearView()
        figureIsOnBottom = isFigureTouchedsomething(figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        //touchCheck(figure: self.figure,objectOfMatrix: self.objectOfMatrix)
        
        for point in figure.offsetOfPoiIts{
            if self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] == nil {
                self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] = point.pointColour
            } else {
                gameOverIsHere=true
            }
        }
        renewTheView()
        if gameOverIsHere{
            timer.invalidate()
            applicationControllerObject?.sendGameOverScreen()
        }
        if figureIsOnBottom {
            figure = provider.getFigure()
            figureIsOnBottom = false
            figureIsInTouch = false
            maxXRepeat = false
            minXrepeat = false
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
    {   let outOfMatrix = figureIsOutsideOfMatrixcCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        let alreadyExist = alreadyExistCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        if !alreadyExist && !outOfMatrix
        {
            figure.moveFigureRight()
            self.renewTheView()
        }
    }
    @objc func didSwipeLeft()
    {   let outOfMatrix = figureIsOutsideOfMatrixcCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        let alreadyExist = alreadyExistCheking(x: -1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        if !alreadyExist && !outOfMatrix
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
        let canRotate = canRotateFigure(figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        if canRotate {
            figure.rotateRight()
        }
    }
}


