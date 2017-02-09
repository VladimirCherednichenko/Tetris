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
    
    var viewObject:GameDrow
    var gameObject:GameProtocol
    init(viewObject:GameDrow, gameObject:GameProtocol ){
        
        self.viewObject=viewObject
        self.gameObject=gameObject
        swipe()
    }
    
    func swipe(){
        let swipeRight = UISwipeGestureRecognizer(target: gameObject, action: #selector(Game.moveElementRight))
        swipeRight.direction = .right
        viewObject.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: gameObject, action: #selector(Game.moveElementLeft))
        swipeLeft.direction = .left
        viewObject.view.addGestureRecognizer(swipeLeft)
        let swipeDown = UISwipeGestureRecognizer(target: gameObject, action: #selector(Game.moveElementDownTouch))
        swipeDown.direction = .down
        viewObject.view.addGestureRecognizer(swipeDown)
        
        let tap = UITapGestureRecognizer(target: gameObject, action: #selector(Game.rotateElement))
        
        viewObject.view.addGestureRecognizer(tap)
    }
    
}
