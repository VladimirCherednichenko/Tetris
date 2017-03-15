//
//  usersBase.swift
//  Tetris
//
//  Created by pc on 09.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class UserBase:userBaseProtocol {
    var   userData:[String:String]?
    var   leaderBoardData:[String:Int]?
    let defaults = UserDefaults.standard
    
    
    init() {
        readUserBase()
        readLeaderBoardData()
        print("this is leader board" , leaderBoardData)
        
    }
    func verificatUser(name:String,password:String)
        ->Bool{
            var status = false
            if userData != nil {
                for user in userData! {
                    if user.key == name && user.value == password{
                        status = true
                    }
                    
                }
            }
            return status
    }
    
    
    func addNewUser(name:String,password:String)
        ->Bool{
            var status = true
            
            
            
            if userData != nil {
                
                
                for user in userData! {
                    if user.key == name {
                        status = false
                    }
                }
                
                if status{
                    self.userData?[name] = password
                }
            } else {
                self.userData = [name:password]
            }
            print(userData)
            
            rewriteUserBase()
            return status
    }
    
    
    func sendUserScore(name:String, score:Int) {
        if leaderBoardData != nil {
            
            if leaderBoardData![name] == nil {
                leaderBoardData![name] = score
            } else {
                
                if leaderBoardData![name]! < score {
                    leaderBoardData!.updateValue(score, forKey: name)
                }
            }
            
        } else {
            leaderBoardData = [name:score]
        }
        print("this is leaderboard", leaderBoardData)
        rewriteLeaderBoardData()
    }
    
    
    func readUserBase() {
        self.userData = defaults.value(forKey: "savedUserData") as! [String : String]?
        print(userData)
    }
    
    func rewriteUserBase() {
        defaults.set(self.userData, forKey: "savedUserData")
    }
    
    func readLeaderBoardData() {
        self.leaderBoardData = defaults.value(forKey: "savedLeaderBoardData") as! [String : Int]?
    }
    
    func rewriteLeaderBoardData() {
        
       
        
        defaults.set(self.leaderBoardData, forKey: "savedLeaderBoardData")
    }
    
    
    
     
}
