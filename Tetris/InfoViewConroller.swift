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
        
        
    }
    
    
    
    
    
    
}
