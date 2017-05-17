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
    var userArrray:[User]?
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate)
    {
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init()
        self.userArrray = leaderBoardDelegate.getUsers()
    }
    
    func refreshUserArray()
    {
        self.userArrray = leaderBoardDelegate.getUsers()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (userArrray?.count != nil) ? (userArrray?.count)! : 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        let identifier = "identifier"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
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
