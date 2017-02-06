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
        view.backgroundColor=UIColor.gray
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
        label.textColor=UIColor.red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints=false
        
        verticalStack.addSubview(label)
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
            }
}
