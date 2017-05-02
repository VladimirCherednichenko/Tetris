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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = CustomeCell(reuseIdentifier: identifier)
            cell?.selectionStyle = .default
            cell?.backgroundColor = UIColor.darkGray
            cell?.accessoryType = .disclosureIndicator
        }
        
        if let currentUser = self.leaderBoardDelegate.getUsers()?[indexPath.row] {
            
            if let customCell = cell as? CustomeCell {
                customCell.setLabeltext(name: currentUser.name, score: "\(currentUser.score)")
                
                DispatchQueue.global().async {
                    let image = currentUser.readUIImage()
                    DispatchQueue.main.async {
                        customCell.setImage(image: image)
                    }
                }
            }
        }
        
        return cell!
    }
}


class CustomeCell:UITableViewCell {
    let nameLabel = UILabel()
    let scoreLabel = UILabel()
    var icon = UIImageView()
    
    
    
    init(reuseIdentifier: String)
    {
        
        
        
        
        self.nameLabel.textColor = UIColor.white
        self.scoreLabel.textColor = UIColor.white
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    func setLabeltext(name:String, score:String){
        self.nameLabel.text = name
        self.scoreLabel.text = score
    }
    
    func setImage(image:UIImage?){
        if image != nil {
            self.icon.alpha = 0.0
            self.icon.image = image
            UIView.animate(withDuration: 0.5, animations: {
                self.icon.alpha = 1.0
            })
            self.setLabelsAndImageView()
        } else {
            self.setLabels()
        }
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
    
    func setLabelsAndImageView()
    {
        addSubview(nameLabel)
        addSubview(scoreLabel)
        addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        icon.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        icon.clipsToBounds = true
        icon.layer.borderColor = UIColor.black.cgColor
        icon.layer.borderWidth = 1
        icon.layer.cornerRadius = 25

        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        scoreLabel.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: 1 ).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
