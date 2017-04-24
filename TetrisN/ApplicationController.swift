import Foundation
import UIKit


class ApplicationController:GameDelegate, MenuDelegate, GameOverViewControllerDelegate, LogoutDelegate, UserInfoDelegate
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
        if userBase.readCurrentUserName() == nil {
            showLogInView()
        } else {
           currentName = userBase.readCurrentUserName()
           showMenu()
        }
//        showLogInView()
        
    }
    
    func didSelectRestartOption() {
        newGame()
    }
    
    func didGameOver(){
        //userBase.sendUserScore(name:currentName!, score:latestScore)
       
        sendGameOverScreen()
    }
    
    @objc func newGame() {
        navigationViewController.popViewController(animated: false)
        let gameViewController = GameViewController(1/numbersOfColums, columns, rows)
        let game = Game(renderDelegate: gameViewController, applicationControllerObject: self, rows: self.rows, columns: self.columns, interval: interval )
        gameViewController.gameDelegate = game
        navigationViewController.setViewControllers([gameViewController as UIViewController], animated: true)
    }
    
    func showLogInView() {
        let logInView = LogInViewController()
        navigationViewController.setViewControllers([logInView as UIViewController], animated: true)
        logInView.LogInDelegate = userBase
        logInView.menuDelegate = self
    }
    
    func showMenu() {
        let menuView = MenuViewController()
        menuView.currentName = currentName
        menuView.menuDelegate = self
        navigationViewController.setViewControllers([menuView as UIViewController], animated: true)
        
        
        
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
    func showScoreView() {
        let scoreViewConroller =  ScoreViewConroller(userBase, self)
        navigationViewController.pushViewController(scoreViewConroller, animated: true)
    }
    
   func showInfoView(currentUser:User) {
    var itIsCurrentName = false
    if currentUser.name == currentName {
        itIsCurrentName = true
    }
     let infoView = InfoViewConroller(currentUser, self, itIsCurrentName)
    navigationViewController.pushViewController(infoView, animated: true)
    }
    
}

