import Foundation
import UIKit


class ApplicationController:GameDelegate, MenuDelegate, GameOverDelegate, LogoutDelegate, UserInfoDelegate, UserVerificationDelegate
{
    
    var interval = 0.5 //change timer interval there, if you wish it
    private(set) var numbersOfColums:CGFloat = 10 //You can change size here
    let navigationViewController:UINavigationController
    private(set) var columns:Int
    private(set) var rows:Int
    let userStorage = UserStorage()
    var currentName:String?
    var latestScore:Int = 0
    
    init(navigationViewController:UINavigationController)
    {
        
        self.navigationViewController = navigationViewController
        self.columns = Int(numbersOfColums)
        self.rows = Int ((UIScreen.main.bounds.height) / (UIScreen.main.bounds.width * 1/numbersOfColums))
        //newGame()
        if userStorage.readCurrentUserName() == nil {
            showLogInView()
        } else {
            currentName = userStorage.readCurrentUserName()
            showMenu()
        }
        //showLogInView()
        
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
        let gamePlayController = GamePlayController(renderDelegate: gameViewController, applicationControllerObject: self, rows: self.rows, columns: self.columns, interval: interval )
        gameViewController.gameDelegate = gamePlayController
        navigationViewController.setViewControllers([gameViewController as UIViewController], animated: true)
    }
    
    func showLogInView() {
        let logInView = LogInViewController()
        navigationViewController.setViewControllers([logInView as UIViewController], animated: true)
        logInView.userVerificationDelegate = self
        
    }
    
    func showMenu() {
        let menuView = MenuViewController()
        menuView.currentName = currentName
        menuView.menuDelegate = self
        navigationViewController.setViewControllers([menuView as UIViewController], animated: true)
        
    }
    
    func sendGameOverScreen() {
        navigationViewController.popViewController(animated: false)
        let gameOverViewController = GameOverViewController()
        gameOverViewController.gameOverDelegate = self
       
        navigationViewController.popViewController(animated: false)
        
        navigationViewController.pushViewController(gameOverViewController, animated: false)
        navigationViewController.setViewControllers([gameOverViewController], animated: false)
    }
    func showScoreView() {
        let scoreViewController =  ScoreViewController(userStorage, self)
        navigationViewController.pushViewController(scoreViewController, animated: true)
    }
    
    func showInfoView(currentUser:User) {
        var itIsCurrentName = false
        if currentUser.name == currentName {
            itIsCurrentName = true
        }
        let infoView = InfoViewController(currentUser, self, itIsCurrentName)
        navigationViewController.pushViewController(infoView, animated: true)
    }
    
    func userVerificate (userName:String, userPass:String, showWarningLabeldDeledate:ShowWarningLabelDelegate) {
        var status = false
        let alreadyExists = self.userStorage.alreadyExistNameCheck(name: userName)
            
            if alreadyExists {
                let verificationComplete = self.userStorage.userVerification(name: userName, password: userPass)
                if verificationComplete {
                    status = true
                }
            } else {
                self.userStorage.addNewUser(name: userName, password: userPass)
                status = true
                self.currentName = userName
                self.showMenu()
            }
        
        if status{
            self.userStorage.saveCurrentUserName(name: userName)
        } else {
            
        }
        
    }
    
    
    
}

