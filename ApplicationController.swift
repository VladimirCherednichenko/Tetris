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
    var gameOverScrean:GameOverViewController!
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
        self.game=Game(gameViewController: gameViewController as! GameDrow, applicationControllerObject: self)
        
        touch=Touch(viewObject:gameViewController as! GameDrow, gameObject:game)
        navigationViewController.pushViewController(gameViewController, animated: false)
        
    }
    
    func sendGameOverScreen() {
        
        self.gameOverScrean=nil
        self.game=nil
        self.touch=nil
        self.gameViewController=nil
        self.gameOverScrean=GameOverViewController(applicationControllerObject: self)
        
        navigationViewController.popViewController(animated: false)
        
        navigationViewController.pushViewController(gameOverScrean, animated: false)
        
        
    }
}

