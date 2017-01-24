//
//  ViewController.swift
//  Tetris
//
//  Created by Admin on 18.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


class ViewController: UIViewController, GameDrow {
    //var stackArray=[UIStackView]()
    
    var pixelArray=[UIView]()
    
    func createPixelArray(){
        for indexOfPixel in 0...179{
            
            let pixel=UIView()
            pixel.translatesAutoresizingMaskIntoConstraints = false
            pixel.backgroundColor=UIColor(patternImage:#imageLiteral(resourceName: "pixelDark"))
            /*if indexOfPixel==11 {pixel.backgroundColor=UIColor(patternImage:#imageLiteral(resourceName: "pixelRed"))}
            if indexOfPixel==21 {pixel.backgroundColor=UIColor(patternImage:#imageLiteral(resourceName: "pixelRed"))}*/
            pixelArray.append(pixel)}}
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
         createPixelArray()
        view.backgroundColor = UIColor.red
        
        //Here I creaate vertical Stack, that hold all components
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        //verticalStack.spacing = 2
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verticalStack)
        
        
        //verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        //verticalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        //
        var stackArray=[UIStackView]()
        
        for j in 0...17 {
            
            let horizontalStack = UIStackView()
            //horizontalStack.spacing=2
            horizontalStack.axis = .horizontal
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            
            //var pixelArray=[UIView]()
            
            for i in 0...9
            {  let index:Int=(i+j*10)
                
                stackArray[j].addArrangedSubview(pixelArray[index])
                
                pixelArray[index].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.1).isActive=true
                pixelArray[index].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive=true
            }
            
        }
    }
    func fillThePixel(gameIndex:Int){
    
        
        createPixelArray()
        pixelArray[gameIndex].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
    }
    
    func clearThePixel(gameIndex:Int){
        
        
        createPixelArray()
        pixelArray[gameIndex].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
    }
    
    
    //stackArray[17].arrangedSubviews[2].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

