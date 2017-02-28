

import UIKit


class Game:GameProtocol{
    
    var renderDelegate:GameDraw?
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
    init(renderDelegate:GameDraw?, applicationControllerObject:AppControllerProtocol?, rows:Int, columns:Int)
    {
        
        
        self.applicationControllerObject = applicationControllerObject
        self.renderDelegate = renderDelegate
        self.figure = provider.getFigure()
        
        self.rows = rows
        self.columns = columns
        self.objectOfMatrix = Matrix<UIImage>(rows: rows, columns: columns)
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveElementDown), userInfo: nil, repeats: true)
    }
    
    
    
    func render()
    {
        
        for row in 0...rows
        {
            for column in 0...columns
            {
                
                self.renderDelegate?.fillThePixel(x: column, y: row, blockImage: self.objectOfMatrix[row,column])
            }
        }
        
        for point in figure.offsetOfPoiIts{
            self.renderDelegate?.fillThePixel(x: point.x + figure.startPoint.x, y: point.y + figure.startPoint.y, blockImage: point.pointColour)
        }
    }
  
    
    
    func removeCurrentFigureOnMatrix(){
        for element in figure.offsetOfPoiIts
        {
            self.objectOfMatrix[element.y + figure.startPoint.y,element.x + figure.startPoint.x] = nil
        }
    }
    
    func pushCurrentFigureOnMatrix(){
        for point in figure.offsetOfPoiIts{
            self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] = point.pointColour
        }
    }
    
    
    
    
    
    @objc func moveElementDown() {
        
        figureIsOnBottom = isFigureTouchedsomething(figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        
        
       for point in figure.offsetOfPoiIts{
            if self.objectOfMatrix[point.y + figure.startPoint.y,point.x + figure.startPoint.x] != nil {
              gameOverIsHere=true
            }
        }
        
        
        self.render()
        if gameOverIsHere{
            timer.invalidate()
            applicationControllerObject?.sendGameOverScreen()
        }
        if figureIsOnBottom {
            self.pushCurrentFigureOnMatrix()
            figure = provider.getFigure()
            figureIsOnBottom = false
            figureIsInTouch = false
            maxXRepeat = false
            minXrepeat = false
            
        } else {
           // self.removeCurrentFigureOnMatrix()
        }
        let numberOfFilledLine:Int?
        
        
        numberOfFilledLine = objectOfMatrix.filledRowCheck()
        objectOfMatrix.removeLine(lineNumber: numberOfFilledLine)
       
        figure.moveFigureDown()
    }
    
    
    
    @objc func didSwipeRight()
    {   let outOfMatrix = figureIsOutsideOfMatrixcCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        let alreadyExist = alreadyExistCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        if !alreadyExist && !outOfMatrix
        {
           
            
            figure.moveFigureRight()
            
            
            self.render()
        }
    }
    @objc func didSwipeLeft()
    {   let outOfMatrix = figureIsOutsideOfMatrixcCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        let alreadyExist = alreadyExistCheking(x: -1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix)
        
        if !alreadyExist && !outOfMatrix
        {
            
            figure.moveFigureLeft()
            self.render()
            
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


