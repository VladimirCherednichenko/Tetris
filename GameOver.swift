//
//  GameOver.swift
//  Tetris
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

import UIKit

class GameOver: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
        let verticalStack=UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints=false
        verticalStack.axis = .vertical
        view.addSubview(verticalStack)
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        verticalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true

        let label=UILabel()
        label.text="Game Over"
        label.textColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
        label.textAlignment = .center
        //label.font=UIFont(name: "ITF Devanagari", size: 1)
        //label.font = label.font.withSize(50)
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        
        
        //label.font.fontName = 1
        label.translatesAutoresizingMaskIntoConstraints=false
        let label1=UILabel()
        label1.text="Test"
        label1.textColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
        label1.textAlignment = .right
        label1.font=UIFont(name: "ITF Devanagari", size: 1)
        label1.font = label.font.withSize(30.0)
        
        
        verticalStack.addArrangedSubview(label)
        verticalStack.addArrangedSubview(label1)
        
        
            }
}
