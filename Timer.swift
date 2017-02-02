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
    var timer:Int=0
    
    var gameObject:GameProtocol
    init(gameObject:GameProtocol){
        
        
        
        self.gameObject=gameObject
        Tick()}
    
 

    

    func Tick() {
        
       _=Timer.scheduledTimer(timeInterval: 0.5, target: gameObject, selector: #selector(Game.moveElementDown), userInfo: nil, repeats: true)
}
    }
