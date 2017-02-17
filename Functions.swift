//
//  Functions.swift
//  Tetris
//
//  Created by Admin on 30.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//
import UIKit
import Foundation
func minInTens(_ Array:[Int])
    ->Int
{
    var min:Int=2000
    for element in Array
    {
        if element % 10 < min {min = element % 10}
    }
    return min
}

func maxInTens(_ Array:[Int])
    ->Int
{
    var max:Int=0
    for element in Array
    {
        if element % 10 > max {
            max = element % 10
        }
    }
    return max
}

func searchMaxNummberInArray(Array:[Int])
    ->Int
{
    var max=0
    for element in Array
    {
        if element>max
        {
            max = element
        }
    }
    return max
}





