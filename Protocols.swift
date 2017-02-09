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
    
    func Tick()
    func stopTick()
}


@objc protocol protocolGameOver {
    
    func sendGameOverScreen()
    @objc func newGame()
    
}

protocol GameProtocol {
    func moveElementDown()
    func moveElementRight()
    func moveElementLeft()
    
}
