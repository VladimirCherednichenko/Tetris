//
//  Timer.swift
//  Tetris
//
//  Created by Admin on 25.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

//import Foundation
import UIKit


class ticker:TimerTick {
    var timer=Timer()
    
    var gameObject:GameProtocol
    init(gameObject:GameProtocol){
        
        self.gameObject=gameObject
        Tick()}
    
 

    

    func Tick() {
        
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: gameObject, selector: #selector(Game.moveElementDown), userInfo: nil, repeats: true)
}
    func stopTick() {
        timer.invalidate()
    }
    }
