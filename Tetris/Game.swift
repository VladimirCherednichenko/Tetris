//
//  Game.swift
//  Tetris
//
//  Created by Admin on 23.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
protocol GameDrow {
    func fillThePixel(gameIndex:Int)
    func clearThePixel(gameIndex:Int)
}

class Game {
    
    private var viewController:GameDrow
    
    init(viewController:GameDrow)
    {
        self.viewController=viewController
        fillCollor()
    }
    
    
    
    
    func fillCollor(/*There I pass index of pixels Ill fill*/) {
        
        self.viewController.fillThePixel(gameIndex: 4)
        self.viewController.fillThePixel(gameIndex: 3)
        self.viewController.fillThePixel(gameIndex: 5)
        self.viewController.fillThePixel(gameIndex: 6)
clearThePixelCollor()
    }
    
    func clearThePixelCollor(/*There I pass index of pixels Ill clear*/) {
        
        self.viewController.clearThePixel(gameIndex: 4)
        self.viewController.clearThePixel(gameIndex: 3)
        self.viewController.clearThePixel(gameIndex: 5)
        self.viewController.clearThePixel(gameIndex: 6)
        
    }


}
