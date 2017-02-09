//
//  GameOver.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

import UIKit

class GameOverViewController: UIViewController {
    var applicationControllerObject:protocolGameOver
    
    init(applicationControllerObject:protocolGameOver){
        self.applicationControllerObject=applicationControllerObject
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
        
        let gameOverLabel=UILabel()
        gameOverLabel.text="Game Over"
        gameOverLabel.textColor=UIColor.white
        gameOverLabel.textAlignment = .center
        gameOverLabel.font=UIFont(name: "XPED Shadow", size: 60.0   )
        gameOverLabel.translatesAutoresizingMaskIntoConstraints=false
        
        
        
        
        
        
        
        view.addSubview(gameOverLabel)
        gameOverLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        let restartButton=UIButton()
        restartButton.translatesAutoresizingMaskIntoConstraints=false
        restartButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(restartButton)
        restartButton.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor).isActive=true
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        restartButton.setTitle("Restart", for: .normal)
        restartButton.titleLabel?.font=UIFont(name: "XPED Shadow", size: 45.0)
        restartButton.addTarget(applicationControllerObject, action: #selector(applicationControllerObject.newGame), for: .touchUpInside)
        
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
