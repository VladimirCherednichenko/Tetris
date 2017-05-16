//
//  DataSourceInfo.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class LeaderboardDataSource:NSObject, UICollectionViewDataSource
{
    var leaderBoardDelegate:LeaderBoardDelegate
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate)
    {
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (leaderBoardDelegate.getUsers()?.count != nil) ? (leaderBoardDelegate.getUsers()?.count)! : 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        let identifier = "identifier"
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        cell.backgroundColor = UIColor.darkGray
        
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
        return cell
    }
    
}
class CustomeCell:UICollectionViewCell
{
    let nameLabel = UILabel()
    let scoreLabel = UILabel()
    var icon = UIImageView()
    
    
    
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
    
    func setLabelsAndImageView()
    {
        self.icon.isHidden = false
        addSubview(nameLabel)
        addSubview(scoreLabel)
        addSubview(icon)
        icon.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.snp.top).offset(2)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
            
        }
        icon.clipsToBounds = true
        icon.layer.borderColor = UIColor.black.cgColor
        icon.layer.borderWidth = 1
        icon.layer.cornerRadius = 25
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(icon.snp.bottom).offset(2)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(100)
            
        }
        scoreLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(100)
        }
    }
}
