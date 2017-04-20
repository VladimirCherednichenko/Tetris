//
//  UserStruct.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

struct User
{
    let name: String
    var score: Int = 0
    let password: String
    
    init?(dictionary: [String:String])
    {
        guard let name = dictionary["name"], let score = dictionary["score"], let password = dictionary["password"] else {
            return nil
        }
        
        self.name = name
        self.password = password
        if let scoreNumber = Int(score) {
            self.score = scoreNumber
        }
    }
}
