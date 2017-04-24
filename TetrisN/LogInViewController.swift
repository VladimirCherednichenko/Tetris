//
//  File.swift
//  Tetris
//
//  Created by pc on 06.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit


class LogInViewController:UIViewController,UITextFieldDelegate {
    
    var LogInDelegate:LogInDelegate?
    var currentUsersName:String?
    var currentUsersPassword:String?
    
    var menuDelegate:MenuDelegate?
    let warningLabel = UILabel()
    var nameTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        let nameOfApplication = UILabel()
        nameOfApplication.text = "Tetris"
        nameOfApplication.textColor = UIColor.white
        nameOfApplication.font = UIFont(name: "lol", size: 70.0)
        nameOfApplication.translatesAutoresizingMaskIntoConstraints = false
        nameOfApplication.layer.shadowColor = UIColor.red.cgColor
        nameOfApplication.layer.shadowOpacity = 1
        nameOfApplication.layer.shadowOffset = CGSize.zero
        nameOfApplication.layer.shadowRadius = 8
        
        view.addSubview(nameOfApplication)
        nameOfApplication.textAlignment = .center
        nameOfApplication.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameOfApplication.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        nameOfApplication.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameOfApplication.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        let eterYourNameLabel = UILabel()
        eterYourNameLabel.text = "Please login"
        eterYourNameLabel.textColor = UIColor.white
        eterYourNameLabel.font = UIFont(name: "Montserrat", size: 23)
        eterYourNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eterYourNameLabel.numberOfLines = 3
        
        view.addSubview(eterYourNameLabel)
        eterYourNameLabel.textAlignment = .center
        eterYourNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eterYourNameLabel.topAnchor.constraint(equalTo: nameOfApplication.bottomAnchor, constant: 20).isActive = true
        eterYourNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        eterYourNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        nameTextField.placeholder = "name"
        nameTextField.layer.cornerRadius = 15.0
        nameTextField.backgroundColor = UIColor.white
        nameTextField.textColor = UIColor.black
        
        
        nameTextField.font = UIFont(name: "corbel", size: 30.0)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textAlignment = .center
        nameTextField.returnKeyType = .next
        nameTextField.delegate = self
        nameTextField.tag = 0
        view.addSubview(nameTextField)
        
        nameTextField.topAnchor.constraint(equalTo: eterYourNameLabel.bottomAnchor, constant: 7 ).isActive = true
        
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        //nameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //nameTextField.attributedPlaceholder =
        passwordTextField.placeholder = "password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.textColor = UIColor.black
        
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.font = UIFont(name: "corbel", size: 30)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textAlignment = .center
        passwordTextField.returnKeyType = .go
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        view.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        
        
        
        
        
        warningLabel.text = "wrong password"
        warningLabel.textColor = UIColor.white
        warningLabel.font = UIFont(name: "Montserrat", size: 20 )
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(warningLabel)
        warningLabel.textAlignment = .center
        warningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        warningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2).isActive = true
        warningLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        warningLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        warningLabel.isHidden = true
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        print("now on next view \(self.nameTextField.text) \(self.passwordTextField.text) ")
        
        if textField == nameTextField
        {
            self.currentUsersName = textField.text
            passwordTextField.becomeFirstResponder()
            
        }
        
        if textField == passwordTextField {
            
            currentUsersPassword = textField.text
            
            if currentUsersName != nil {
                
                let alreadyExists = self.LogInDelegate?.alreadyExistNameCheck(name: nameTextField.text!)
                
                 if alreadyExists! {
                    let verificationComplete = self.LogInDelegate?.userVerification(name: nameTextField.text!, password: passwordTextField.text!)
                    if verificationComplete! {
                        goToMenu()
                    } else {
                        warningLabel.isHidden = false
                    }
                } else {
                    self.LogInDelegate?.addNewUser(name: nameTextField.text!, password: passwordTextField.text!)
                    goToMenu()
                }
                
            }
        }
        return false
    }
    
    func goToMenu() {
        self.LogInDelegate?.saveCurrentUserName(name: self.currentUsersName!)
        menuDelegate?.currentName = self.currentUsersName
        menuDelegate?.showMenu()
    }
}
