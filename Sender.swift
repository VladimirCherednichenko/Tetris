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
    let gameOverScrean=GameOver()
    let navigationViewController:UINavigationController
    let viewController = ViewController()
    
    init(navigationViewController:UINavigationController){
    self.navigationViewController=navigationViewController
    
    let anObjectOfGame=Game(viewController: viewController, senderObject: self)
    var timer=ticker(gameObject: anObjectOfGame)
    _=Touch(viewObject:viewController, gameObject:anObjectOfGame)
        navigationViewController.pushViewController(viewController, animated: true)
        
    }
    func sendGameOverScrean() {
    //timerObject.stopTick
    navigationViewController.popViewController(animated: false)
    navigationViewController.pushViewController(gameOverScrean, animated: false)
    }
}
