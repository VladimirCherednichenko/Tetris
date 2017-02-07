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
    var gameOverScrean:GameOver!
    let navigationViewController:UINavigationController
    var viewController = ViewController()
    var game: Game!
    var timer:ticker!
    var touch:Touch!
    //init
    
    
    init(navigationViewController:UINavigationController){
        //
    self.navigationViewController=navigationViewController
    newGame()
        }
    //init
    @objc func newGame() {
    self.viewController = ViewController()
    game=nil
    timer=nil
    touch=nil
        
        self.game=Game(viewController: viewController, senderObject: self)
        timer=ticker(gameObject: game)
        touch=Touch(viewObject:viewController, gameObject:game)
        navigationViewController.pushViewController(viewController, animated: false)

    }
    
    func sendGameOverScrean() {
    //timerObject.stopTick
    gameOverScrean=nil
    self.gameOverScrean=GameOver(senderObject: self)
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
