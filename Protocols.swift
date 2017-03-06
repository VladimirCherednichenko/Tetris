//
//  Protocols.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
protocol GameDraw
{
    var points:Int{get set}
    func fillThePixel(x:Int,y:Int, blockImage:UIImage?)
    func clearThePixel(x:Int,y:Int)
    func clearView()
    var view: UIView! {get}
    func updatePoints(_ points:Int)
}


@objc protocol GameDelegate
{
    
    func didGameOver()
}

protocol GameOverViewControllerDelegate
{
    
    func didSelectRestartOption()
    
}

protocol GameProtocol
{
    var points:Int{get set}
    func didSwipeDown()
    func didSwipeRight()
    func didSwipeLeft()
    
}
