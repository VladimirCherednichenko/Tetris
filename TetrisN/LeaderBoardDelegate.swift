//
//  ScoreUITableView.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoDelegate: class
{
    func showInfoView(currentUser:User)
}

protocol LeaderBoardDelegate: class
{
    func setNewRecord(name:String, score:Int) ->Bool
    func getUsers() -> [User]?
}

class ScoreViewController: UICollectionViewController
{
    weak var leaderBoardDelegate:LeaderBoardDelegate?
    weak var userInfoDelegate: UserInfoDelegate?
    private let identifier = "identifier"
    private lazy var leaderboardDataSource: UICollectionViewDataSource = {
       return LeaderboardDataSource(self.leaderBoardDelegate!)
    }()
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
                
        if let navigationController = self.navigationController {
            navigationController.navigationBar.barTintColor = UIColor.darkGray
            navigationController.navigationBar.tintColor = UIColor.white
            navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            navigationController.navigationBar.isHidden = false
            navigationController.navigationBar.isTranslucent = false
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: nil)
        view.backgroundColor = UIColor.white
        
        if let collectionView = self.collectionView {
            collectionView.dataSource = self.leaderboardDataSource
            collectionView.allowsSelection = true
            collectionView.backgroundColor = UIColor.darkGray
            collectionView.reloadData()
            collectionView.register(CustomeCell.self, forCellWithReuseIdentifier: identifier)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if let currentUser = leaderBoardDelegate?.getUsers()?[indexPath.row] {
            self.userInfoDelegate?.showInfoView(currentUser: currentUser)
            
        }
        collectionView.deselectItem(at: indexPath, animated: false)
    }

    
    
}
