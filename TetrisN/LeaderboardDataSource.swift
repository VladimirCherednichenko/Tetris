//
//  DataSourceInfo.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class LeaderboardDataSource:NSObject, UITableViewDataSource
{
    var leaderBoardDelegate:LeaderBoardDelegate
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate)
    {
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
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


class CustomeCell:UITableViewCell
{
    let nameLabel = UILabel()
    let scoreLabel = UILabel()
    var icon = UIImageView()
    
    
    
    init(reuseIdentifier: String)
    {
        
        // TODO: too many spaces here
        
        
        self.nameLabel.textColor = UIColor.white
        self.scoreLabel.textColor = UIColor.white
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    func setLabeltext(name:String, score:String)
    {
        self.nameLabel.text = name
        self.scoreLabel.text = score
    }
    
    func setImage(image:UIImage?)
    {
        if image != nil {
            
            self.icon.alpha = 0.0
            self.icon.image = image
            UIView.animate(withDuration: 0.5, animations: {
                self.icon.alpha = 1.0
            })
            
        } else {
            
            self.icon.image = #imageLiteral(resourceName: "defaultImage")
        }
        
        self.setLabelsAndImageView()
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setLabelsAndImageView()
    {
        self.icon.isHidden = false
        addSubview(nameLabel)
        addSubview(scoreLabel)
        addSubview(icon)
        icon.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.snp.top).offset(2)
            make.left.equalTo(self.snp.left).offset(30)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom)
        }
        icon.clipsToBounds = true
        icon.layer.borderColor = UIColor.black.cgColor
        icon.layer.borderWidth = 1
        icon.layer.cornerRadius = 25
        
        
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.snp.top).offset(2)
            make.left.equalTo(icon.snp.right).offset(20)
            make.width.equalTo(100)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        scoreLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.snp.top).offset(2)
            make.left.equalTo(nameLabel.snp.right).offset(1)
            make.width.equalTo(100)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
