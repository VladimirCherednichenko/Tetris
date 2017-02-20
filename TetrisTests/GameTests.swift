//
//  TetrisTests.swift
//  TetrisTests
//
//  Created by Admin on 17.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import XCTest

import  Foundation

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
    
    var testClass: TestClass?
    
    override func setUp() {
        super.setUp()
        if self.testClass == nil {
            self.testClass = TestClass()
        }
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //self.testClass = nil
        super.tearDown()
    }
    
    func testABAndState()
    {
        let yes = self.testClass!.IS(10, greaterThan: 5)
        XCTAssert(yes, "10 should be greater than 5")
        XCTAssert(self.testClass?.latestState == true, "Wrong latest state")
        
        let no = self.testClass!.IS(10, greaterThan: 20)
        XCTAssert(!no, "10 should be less than 20")
        XCTAssert(self.testClass?.latestState == false, "Wrong latest state")
    }
    
    func testInitialLatestState()
    {
        XCTAssert(self.testClass?.latestState == nil, "Latest state at initialisation should be nil")
    }
}
