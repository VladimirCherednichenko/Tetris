//
//  UserStruct.swift
//  Tetris
//
//  Created by pc on 30.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
struct User
{
    let name: String
    var score: Int = 0
    let password: String
    var imageURLString:String = ""
    init?(dictionary: [String:String]) {
        guard let name = dictionary["name"], let score = dictionary["score"], let password = dictionary["password"], let imageURLString = dictionary["imageURLString"] else {
            return nil
        }
        self.name = name
        self.password = password
        self.imageURLString = imageURLString
        if let scoreNumber = Int(score) {
            self.score = scoreNumber
        }
    }
    func readUIImage()
        -> UIImage?
    {
        var image:UIImage?
        let photoURL = getDocumentsDirectory().appendingPathComponent(self.name + ".png")
        if let data = try? Data(contentsOf: photoURL) {
            image = UIImage(data:data)
            
        }
        
        return image
    }
}
