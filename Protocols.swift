//
//  Protocols.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
protocol GameDraw {
    var points:Int{get set}
    var countVerticalpixels:Int{get}
    func fillThePixel(gameIndex:Int, blockImage:UIImage )
    func clearView()
    var view: UIView! {get}
}


@objc protocol AppControllerProtocol {
    func sendGameOverScreen()
    @objc func newGame()
    
}

protocol GameProtocol {
    var points:Int{get set}
    func moveElementDown()
    func moveElementRight()
    func moveElementLeft()
    
}
