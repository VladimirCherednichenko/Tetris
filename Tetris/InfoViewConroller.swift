//
//  infoViewConroller.swift
//  Tetris
//
//  Created by pc on 31.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit


class InfoViewConroller:UIViewController {
    let currentUserName:String
    let score:Int
    let logInView:ShowLogInViewDelegate
    
    init(_ currentUser:User, _ logInView:ShowLogInViewDelegate) {
        self.logInView = logInView
        self.currentUserName = currentUser.name
        self.score = currentUser.score
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let nameLabel = UILabel()
        let scoreLabel = UILabel()
        let logOutButton = UIButton()
        
        
        
        nameLabel.text = currentUserName
        scoreLabel.text =  ("score: \(score)")
        
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 35.0)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.setTitleColor(UIColor.black, for: .normal)
        logOutButton.setTitleColor(UIColor.red, for: .highlighted)
        view.addSubview(logOutButton)
        
        logOutButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 70).isActive = true
        
        logOutButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
        logOutButton.contentMode = .center
        

        
        
    }
    
    
    
    
    
    
}
