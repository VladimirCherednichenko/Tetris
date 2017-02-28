import Foundation
import UIKit
class ApplicationController:AppControllerProtocol{
    var gameOverViewConroller:GameOverViewController!
    let navigationViewController:UINavigationController
    var gameViewController:GameDraw!
    var game: Game!
    var columns:Int
    var rows:Int
    
    private(set) var numbersOfColums:CGFloat = 10 //You can change size here
    
    
    
    
    init(navigationViewController:UINavigationController)
    {
        
        self.navigationViewController = navigationViewController
        
        self.columns = Int(numbersOfColums)
        self.rows = Int ((UIScreen.main.bounds.height) / (UIScreen.main.bounds.width * 1/numbersOfColums))
        newGame()
        
    }
    
    
    
    @objc func newGame() {
        self.gameViewController = GameViewController(1/numbersOfColums, columns, rows)
        
        
        self.game = Game(renderDelegate: gameViewController, applicationControllerObject: self, rows: self.rows, columns: self.columns )
        
        if let controller = gameViewController as? GameViewController {
            controller.gameDelegate = game
        }
        navigationViewController.pushViewController(gameViewController as! UIViewController, animated: false)
        
    }
    
    func sendGameOverScreen() {
        
        self.gameOverViewConroller = nil
        self.game = nil
        self.gameViewController = nil
        self.gameOverViewConroller = GameOverViewController(applicationControllerObject: self)
        navigationViewController.popViewController(animated: false)
        navigationViewController.pushViewController(gameOverViewConroller, animated: false)
        
        
    }
}

