//
//  Protocols.swift
//  Tetris
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit




protocol GameDraw
{
    var points:Int{get set}
    func fillThePixel(x:Int,y:Int, blockImage:UIImage?)
    func clearThePixel(x:Int,y:Int)
    func clearView()
    var view: UIView! {get}
    func updatePoints(_ points:Int)
}


@objc protocol GameDelegate
{
    var latestScore:Int{get set}
    func didGameOver()
}

@objc protocol MenuDelegate
{
    var currentName:String?{get set}
    @objc func newGame()
    @objc func showMenu()
    @objc func showScoreView()
    
    
}
protocol LeaderBoardDelegate
{
    func setNewRecord(name:String, score:Int)
        ->Bool
    func getUsers()
        -> [User]?
    
}




protocol GameProtocol
{
    
    var points:Int{get set}
    func didSwipeDown()
    func didSwipeRight()
    func didSwipeLeft()
    
}

protocol UserStorageDelegate{
    func saveCurrentUserName(name:String)
    func addNewUser(name:String,password:String)
    func alreadyExistNameCheck(name:String)
        -> Bool
    func userVerification(name:String, password:String)
        -> Bool
    
}

protocol UserInfoDelegate{
    func showInfoView(currentUser:User)
}

protocol LogoutDelegate {
    func showLogInView()
}

protocol UserVerificationDelegate
{
    func userVerificate (userName:String, userPass:String, showWarningLabeldDeledate:ShowWarningLabelDelegate)
}

protocol GameOverDelegate {
    func didSelectRestartOption()
    func showMenu()
}

protocol ShowWarningLabelDelegate {
    func showWarningLabel()
}

