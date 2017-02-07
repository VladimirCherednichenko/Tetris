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
    var senderObject:protocolGameOver
    
    init(senderObject:protocolGameOver){
        self.senderObject=senderObject
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
        
        let gameOverLabel=UILabel()
        gameOverLabel.text="Game Over"
        gameOverLabel.textColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
        gameOverLabel.textAlignment = .center
        gameOverLabel.font=UIFont(name: "XPED Shadow", size: 55.0)
        
        
        
        gameOverLabel.translatesAutoresizingMaskIntoConstraints=false
        let testLabel=UILabel()
        testLabel.text="Test"
        testLabel.textColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
        testLabel.textAlignment = .right
        testLabel.font=UIFont(name: "XPED Shadow", size: 20.0)
        
        let restartButton=UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        restartButton.translatesAutoresizingMaskIntoConstraints=false
        
        
        verticalStack.addArrangedSubview(gameOverLabel)
        
        
        verticalStack.addArrangedSubview(restartButton)
        verticalStack.addArrangedSubview(testLabel)
        restartButton.setTitle("Restart", for: .normal)
        restartButton.addTarget(senderObject, action: #selector(senderObject.newGame), for: .touchUpInside)
        
        
    }
}
