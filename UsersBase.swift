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
    func veriefUser(name:String,password:String)
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
                        break;
                    }
                }
                
                self.userData?[name] = password
                
            } else {
                self.userData = [name:password]
            }
            
            return status
    }
    
    
}
