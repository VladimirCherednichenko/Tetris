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
    init(rows:Int, columns:Int){
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
            
            if check{
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
}
