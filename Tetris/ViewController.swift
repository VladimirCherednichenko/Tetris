//
//  ViewController.swift
//  Tetris
//
//  Created by Admin on 18.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        
      
        view.addSubview(verticalStack)
        
        
        
        verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        verticalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        
        
        
        
        let horizontalStack = UIStackView()
        horizontalStack.spacing=1
        horizontalStack.axis = .horizontal
         horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.addSubview(horizontalStack)
        
        //there pixel begins to create
        var pixelArray=[UIView]()
        
        for i in 0...9 {
        let pixel=UIView()
        pixel.translatesAutoresizingMaskIntoConstraints = false
        pixel.backgroundColor=UIColor.blue
            
        pixelArray.append(pixel)
            horizontalStack.addArrangedSubview(pixelArray[i])
            
            pixelArray[i].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.1).isActive=true
        pixelArray[i].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive=true
           }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

