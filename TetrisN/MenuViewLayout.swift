//
//  MenuViewLayout.swift
//  TetrisN
//
//  Created by Vladimir on 12.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MenuViewLayout
{
    var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor.white
        label.font = UIFont(name: "Yellowtail", size: 50.0)
        label.layer.shadowColor = UIColor.red.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowRadius = 6
        label.textAlignment = .center
        return label
    } ()
    
    var startNewGameButton: UIButton = {
        let button = UIButton ()
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.setTitle("Start new game", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 6
        return button
    } ()
    
    var showLeaderboardButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.setTitle("Leaderboord", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35.0)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 6
        return button
    } ()
    
    
    init(view:UIView)
    {
        view.backgroundColor = UIColor.darkGray
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(25)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)            
        }
        
        view.addSubview(startNewGameButton)
        startNewGameButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(35)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(showLeaderboardButton)
        showLeaderboardButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(startNewGameButton.snp.bottom)
            make.centerX.equalTo(startNewGameButton.snp.centerX)
        }
    }
}
