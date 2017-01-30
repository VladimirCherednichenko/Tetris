//
//  Game.swift
//  Tetris
//
//  Created by Admin on 23.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class Game:GameProtocol {
    
    func clearView() {
        self.viewController.clearView()
    }

    
    var viewController:GameDrow
    
    var pixelIllFill:[Int]
    
    
    
    
    init(viewController:GameDrow){
        self.viewController=viewController
        self.pixelIllFill=[4,3,5,6]
    }
    
    
    
    
    func fillCollor(_ fillArray:[Int]) {
        
        for element in fillArray{
        self.viewController.fillThePixel(gameIndex: element)
               }}
    
    func clearThePixelCollor(_ cleanArray:[Int]) {
        
        for element in cleanArray{
            self.viewController.clearThePixel(gameIndex: element)
        }}
    }



