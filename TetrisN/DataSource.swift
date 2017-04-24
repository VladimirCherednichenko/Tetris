//
//  DataSourceInfo.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class DataSource:NSObject, UITableViewDataSource {
    var leaderBoardDelegate:LeaderBoardDelegate
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate) {
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (leaderBoardDelegate.getUsers()?.count != nil) ? (leaderBoardDelegate.getUsers()?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var result = UITableViewCell()
        if let currentUser = self.leaderBoardDelegate.getUsers()?[indexPath.row] {
        let newCell = CustomeCell(reuseIdentifier: "leaderboard", name: currentUser.name, score: currentUser.score)
            result = newCell
        }
        result.selectionStyle = .default
        
        result.backgroundColor = UIColor.darkGray
        result.accessoryType = .disclosureIndicator
        
        return result
    }
}


class CustomeCell:UITableViewCell {
    let nameLabel = UILabel()
    let scoreLabel = UILabel()
    let name:String
    let score:Int
    
    init(reuseIdentifier: String, name:String, score:Int){
        self.nameLabel.text = name
        self.scoreLabel.text = String(score)
        
        self.name = name
        self.score = score
        
        self.nameLabel.textColor = UIColor.white
        self.scoreLabel.textColor = UIColor.white
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.setLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabels() {
        addSubview(nameLabel)
        addSubview(scoreLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scoreLabel.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: 1 ).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}
