//
//  MenuViewController.swift
//  Tetris
//
//  Created by pc on 07.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit


class MenuViewController:UIViewController {
    var currentName:String?
    var menuDelegate:MenuDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor.darkGray
        
        
        
        let nameLabel = UILabel()
        nameLabel.text = "Hello,  " + currentName! + "!"
        nameLabel.numberOfLines = 3
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name: "Yellowtail", size: 50.0)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.layer.shadowColor = UIColor.red.cgColor
        nameLabel.layer.shadowOpacity = 1
        nameLabel.layer.shadowOffset = CGSize.zero
        nameLabel.layer.shadowRadius = 6
        
        view.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        let startNewGameButton = UIButton()
        startNewGameButton.translatesAutoresizingMaskIntoConstraints = false
        startNewGameButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(startNewGameButton)
        startNewGameButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 35).isActive = true
        startNewGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startNewGameButton.setTitle("Start new game", for: .normal)
        startNewGameButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        startNewGameButton.layer.shadowOpacity = 1
        startNewGameButton.layer.shadowOffset = CGSize.zero
        startNewGameButton.layer.shadowRadius = 6
        startNewGameButton.addTarget(self, action: #selector(showGame), for: .touchUpInside)
        
        let showLeaderboardButton = UIButton()
        showLeaderboardButton.translatesAutoresizingMaskIntoConstraints = false
        showLeaderboardButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(showLeaderboardButton)
        showLeaderboardButton.topAnchor.constraint(equalTo: startNewGameButton.bottomAnchor).isActive = true
        showLeaderboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showLeaderboardButton.setTitle("Leaderboord", for: .normal)
        showLeaderboardButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        showLeaderboardButton.layer.shadowOpacity = 1
        showLeaderboardButton.layer.shadowOffset = CGSize.zero
        showLeaderboardButton.layer.shadowRadius = 6
        showLeaderboardButton.addTarget(self, action: #selector(showLeaderboard), for: .touchUpInside)
       // startNewGameButton.addTarget(self, action: #selector(didPressRestartButton), for: .touchUpInside)

        
        
    }
    
    func showGame() {
        menuDelegate?.newGame()
    }
    
    func showLeaderboard() {
        menuDelegate?.showScoreView()
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
}
