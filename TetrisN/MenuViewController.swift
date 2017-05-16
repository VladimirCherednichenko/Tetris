//
//  MenuViewController.swift
//  Tetris
//
//  Created by pc on 07.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MenuDelegate
{
    var currentName:String?{get set}
    @objc func newGame()
    @objc func showMenu()
    @objc func leaderboardView()
}

class MenuViewController:UIViewController
{
    
    
    var currentName:String?
    var menuDelegate:MenuDelegate?
    private var layout:MenuViewLayout!
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad()
    {
        
        self.layout = MenuViewLayout(view: view)
        layout.nameLabel.text = "Hello,  " + currentName! + "!"
        
        layout.startNewGameButton.addTarget(self, action: #selector(showGame), for: .touchUpInside)
        layout.showLeaderboardButton.addTarget(self, action: #selector(showLeaderboard), for: .touchUpInside)
    }
    
    func showGame()
    {
        menuDelegate?.newGame()
    }
    
    func showLeaderboard()
    {
        menuDelegate?.leaderboardView()
    }
    
    
    
    
}
