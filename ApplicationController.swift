import Foundation
import UIKit
class ApplicationController:protocolGameOver{
    var gameOverScreen:GameOverViewController!
    let navigationViewController:UINavigationController
    var gameViewController:UIViewController!
    var game: Game!

    
    
    
    init(navigationViewController:UINavigationController){
        
        self.navigationViewController=navigationViewController
        newGame()
        
    }
    
    @objc func newGame() {
        self.gameViewController = GameViewController()
        self.game=Game(gameViewController: gameViewController as! GameDraw, applicationControllerObject: self)
        
        if let controller = gameViewController as? GameViewController {
            controller.gameDelegate=game
        }
        
       
        navigationViewController.pushViewController(gameViewController, animated: false)
        
    }
    
    func sendGameOverScreen() {
        
        self.gameOverScreen=nil
        self.game=nil
        
        self.gameViewController=nil
        self.gameOverScreen=GameOverViewController(applicationControllerObject: self)
        
        navigationViewController.popViewController(animated: false)
        
        navigationViewController.pushViewController(gameOverScreen, animated: false)
        
        
    }
}

