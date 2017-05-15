//
//  ScoreUITableView.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoDelegate
{
    func showInfoView(currentUser:User)
}
protocol LeaderBoardDelegate
{
    func setNewRecord(name:String, score:Int)
        ->Bool
    func getUsers()
        -> [User]?
    
}

class ScoreViewController:UITableViewController
{
    private var leaderboardDataSource: UITableViewDataSource
    var leaderBoardDelegate:LeaderBoardDelegate
    let userInfoDelegate: UserInfoDelegate
    
    
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate,_ showInfoViewDelegate:UserInfoDelegate)
    {
        self.userInfoDelegate = showInfoViewDelegate
        self.leaderboardDataSource = LeaderboardDataSource(leaderBoardDelegate)
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        // TODO: lets make LoginViewLayout class which will do constraints code. Ask me about examples.
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: nil)
        view.backgroundColor = UIColor.white
        
        tableView.dataSource = self.leaderboardDataSource
        tableView.allowsSelection = true
        tableView.backgroundColor = UIColor.darkGray
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat
    {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let currentUser = leaderBoardDelegate.getUsers()?[indexPath.row] {
            userInfoDelegate.showInfoView(currentUser: currentUser)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
