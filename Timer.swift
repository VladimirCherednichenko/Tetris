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
    var gameObjectForMovement:GameProtocol
    var moveObject:MovementProtocol
    init(gameObjectForMovement:GameProtocol,moveObject:MovementProtocol){
        
        
        self.gameObjectForMovement=gameObjectForMovement
        self.moveObject=moveObject
        Tick()}
    
 

    

    func Tick() {
        
       _=Timer.scheduledTimer(timeInterval: 0.5, target: moveObject, selector: #selector(Movement.moveElementDown), userInfo: nil, repeats: true)
}
    }
