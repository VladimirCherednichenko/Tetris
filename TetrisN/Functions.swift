
import Foundation
import UIKit

func alreadyExistCheking<Type>(x:Int, y:Int, figure:Figure, objectOfMatrix:Matrix<Type>)
    -> Bool {
        var status = false
        for point in figure.offsetOfPoiIts{
            if objectOfMatrix[point.y + figure.startPoint.y + y, point.x + figure.startPoint.x + x] != nil {
                status = true
            }
        }
        return status
}

func figureIsOutsideOfMatrixcCheking<Type>(figure:Figure, objectOfMatrix:Matrix<Type>, clouser:((Figure)->()))
    -> Bool
{
    var status = false
    let copiedFigure:Figure = figure.copy()
    clouser(copiedFigure)
    
    for point in copiedFigure.offsetOfPoiIts{
        
        if point.x + copiedFigure.startPoint.x > objectOfMatrix.columns-1 || point.y + copiedFigure.startPoint.y > objectOfMatrix.rows-1 || point.x + copiedFigure.startPoint.x < 0   {
            status = true
        }
        
    }
    
    
    return status
}


func isFigureTouchedsomething<Type>(figure:Figure, objectOfMatrix:Matrix<Type>)
    ->Bool
{
    var status=false
    
    let maxY = figure.getMaxY()
    let minX = figure.getMinX()
    let maxX = figure.getMaxX()
    
    
    for point in figure.offsetOfPoiIts{
        
        
        
        if point.x == minX || point.x == maxX || point.y == maxY{
            
            let checkDuplictateX=figure.duplicateX(x: point.x)
            if checkDuplictateX {
                let checkExistence=figure.verifyingExistenceOfPoint(x: point.x, y: maxY)
                
                if point.y == maxY || !checkExistence {
                    if objectOfMatrix[point.y + figure.startPoint.y+1,point.x + figure.startPoint.x] != nil {
                        status = true
                    }
                }
            } else {
                if objectOfMatrix[point.y + figure.startPoint.y+1,point.x + figure.startPoint.x] != nil {
                    status = true
                }
            }
        }
        if point.y + figure.startPoint.y>objectOfMatrix.rows-2 {
            status = true
        }
        
    }
    return status
}


func canRotateFigure<Type>(figure:Figure, objectOfMatrix:Matrix<Type>)
    ->Bool
{
    var status = true
    var copiedFigure:Figure? = figure.copy()
    copiedFigure?.rotateRight()
    
    let figureisOutsideOfMatrix = figureIsOutsideOfMatrixcCheking(figure: copiedFigure!, objectOfMatrix: objectOfMatrix) {
        figure in return figure.rotateRight()
    }
    let alreadyExist = alreadyExistCheking(x: 0, y: 0, figure: copiedFigure!, objectOfMatrix: objectOfMatrix)
    if alreadyExist || figureisOutsideOfMatrix {
        status = false
    }
    
    
    
    copiedFigure = nil
    return status
}


