//
//  usersBase.swift
//  Tetris
//
//  Created by pc on 09.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class UserBase:LogInDelegate, LeaderBoardDelegate {
    
    
    let store = UserDefaults.standard
    var usersInfo:[String:[String:String]]?
    
    init() {
        
        readUsersInfo()
    }
    
    func addNewUser(name:String,password:String)
    {
        print(name,password)
        var currentUserInfo:[String:String]
        currentUserInfo = ["name": name, "password":password, "score":"0"]
        print(currentUserInfo)
        if usersInfo != nil {
            usersInfo?[name] = currentUserInfo
        } else {
            usersInfo = [name:currentUserInfo]
        }
        saveUsersInfo()
    }
    
    
    func alreadyExistNameCheck(name:String)
        ->Bool{
            var status = false
            if usersInfo?[name] != nil{
                status = true
            }
            return status
    }
    
    func userVerification(name:String, password:String)
        -> Bool{
            var status = false
            if let currentCheckedUser:[String:String] = usersInfo?[name] {
                if currentCheckedUser["name"] == name && currentCheckedUser["password"] == password  {
                    status = true
                }
                
                
                
            }
            return status
    }
    
    func saveUsersInfo(){
        print(usersInfo)
        store.set(usersInfo, forKey: "savedUsersInfo")
        print(store.value(forKey: "savedUsersInfo"))
    }
    
    func readUsersInfo()
        
    {
        print(store.value(forKey: "savedUsersInfo"))
            
            usersInfo = store.value(forKey: "savedUsersInfo") as! [String : [String : String]]?
        
    }
    
    func saveCurrentUserName(name:String){
        store.set(name, forKey: "currentName")
        
    }
    
    func readCurrentUserName() -> String?{
        var name:String?
        name = store.value(forKey: "currentName") as! String?
        
        return name
    }
    
    
    
    
    func setNewRecord (name:String, score:Int)
        ->Bool{
            var status = false
            
            if var currentCheckedUser:[String:String] = usersInfo?[name]
            {
            print((currentCheckedUser["score"]))
            let currentRecord = (currentCheckedUser["score"])
            
            if Int(currentRecord!)! < score {
                
                status = true
                currentCheckedUser["score"] = String(score)
                usersInfo!.updateValue(currentCheckedUser, forKey: name)
                print("score \(currentCheckedUser["score"])")
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
            for dictionary in dictionaries {
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







