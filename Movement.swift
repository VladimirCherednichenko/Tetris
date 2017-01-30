//
//  Movement.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class Movement:MovementProtocol{
    var gameObject:GameProtocol
    var y:Int=10
    var stopY:Bool=false
    var cleanTime:Int=0
    var element=Element()
    var currentElementIndex:[Int]!
    
    var savedElementsIndex:[Int]=[]
    
    init(gameObject:GameProtocol){
        self.gameObject=gameObject}
    
    @objc func moveElementDown() {
        
        var currentElementWithMove:[Int]=[]
        var maxIndexOfCurrentElement:Int=0
        currentElementIndex=element.indexOfCurrent
        
        for element in currentElementIndex{
            let elementIllAdd:Int
            elementIllAdd=element+y
            currentElementWithMove.append(elementIllAdd)}
            maxIndexOfCurrentElement=searchMaxNummberInArray(Array: currentElementWithMove)
        
        gameObject.clearView()
        if !stopY {gameObject.fillCollor(currentElementWithMove+savedElementsIndex)}
        
        
        
        for indexOfSaved in savedElementsIndex{
            for indexOfCurrent in currentElementWithMove{
            if (indexOfCurrent+10)==indexOfSaved {savedElementsIndex=savedElementsIndex+currentElementWithMove
                y=0
                if indexOfCurrent < 20 {savedElementsIndex=[]
                //stopY=true
                }
                element.changeElement()}
        }}
        
            if maxIndexOfCurrentElement>=170 {
            savedElementsIndex=savedElementsIndex+currentElementWithMove
            y=0
           element.changeElement()
            }
        if savedElementsIndex==[] {} else {
            savedElementsIndex=removeDuplicate(savedElementsIndex)
        savedElementsIndex=removeLine(savedElementsIndex)
        }
        
        
        
        if !stopY {y=y+10}
        
        
    }
    
    
    
    @objc func moveElementRight(){
        
        
        
        var currentElementWithMove:[Int]=[]
        var bufer:Int
        currentElementIndex=element.indexOfCurrent
        bufer=(maxInTens(currentElementIndex)+y) % 10
       
        if bufer<9 {y=y+1}
        for element in currentElementIndex{
            let elementIllAdd:Int
            elementIllAdd=element+y
            currentElementWithMove.append(elementIllAdd)}
        
        
        gameObject.clearView()
        if !stopY {gameObject.fillCollor(currentElementWithMove+savedElementsIndex)}
    
    
    }
    @objc func moveElementLeft(){
        
        var currentElementWithMove:[Int]=[]
        var bufer:Int
        currentElementIndex=element.indexOfCurrent
        bufer=(minInTens(currentElementIndex)+y)%10
        
        
        if bufer>=1 {y=y-1}
        for element in currentElementIndex{
            let elementIllAdd:Int
            elementIllAdd=element+y
            currentElementWithMove.append(elementIllAdd)}
        
        
        gameObject.clearView()
        if !stopY {gameObject.fillCollor(currentElementWithMove+savedElementsIndex)}
    
    
    }
    @objc func moveElementDownTouch(){
        
    moveElementDown()
        
        
        
    }
    
    
    
    @objc func rotateElement(){
        
        var currentElementWithMove:[Int]=[]
        var maxIndexOfCurrentElement:Int=0
        var stopTap=false
        
        currentElementIndex=element.indexOfCurrent
        
        for element in currentElementIndex{
            let elementIllAdd:Int
            elementIllAdd=element+y
            currentElementWithMove.append(elementIllAdd)}
        maxIndexOfCurrentElement=searchMaxNummberInArray(Array: currentElementWithMove)
        
        
        
        
        for indexOfCurrent in currentElementWithMove{
            if indexOfCurrent>149{stopTap=true}
            for indexOfSaved in savedElementsIndex{
                if (indexOfCurrent+10)==indexOfSaved {savedElementsIndex=savedElementsIndex+currentElementWithMove
                    y=0; stopTap=true
                    if indexOfCurrent < 20 {savedElementsIndex=[]
                        
                    }
                    element.changeElement()}
            }}
        
        if !stopTap {element.rotate()}
        gameObject.clearView()
        gameObject.fillCollor(currentElementWithMove+savedElementsIndex)
        
        if maxIndexOfCurrentElement>=170 {
            savedElementsIndex=savedElementsIndex+currentElementWithMove
            y=0
            element.changeElement()
        }
        if savedElementsIndex==[] {} else {
            savedElementsIndex=removeDuplicate(savedElementsIndex)
            savedElementsIndex=removeLine(savedElementsIndex)
        }
        
        
        
        //y=y+10
        
        
    }
}


