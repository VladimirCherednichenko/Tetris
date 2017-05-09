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
    var gameOverDelegate:GameOverDelegate?
    
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
        
        
        
        
        gameOverLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(view.snp.top).offset(170)
            make.centerX.equalTo(view.snp.centerX)
        }
        let restartButton = UIButton()
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(restartButton)
        
        
        
        restartButton.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(gameOverLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        restartButton.setTitle("Restart", for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        restartButton.addTarget(self, action: #selector(didPressRestartButton), for: .touchUpInside)
        
        
        let menuButton = UIButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(menuButton)
        
        
        
        menuButton.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(restartButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        menuButton.setTitle("Menu", for: .normal)
        menuButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        menuButton.addTarget(self, action: #selector(didPressMenuButton), for: .touchUpInside)
        
    }
    
    func didPressRestartButton() {
        gameOverDelegate?.didSelectRestartOption()
    }
    
    func didPressMenuButton() {
        gameOverDelegate?.showMenu()
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    deinit {
       
    }
}

