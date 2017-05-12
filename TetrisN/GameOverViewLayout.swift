//
//  InitialViewLayout.swift
//  TetrisN
//
//  Created by Vladimir on 11.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class GameOverViewLayout {
    var gameOverLabel:UILabel = {
        let label = UILabel()
        label.text = "Game Over"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "XPED Shadow", size: 60.0   )
        return label
    } ()

    let restartButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.red, for: .highlighted)
        button.setTitle("Restart", for: .normal)
        button.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        return button
    } ()
    
    let menuButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.red, for: .highlighted)
        button.setTitle("Menu", for: .normal)
        button.titleLabel?.font = UIFont(name: "XPED Shadow", size: 45.0)
        return button
    } ()
    
    init(view:UIView)
    {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
        view.addSubview(gameOverLabel)
        gameOverLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(view.snp.top).offset(170)
            make.centerX.equalTo(view.snp.centerX) }
        
        view.addSubview(restartButton)
        
        restartButton.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(gameOverLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)}
        
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(restartButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)}
    }
    
}
