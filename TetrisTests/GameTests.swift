//
//  TetrisTests.swift
//  TetrisTests
//
//  Created by Admin on 17.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import XCTest

import  Foundation
import UIKit
class TestClass
{
    var latestState: Bool?
    
    func IS(_ a: Int, greaterThan b: Int)
        -> Bool
    {
        let result = (a > b)
        self.latestState = result
        return result
    }
    
}



class GameTests: XCTestCase
{
    var game = Game(gameViewController:nil, applicationControllerObject:nil, rows:10, columns:17)
    
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //self.testClass = nil
        super.tearDown()
    }
    var emptyMatrix = Matrix<Int>(rows: 17, columns: 10)
    var matrix: Matrix<Int> = {
        let m = Matrix<Int>(rows: 17, columns: 10)
        m[16,2] = 1
        m[15,2] = 1
        m[14,2] = 1
        m[13,2] = 1
        return m
    }()
    
    var matrixZ: Matrix<Int> = {
        let m = Matrix<Int>(rows: 17, columns: 10)
        m[14,2] = 1
        m[14,1] = 1
        m[13,2] = 1
        m[13,3] = 1
        return m
    } ()
    
    var figureZ:Z_Figure = {
        var returnFigure = Z_Figure()
        returnFigure.startPoint = Point(x:1,y:13, colour: #imageLiteral(resourceName: "pixelDark"))
        return returnFigure
    }()
    
    
    var figureLine:LineFigure = {
        var returnFigure = LineFigure()
        returnFigure.startPoint = Point(x:4,y:16, colour: #imageLiteral(resourceName: "pixelDark"))
        
        return returnFigure
    }()
    
    
    
    func testLineAnd_Z_Figure()
    {
        let objectTochedSomething = isFigureTouchedsomething(figure:figureZ, objectOfMatrix: matrix)
       // XCTAssert(!objectTochedSomething, "figure touched something")
        XCTAssert(objectTochedSomething, "figure is not touching something")
        
    }
    
    func test_Z_And_Z_Figure()
    {
        let objectTochedSomething = isFigureTouchedsomething(figure:figureZ, objectOfMatrix: matrixZ)
       // XCTAssert(!objectTochedSomething, "figure touched something")
        XCTAssert(objectTochedSomething, "figure is not touching something")
        
    }
    
    
    
    func testRotate(){
        let check = canRotateFigure(figure: figureLine, objectOfMatrix: emptyMatrix)
        XCTAssert(!check, "test faield")
    }
    
    func testRightBorder(){
        let check = figureIsOutsideOfMatrixcCheking(x: +6, y: 0, figure: figureLine, objectOfMatrix: emptyMatrix)
        XCTAssert(check, "test faield")
    }
    
    func testBorder(){
        figureLine.rotateRight()
        let check = figureIsOutsideOfMatrixcCheking(x: 0, y: 0, figure: figureLine, objectOfMatrix: emptyMatrix)
        XCTAssert(check, "test faield")
    }
    
    
    
    
}
