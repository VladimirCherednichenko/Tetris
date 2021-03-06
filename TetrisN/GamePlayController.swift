

import UIKit

protocol GameDraw
{
    var points:Int{get set}
    func fillThePixel(x:Int,y:Int, blockImage:UIImage?)
    func clearThePixel(x:Int,y:Int)
    func clearView()
    var view: UIView! {get}
    func updatePoints(_ points:Int)
}

@objc protocol GameDelegate
{
    var latestScore:Int{get set}
    func didGameOver()
}

class GamePlayController
{
    // TODO: add reasonable comments to code, so it would be easy to read
    
    var interval:Double //change timer interval there, if you wish it
    var renderDelegate:GameDraw?=nil
    var figureProvider = FigureProvider()
    var figure:Figure
    private var timer = Timer()
    var points:Int = 0 {
        didSet {
            self.renderDelegate?.updatePoints(self.points)
        }
    }
    var gameDelegate:GameDelegate?
    var objectOfMatrix:Matrix<UIImage>?
    private var rows:Int
    private var columns:Int
    private var figureIsOnBottom = false
    private var figureIsInTouch = false
    private var gameOverIsHere = false
    var maxXRepeat = false
    var minXrepeat = false
    
    init(renderDelegate:GameDraw?, applicationControllerObject:GameDelegate?, rows:Int, columns:Int, interval:Double)
    {
        
        
        self.gameDelegate = applicationControllerObject
        self.renderDelegate = renderDelegate
        //chosing the first figure
        self.figure = figureProvider.getFigure()
        self.interval = interval
        self.rows = rows
        self.columns = columns
        self.objectOfMatrix = Matrix<UIImage>(rows: rows, columns: columns)
        //setting up the timer
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(moveElementDown), userInfo: nil, repeats: true)
    }
    
    
    
    func render()
    {
        //drawing the pixels
        for row in 0...rows {
            for column in 0...columns {
                self.renderDelegate?.fillThePixel(x: column, y: row, blockImage: self.objectOfMatrix?[row,column])
            }
        }
        
        for point in figure.offsetOfPoiIts {
            self.renderDelegate?.fillThePixel(x: point.x + figure.startPoint.x, y: point.y + figure.startPoint.y, blockImage: point.pointColour)
        }
    }
    func removeCurrentFigureOnMatrix()
    {   //removing old figure from array of points
        for element in figure.offsetOfPoiIts {
            self.objectOfMatrix?[element.y + figure.startPoint.y,element.x + figure.startPoint.x] = nil
        }
    }
    
    func pushCurrentFigureOnMatrix()
    {   //pushing new figure in matrix
        for point in figure.offsetOfPoiIts {
            self.objectOfMatrix?[point.y + figure.startPoint.y,point.x + figure.startPoint.x] = point.pointColour
        }
    }
    @objc func moveElementDown()
    {
        //this function check wether figure touch something (figure or floor) or not
        figureIsOnBottom = isFigureTouchedsomething(figure:self.figure, objectOfMatrix:self.objectOfMatrix!)
        for point in figure.offsetOfPoiIts {
            if self.objectOfMatrix?[point.y + figure.startPoint.y,point.x + figure.startPoint.x] != nil {
                gameOverIsHere=true
            }
        }
        
        // after check we should draw all filled points
        self.render()
        // pushing the game over if this is the end
        if gameOverIsHere {
            
            didGameOver()
            
        }
        //this function start to work when figure touch something
        if figureIsOnBottom {
            self.pushCurrentFigureOnMatrix()
            figure = figureProvider.getFigure()
            figureIsOnBottom = false
            figureIsInTouch = false
            maxXRepeat = false
            minXrepeat = false
            
        }
        
        let numberOfFilledLine:Int?
        //calculating how many lines are fillled
        numberOfFilledLine = objectOfMatrix?.filledRowCheck()
        objectOfMatrix?.removeLine(lineNumber: numberOfFilledLine)
        if numberOfFilledLine != nil {
            self.points = points + 1
        }
        figure.moveFigureDown()
    }
    
    
    
    @objc func didSwipeRight()
    {   //moving figure to right side and checking whether it out of display or not
        let outOfMatrix = figureIsOutsideOfMatrixcCheking(figure:self.figure, objectOfMatrix:self.objectOfMatrix!){
            figure in
            figure.moveFigureRight()
        }
        let alreadyExist = alreadyExistCheking(x: +1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix!)
        
        if !alreadyExist && !outOfMatrix {
            figure.moveFigureRight()
            self.render()
        }
    }
    @objc func didSwipeLeft()
    {
        //moving figure to left side and checking whether it out of display or not
        let outOfMatrix = figureIsOutsideOfMatrixcCheking(figure:self.figure, objectOfMatrix:self.objectOfMatrix!) {
            figure in
            figure.moveFigureLeft()
        }
        let alreadyExist = alreadyExistCheking(x: -1, y: 0, figure:self.figure, objectOfMatrix:self.objectOfMatrix!)
        
        if !alreadyExist && !outOfMatrix {
            figure.moveFigureLeft()
            self.render()
        }
    }
    @objc func didSwipeDown()
    {
        moveElementDown()
    }
    
    @objc func rotateElement()
    {   // checking ability of rotation and then rotate the figure
        let canRotate = canRotateFigure(figure:self.figure, objectOfMatrix:self.objectOfMatrix!)
        if canRotate {
            figure.rotateRight()
        }
    }
    
    func didGameOver()
    {
        //prepering for game over 
        timer.invalidate()
        gameDelegate?.latestScore = self.points
        print(points)
        gameDelegate?.didGameOver()
    }
    
}


