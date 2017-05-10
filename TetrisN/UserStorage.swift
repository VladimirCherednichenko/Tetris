//
//  usersBase.swift
//  Tetris
//
//  Created by pc on 09.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
class UserStorage:LeaderBoardDelegate
{
    let store = UserDefaults.standard
    let imageStore = NSDate()
    var usersInfo:[String:[String:String]]?
    init()
    {
        readUsersInfo()
    }
    func addNewUser(name:String,password:String)
    {
        var currentUserInfo:[String:String]
        currentUserInfo = ["name": name, "password":password, "score":"0", "imageURLString" : ""]
        if usersInfo != nil {
            usersInfo?[name] = currentUserInfo
        } else {
            usersInfo = [name:currentUserInfo]
        }
        saveUsersInfo()
    }
    
    
    func alreadyExistNameCheck(name:String)
        ->Bool
    {
        var status = false
        if usersInfo?[name] != nil{
            status = true
        }
        return status
    }
    
    func userVerification(name:String, password:String)
        -> Bool
    {
        var status = false
        if let currentCheckedUser:[String:String] = usersInfo?[name] {
            if currentCheckedUser["name"] == name && currentCheckedUser["password"] == password  {
                status = true
            }
            
        }
        return status
    }
    
    func saveUsersInfo()
    {
        store.set(usersInfo, forKey: "savedUsersInfo")
    }
    
    func readUsersInfo()
    {
        usersInfo = store.value(forKey: "savedUsersInfo") as! [String : [String : String]]?
    }
    
    func saveCurrentUserName(name:String)
    {
        store.set(name, forKey: "currentName")
    }
    
    func readCurrentUserName()
        -> String?
    {
        var name:String?
        name = store.value(forKey: "currentName") as! String?
        return name
    }
    
    func setNewRecord (name:String, score:Int)
        ->Bool
    {
        var status = false
        if var currentCheckedUser:[String:String] = usersInfo?[name]
        {
            let currentRecord = (currentCheckedUser["score"])
            if Int(currentRecord!)! < score {
                
                status = true
                currentCheckedUser["score"] = String(score)
                usersInfo!.updateValue(currentCheckedUser, forKey: name)
                saveUsersInfo()
            }
        }
        return status
    }
    
    func getUsers()
        -> [User]?
    {
        var result: [User] = Array<User>()
        if let dictionaries = usersInfo?.values {
            for dictionary in dictionaries
            {
                if let user = User(dictionary: dictionary) {
                    result.append(user)
                }
            }
            result = result.sorted(by: { (first, second) -> Bool in
                return first.score > second.score
            })
        }
        return (result.count > 0) ? result : nil
    }
}







