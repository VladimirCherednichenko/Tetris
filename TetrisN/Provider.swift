//
//  File.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//
import UIKit
import Foundation
class Provider{
    
    private var currentElementIndex = 0
    private var figures: [()->Figure]
    init()
    {
        self.figures = [{ let figure = LineFigure(); return figure}, { let figure = T_Figure(); return figure}, { let figure = L_Figure(); return figure},{ let figure = SquareFigure(); return figure},{ let figure = Z_Figure(); return figure}]
        
    }
    
    
    
    
    func getNextFigure()
        -> Figure
    {
        
        let randomNum:UInt32 = arc4random_uniform(UInt32(self.figures.count))
        _ = TimeInterval(randomNum)
        let randomIndex:Int = Int(randomNum)
        self.currentElementIndex = randomIndex
        if self.figures.count <= self.currentElementIndex {
            self.currentElementIndex = 0
            
        }
        
        return self.figures[self.currentElementIndex]()
    }
    
    func getFigure()
        ->Figure
    {   let randomNum:UInt32 = arc4random_uniform(UInt32(self.figures.count))
        _ = TimeInterval(randomNum)
        let randomIndex:Int = Int(randomNum)
        
        return self.figures[randomIndex]()
    }
    deinit {
        print("provider going to die")
    }
}
