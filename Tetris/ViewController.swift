//
//  ViewController.swift
//  Tetris
//
//  Created by Admin on 18.01.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


class ViewController: UIViewController, GameDrow {
    //internal var view: UIView

    //var stackArray=[UIStackView]()
    var timer:Int=0
    var pixelArray=[UIView]()
    
    func createPixelArray(){
        for indexOfPixel in 0...179{
            
            let pixel=UIView()
            pixel.translatesAutoresizingMaskIntoConstraints = false
            pixel.backgroundColor=UIColor(patternImage:#imageLiteral(resourceName: "pixelDark"))
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
            
            
            
            
            for i in 0...9
            {  let index:Int=(i+j*10)
                
                stackArray[j].addArrangedSubview(pixelArray[index])
                
                pixelArray[index].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.1).isActive=true
                pixelArray[index].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive=true
            }
            
        }
        
        ///
        /*let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(clearView))
        
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respond))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respond))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respond))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)*/
        
        
    }
    
    func fillThePixel(gameIndex:Int){
    
        
        
        pixelArray[gameIndex].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelRed"))
    }
    
    func clearThePixel(gameIndex:Int){
        
        
        
        pixelArray[gameIndex].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
    }
    
    func clearView(){
        for element in pixelArray{
        element.backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))}
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

