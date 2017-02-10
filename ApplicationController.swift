//
//  Sender.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
class ApplicationController:protocolGameOver{
    var gameOverScreen:GameOverViewController!
    let navigationViewController:UINavigationController
    var gameViewController:UIViewController!
    var game: Game!
    var touch:Touch!
    
    
    
    init(navigationViewController:UINavigationController){
        
        self.navigationViewController=navigationViewController
        newGame()
        
    }
    
    @objc func newGame() {
        self.gameViewController = GameViewController()
        self.game=Game(gameViewController: gameViewController as! GameDraw, applicationControllerObject: self)
        
        touch=Touch(viewObject:gameViewController as! GameDraw, gameObject:game)
        navigationViewController.pushViewController(gameViewController, animated: false)
        
    }
    
    func sendGameOverScreen() {
        
        self.gameOverScreen=nil
        self.game=nil
        self.touch=nil
        self.gameViewController=nil
        self.gameOverScreen=GameOverViewController(applicationControllerObject: self)
        
        navigationViewController.popViewController(animated: false)
        
        navigationViewController.pushViewController(gameOverScreen, animated: false)
        
        
    }
}

