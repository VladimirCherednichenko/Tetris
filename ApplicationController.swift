import Foundation
import UIKit


class ApplicationController:GameDelegate, MenuDelegate, GameOverViewControllerDelegate
{
    
    var interval = 0.5 //change timer interval there, if you wish it
    private(set) var numbersOfColums:CGFloat = 10 //You can change size here
    let navigationViewController:UINavigationController
    private(set) var columns:Int
    private(set) var rows:Int
    let userBase = UserBase()
    var currentName:String?
    var latestScore:Int = 0
    init(navigationViewController:UINavigationController)
    {
        
        self.navigationViewController = navigationViewController
        self.columns = Int(numbersOfColums)
        self.rows = Int ((UIScreen.main.bounds.height) / (UIScreen.main.bounds.width * 1/numbersOfColums))
        //newGame()
        
        showLogInView()
        
        //showMenu()
        
    }
    
    func didSelectRestartOption() {
        newGame()
    }
    
    func didGameOver(){
        userBase.sendUserScore(name:currentName!, score:latestScore)
        sendGameOverScreen()
    }
    
    @objc func newGame() {
        navigationViewController.popViewController(animated: false)
        let gameViewController = GameViewController(1/numbersOfColums, columns, rows)
        let game = Game(renderDelegate: gameViewController, applicationControllerObject: self, rows: self.rows, columns: self.columns, interval: interval )
        gameViewController.gameDelegate = game
        navigationViewController.setViewControllers([gameViewController as UIViewController], animated: false)
    }
    
    func showLogInView() {
        let logInView = LogInViewController()
        navigationViewController.setViewControllers([logInView as UIViewController], animated: false)
        logInView.userBaseDelegate = userBase
        logInView.menuDelegate = self
    }
    
    func showMenu() {
        let menuView = MenuViewController()
        menuView.currentName = currentName
        menuView.menuDelegate = self
        navigationViewController.setViewControllers([menuView as UIViewController], animated: false)
        
        
       // logInView.userBaseDelegate = userBase
    }
    
    func sendGameOverScreen() {
        navigationViewController.popViewController(animated: false)
        let gameOverViewConroller = GameOverViewController()
        gameOverViewConroller.applicationControllerDelegate = self
        gameOverViewConroller.menuDelegate = self
        navigationViewController.popViewController(animated: false)
        
        navigationViewController.pushViewController(gameOverViewConroller, animated: false)
        navigationViewController.setViewControllers([gameOverViewConroller], animated: false)
    }
}

