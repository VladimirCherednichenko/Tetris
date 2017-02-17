import Foundation
import UIKit
class ApplicationController:AppControllerProtocol{
    var gameOverScreen:GameOverViewController!
    let navigationViewController:UINavigationController
    var gameViewController:UIViewController!
    var game: Game!
    var columns:Int
    var rows:Int
    
    private(set) var valueOfDivision:CGFloat=0.1 //You can change size here
    
    
    
    
    init(navigationViewController:UINavigationController){
        
        self.navigationViewController=navigationViewController
        
        self.columns = Int(1/valueOfDivision)
        self.rows = Int ((UIScreen.main.bounds.height) / (UIScreen.main.bounds.width*valueOfDivision))
       // print(rows,columns)
       
        newGame()
        
    }
    
    
    
    @objc func newGame() {
        self.gameViewController = GameViewController(valueOfDivision, columns, rows)
        
        
        self.game=Game(gameViewController: gameViewController as! GameDraw, applicationControllerObject: self, rows: self.rows, columns: self.columns )
        
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

