//
//  Protocols.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
protocol GameDrow {
    func fillThePixel(gameIndex:Int)
    func clearThePixel(gameIndex:Int)
    func clearView()
    var view: UIView! {get}
}
protocol TimerTick{
    //var time:Int{get}
    //func Tick()
    //func update()
}

protocol GameProtocol {
    var pixelIllFill:[Int]{get set}
    func fillCollor(_ fillArray: [Int])
    func clearThePixelCollor(_ cleanArray:[Int])
    func clearView()
    
}

protocol MovementProtocol {
func moveElementDown()
func moveElementRight()
func moveElementLeft()

}
