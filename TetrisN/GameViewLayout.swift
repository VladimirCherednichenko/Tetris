//
//  GameViewLayout.swift
//  TetrisN
//
//  Created by Vladimir on 12.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GameViewLayout
{
    var numberOfPixels:Int
    var pixelArray = [UIImageView]()
    var columns:Int
    var rows:Int
    var valueOfDivision:CGFloat
    
    //Here I creaate vertical Stack, that hold all components
    var verticalStack:UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        return stack
    } ()
    var stackArray = [UIStackView]()
    
    //Adding a score Label
    var labelWithPoints:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "XPED Shadow", size: 35.0)
        return label
    }()
    
    init (view:UIView, rows:Int, columns:Int, valueOfDivision:CGFloat)
    {
        self.numberOfPixels = rows * columns
        self.rows = rows
        self.columns = columns
        self.valueOfDivision = valueOfDivision
        
        view.backgroundColor = UIColor.darkGray
        
        self.createPixelArray()
        view.addSubview(verticalStack)
        verticalStack.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
        }
        fillTheStackViews(view: view, rows: rows, columns: columns)
        
        view.addSubview(labelWithPoints)
        labelWithPoints.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
        
        
    }
    
    func createPixelArray()
    {
        
        for _ in 0...numberOfPixels - 1 {
            
            let pixel = UIImageView(image: #imageLiteral(resourceName: "pixelDark"))
            pixel.contentMode = .scaleAspectFit
            pixelArray.append(pixel)}
    }
    
    func fillTheStackViews(view:UIView, rows:Int, columns:Int)
    {
        for j in 0...rows - 1 {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            for i in 0...columns - 1 {
                let index:Int = (i + j * columns)
                stackArray[j].addArrangedSubview(pixelArray[index])
                
                pixelArray[index].snp.makeConstraints{ (make) -> Void in
                    make.height.equalTo(view.snp.width).multipliedBy(valueOfDivision)
                    make.width.equalTo(view.snp.width).multipliedBy(valueOfDivision)
                }
                
            }
            
        }
    }
    
    
    
    
}
