//
//  ScoreUITableView.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoDelegate{
    func showInfoView(currentUser:User)
}

protocol LeaderBoardDelegate
{
    func setNewRecord(name:String, score:Int)
        ->Bool
    func getUsers()
        -> [User]?
    
}

class ScoreViewController:UIViewController,UITableViewDelegate
{
    var tabelView:UITableView =  UITableView()
    private var leaderboardDataSource: UITableViewDataSource
    var leaderBoardDelegate:LeaderBoardDelegate
    let userInfoDelegate: UserInfoDelegate
    
    init(_ leaderBoardDelegate:LeaderBoardDelegate,_ showInfoViewDelegate:UserInfoDelegate) {
        self.userInfoDelegate = showInfoViewDelegate
        self.leaderboardDataSource = LeaderboardDataSource(leaderBoardDelegate)
        self.leaderBoardDelegate = leaderBoardDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: nil)
        view.backgroundColor = UIColor.white
        tabelView.delegate = self
        tabelView.dataSource = self.leaderboardDataSource
        tabelView.allowsSelection = true
        view.addSubview(tabelView)
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        tabelView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
        }
        tabelView.backgroundColor = UIColor.darkGray
        tabelView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat
    {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let currentUser = leaderBoardDelegate.getUsers()?[indexPath.row] {
            userInfoDelegate.showInfoView(currentUser: currentUser)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
