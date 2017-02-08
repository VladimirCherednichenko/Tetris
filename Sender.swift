//
//  Sender.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
class Sender:protocolGameOver{
    var gameOverScrean:GameOverViewController!
    let navigationViewController:UINavigationController
    var gameViewController = GameViewController()
    var game: Game!
    var timer:ticker!
    var touch:Touch!
    //init
    
    
    init(navigationViewController:UINavigationController){
        //
    self.navigationViewController=navigationViewController
    newGame()
     //sendGameOverScrean()
        }
    //init
    @objc func newGame() {
    self.gameViewController = GameViewController()
    
        
        self.game=Game(gameViewController: gameViewController, senderObject: self)
        timer=ticker(gameObject: game)
        touch=Touch(viewObject:gameViewController, gameObject:game)
        navigationViewController.pushViewController(gameViewController, animated: false)

    }
    
    func sendGameOverScrean() {
    //timerObject.stopTick
    self.gameOverScrean=nil
        self.game=nil
        timer.stopTick()
        self.timer=nil
        self.touch=nil
    self.gameOverScrean=GameOverViewController(senderObject: self)
    navigationViewController.popViewController(animated: false)
    navigationViewController.pushViewController(gameOverScrean, animated: false)
        
    }
}

class NewGame{
     var navigationControllerObject:UINavigationController
    
    init(navigationViewController:UINavigationController){
        self.navigationControllerObject=navigationViewController
        
        }
    
   func createNewGame(){
    
    let senderObject=Sender(navigationViewController: navigationControllerObject)}

}
