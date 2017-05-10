//
//  Matrix.swift
//  Tetris
//
//  Created by Admin on 15.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class Matrix<Type>
{
    let rows:Int
    let columns:Int
    var grid: [Type?]
    init(rows:Int, columns:Int)
    {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: nil, count: rows * columns)
    }
    
    func indexIsValid(row:Int, column:Int)
        -> Bool
    {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript (row:Int, column:Int)
        ->Type?
        {
        get {
            let check = indexIsValid(row: row, column: column)
            let index = self.indexOf(row, column)
            return check ? grid[index] : nil
        }
        
        set {
            let check = indexIsValid(row: row, column: column)
            let index = self.indexOf(row, column)
            
            if check {
                grid[index] = newValue
            }
        }
    }
    
    private
    func indexOf(_ row: Int, _ column: Int)
        -> Int
    {
        return row * self.columns + column
    }
    func filledRowCheck()
        -> Int?
    {   var numberOfFilledRow:Int?
        for row in 0...self.rows - 1 {
            var counter = 0
            for column in 0...self.columns - 1 {
                if self[row,column] != nil
                {
                    counter = counter + 1
                    if counter == 10
                    {
                        numberOfFilledRow=row
                        
                    }
                } else {
                    counter  =  0
                }
            }
        }
        
        return numberOfFilledRow
    }
    
    func removeLine(lineNumber startRow:Int?)
    {
        if startRow != nil {
            for row in (0...startRow!).reversed() {
                for column in 0...self.columns - 1 {
                    self[row,column]  =  self[row - 1,column]
                    
                }
            }
        }
        
    }
    
}
