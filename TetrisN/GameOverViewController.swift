//
//  GameOver.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

import UIKit

protocol GameOverDelegate
{
    func didSelectRestartOption()
    func showMenu()
}

class GameOverViewController: UIViewController
{
    var gameOverDelegate:GameOverDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let layout = GameOverViewLayout(view: view)
        layout.restartButton.addTarget(self, action: #selector(didPressRestartButton), for: .touchUpInside)
        layout.menuButton.addTarget(self, action: #selector(didPressMenuButton), for: .touchUpInside)
        
    }
    
    func didPressRestartButton()
    {
        gameOverDelegate?.didSelectRestartOption()
    }
    
    func didPressMenuButton()
    {
        gameOverDelegate?.showMenu()
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
}

