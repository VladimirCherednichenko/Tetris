//
//  File.swift
//  Tetris
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
class Provider{
    
    private var currentElementIndex = 0
    private var figures: [()->Figure]
    init()
    {
        self.figures = [{ let figure=LineFigure(); return figure}, { let figure=T_Figure(); return figure}, { let figure=L_Figure(); return figure},{ let figure=SquareFigure(); return figure},{ let figure=Z_Figure(); return figure}]
    }
    
    
    func getNextFigure()
        -> Figure
    {
        self.currentElementIndex = self.currentElementIndex + 1
        if self.figures.count <= self.currentElementIndex {
            self.currentElementIndex = 0
            
        }
        
        return self.figures[self.currentElementIndex]()
    }
    
    func getFigure()
        ->Figure
    {
        return self.figures[self.currentElementIndex]()
    }
    
}
