//
//  GameOver.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

import UIKit


class GameOverViewController: UIViewController
{
    var applicationControllerDelegate:GameOverViewControllerDelegate?
    var menuDelegate:MenuDelegate?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
        let gameOverLabel = UILabel()
        gameOverLabel.text = "Game Over"
        gameOverLabel.textColor = UIColor.white
        gameOverLabel.textAlignment = .center
        gameOverLabel.font = UIFont(name: "XPED Shadow", size: 60.0   )
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameOverLabel)
        gameOverLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let restartButton = UIButton()
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(restartButton)
        restartButton.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor).isActive = true
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        restartButton.setTitle("Restart", for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        restartButton.addTarget(self, action: #selector(didPressRestartButton), for: .touchUpInside)
        
        
        let menuButton = UIButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(menuButton)
        menuButton.topAnchor.constraint(equalTo: restartButton.bottomAnchor).isActive = true
        menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuButton.setTitle("Menu", for: .normal)
        menuButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        menuButton.addTarget(self, action: #selector(didPressMenuButton), for: .touchUpInside)
        
    }
    
    func didPressRestartButton() {
        applicationControllerDelegate?.didSelectRestartOption()
    }
    
    func didPressMenuButton() {
        menuDelegate?.showMenu()
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    deinit {
        print("gameOverViewConroller is dying")
    }
}

