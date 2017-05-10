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
    @objc func showScoreView()
}

class MenuViewController:UIViewController
{
    var currentName:String?
    var menuDelegate:MenuDelegate?
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor.darkGray
        let nameLabel = UILabel()
        nameLabel.text = "Hello,  " + currentName! + "!"
        nameLabel.numberOfLines = 3
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name: "Yellowtail", size: 50.0)
        nameLabel.layer.shadowColor = UIColor.red.cgColor
        nameLabel.layer.shadowOpacity = 1
        nameLabel.layer.shadowOffset = CGSize.zero
        nameLabel.layer.shadowRadius = 6
        view.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(25)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        let startNewGameButton = UIButton()
        startNewGameButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(startNewGameButton)
        
        
        startNewGameButton.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(35)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        startNewGameButton.setTitle("Start new game", for: .normal)
        startNewGameButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        startNewGameButton.layer.shadowOpacity = 1
        startNewGameButton.layer.shadowOffset = CGSize.zero
        startNewGameButton.layer.shadowRadius = 6
        startNewGameButton.addTarget(self, action: #selector(showGame), for: .touchUpInside)
        
        let showLeaderboardButton = UIButton()
        showLeaderboardButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(showLeaderboardButton)
        
        
        
        showLeaderboardButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(startNewGameButton.snp.bottom)
            make.centerX.equalTo(startNewGameButton.snp.centerX)
        }
        
        showLeaderboardButton.setTitle("Leaderboord", for: .normal)
        showLeaderboardButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        showLeaderboardButton.layer.shadowOpacity = 1
        showLeaderboardButton.layer.shadowOffset = CGSize.zero
        showLeaderboardButton.layer.shadowRadius = 6
        showLeaderboardButton.addTarget(self, action: #selector(showLeaderboard), for: .touchUpInside)
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
