//
//  Touch.swift
//  Tetris
//
//  Created by Admin on 26.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
class Touch {
    var gameObject:GameProtocol
    var viewObject:GameDrow
    var moveObject:MovementProtocol
    init(gameObject:GameProtocol, viewObject:GameDrow, moveObject:MovementProtocol ){
    self.gameObject=gameObject
    self.viewObject=viewObject
    self.moveObject=moveObject
        swipe()
    }
    
    func swipe(){
        let swipeRight = UISwipeGestureRecognizer(target: moveObject, action: #selector(Movement.moveElementRight))
        swipeRight.direction = .right
        viewObject.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: moveObject, action: #selector(Movement.moveElementLeft))
        swipeLeft.direction = .left
        viewObject.view.addGestureRecognizer(swipeLeft)
       let swipeDown = UISwipeGestureRecognizer(target: moveObject, action: #selector(Movement.moveElementDownTouch))
        swipeDown.direction = .down
        viewObject.view.addGestureRecognizer(swipeDown)
    
        let tap = UITapGestureRecognizer(target: moveObject, action: #selector(Movement.rotateElement))
        
        viewObject.view.addGestureRecognizer(tap)
    }

}
