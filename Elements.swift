//
//  Elements.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class Element{
    var indexOfCurrent:[Int]=[]
    var numberOfNextElement:Int=0
    var numberOfElement:Int=0
    var rotateCount:Int=0
    init(){changeElement()}
    func element1() {indexOfCurrent=[3,4,5,6]}
    func element1Rotate() {indexOfCurrent=[14,24,4,34]}
    func element2() {indexOfCurrent=[14,15,5,6]}
    func element2Rotate() {indexOfCurrent=[4,14,15,25]}
    func element3() {indexOfCurrent=[14,15,16,5]}
    func element3Rotate1() {indexOfCurrent=[5,15,16,25]}
    func element3Rotate2() {indexOfCurrent=[4,5,6,15]}
    func element3Rotate3() {indexOfCurrent=[5,14,15,25]}
    
    func element4() {indexOfCurrent=[4,5,14,15]}
    
    
    func element5() {indexOfCurrent=[4,5,15,25]}
    func element5Rotate1() {indexOfCurrent=[14,15,16,6]}
    func element5Rotate2() {indexOfCurrent=[5,15,25,26]}
    func element5Rotate3() {indexOfCurrent=[16,14,15,24]}
    func element6() {indexOfCurrent=[5,6]}
    func changeElement () {
        
        rotateCount=0
        
        switch numberOfNextElement {
        case 0:
            element1()
        case 1:
            element2()
        case 2:
            element3()
        case 3:
            element4()
        case 4:
            element5()
        
            
        default:
            break
        }
        if numberOfNextElement<4 { numberOfNextElement=numberOfNextElement+1; numberOfElement=numberOfNextElement-1 } else {numberOfNextElement=0; numberOfElement=4}
    }
    func rotate() {
        
        switch numberOfElement {
        case 0:
            if rotateCount==0 {
                element1Rotate()
                rotateCount=1}
            else {rotateCount=0; element1()}
        case 1:
            if rotateCount==0 {
                element2Rotate()
                rotateCount=1}
            else {rotateCount=0; element2()}
        case 2:
            switch rotateCount {
            case 0:
                element3Rotate1()
            case 1:
                element3Rotate2()
            case 2:
                element3Rotate3()
            case 3:
                element3()
            
                
                
            default:
                break
            }
            if rotateCount<3 {rotateCount=rotateCount+1} else {rotateCount=0}
            print(rotateCount)
            
        case 3:
            element4()
        case 4:
            switch rotateCount {
            case 0:
                element5Rotate1()
            case 1:
                element5Rotate2()
            case 2:
                element5Rotate3()
            case 3:
                element5()
                
                
                
            default:
                break
            }
            if rotateCount<3 {rotateCount=rotateCount+1} else {rotateCount=0}
            print(rotateCount)
            
            
        default:
            break
        }
    }
    
}
