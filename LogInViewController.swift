//
//  File.swift
//  Tetris
//
//  Created by pc on 06.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LogInViewController:UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let eterYourNameLabel = UILabel()
        eterYourNameLabel.text = "Enter your Name"
        eterYourNameLabel.textColor = UIColor.white
        eterYourNameLabel.font = UIFont(name: "LOKICOLA", size: 70.0)
        eterYourNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eterYourNameLabel.numberOfLines = 3
        view.addSubview(eterYourNameLabel)
        eterYourNameLabel.textAlignment = .center
        eterYourNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eterYourNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        eterYourNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        eterYourNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
       
        nameTextField.placeholder = "name"
        nameTextField.layer.cornerRadius = 20.0
        nameTextField.backgroundColor = UIColor.white
        nameTextField.textColor = UIColor.black
        
        
        nameTextField.font = UIFont(name: "Lato-Regular", size: 30.0)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textAlignment = .center
        nameTextField.returnKeyType = .next
        nameTextField.delegate = self
        nameTextField.tag = 0
        view.addSubview(nameTextField)
        
        nameTextField.topAnchor.constraint(equalTo: eterYourNameLabel.bottomAnchor, constant: 15 ).isActive = true
        
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        //nameTextField.delegate = self
        
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //nameTextField.attributedPlaceholder =
        passwordTextField.placeholder = "password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.textColor = UIColor.darkGray
        
        passwordTextField.layer.cornerRadius = 20.0
        passwordTextField.font = UIFont(name: "Lato-Regular", size: 30.0)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textAlignment = .center
        passwordTextField.returnKeyType = .go
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        view.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
       
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        
        return false
    }
    }
