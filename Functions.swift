//
//  Functions.swift
//  Tetris
//
//  Created by Admin on 30.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
func minInTens(_ Array:[Int])->Int{
    var min:Int=2000
    for element in Array{ if element % 10<min {min=element % 10}}
    return min
}

func maxInTens(_ Array:[Int])->Int{
    var max:Int=0
    for element in Array{ if element % 10>max {max=element % 10}}
    return max
}

func searchMaxNummberInArray(Array:[Int])->Int{
    var max=0
    for element in Array {
        if element>max {max=element}
    }
    return max
}

func removeDuplicate(_ Array:[Int])->[Int]{
    var newArray:[Int]=[]
    var sortedArray:[Int]=[]
    var count:Int=0
    sortedArray=Array.sorted(by: >)
    count=sortedArray.count
    
    for i in 0...(count-1){
        if i==(count-1) {newArray.append(sortedArray[i])
        } else {
            if sortedArray[i]==sortedArray[i+1] {
                
            }else{
                newArray.append(sortedArray[i])}}}
    return newArray
}

func removeLine(_ Array:[Int],_ gameObjectPoints:GameProtocol, numberOfPixelsInOneLine:Int)->[Int]{
    
    var gameObjectPoints = gameObjectPoints
    var inputArray=Array.sorted(by: >)
    var newArray:[Int]=inputArray
    var count:Int=0
    var countNumberTwo:Int=0
    var arrDelete:[Int]=[]
    var bufer:[Int]=[]
    var currentElement:Int
    var nextElement:Int
    count=inputArray.count
    for i in 0...(count-2)
        
    {
        currentElement=inputArray[i]/numberOfPixelsInOneLine
        nextElement=inputArray[i+1]/numberOfPixelsInOneLine
        
        if currentElement==nextElement {
            countNumberTwo=countNumberTwo+1
            if countNumberTwo==numberOfPixelsInOneLine-1 {
                for j in i-(numberOfPixelsInOneLine-2)...i+1{
                    arrDelete.append(inputArray[j])}
                if count != i+2 {
                    gameObjectPoints.points=gameObjectPoints.points+100
                    print(gameObjectPoints.points)
                    for i1 in i+2...count-1{arrDelete.append(inputArray[i1]); bufer.append(inputArray[i1]+numberOfPixelsInOneLine)}}
            }
            
            
        } else {
            countNumberTwo=0}
        
    }
    for element in arrDelete{
        newArray=newArray.filter{$0 - element != 0}
    }
    return newArray+bufer
}
