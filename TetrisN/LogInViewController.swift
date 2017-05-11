//
//  File.swift
//  Tetris
//
//  Created by pc on 06.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit


protocol UserVerificationDelegate
{
    func userVerificate (userName:String, userPass:String, showWarningLabeldDeledate:ShowWarningLabelDelegate)
}

class LogInViewController:UIViewController,UITextFieldDelegate, ShowWarningLabelDelegate
{
    var userVerificationDelegate:UserVerificationDelegate?
    private var currentUsersName:String?
    private var currentUsersPassword:String?
    private let warningLabel = UILabel()
    private var nameTextField = UITextField()
    private var passwordTextField = UITextField()
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad()
    {
        
        // TODO: lets make LoginViewLayout class which will do constraints code. Ask me about examples.
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        let nameOfApplication = UILabel()
        nameOfApplication.text = "Tetris"
        nameOfApplication.textColor = UIColor.white
        nameOfApplication.font = UIFont(name: "Yellowtail", size: 70.0) // TODO: move fonts to some collection class, and then use fonts from this class
        nameOfApplication.layer.shadowColor = UIColor.red.cgColor
        nameOfApplication.layer.shadowOpacity = 1
        nameOfApplication.layer.shadowOffset = CGSize.zero
        nameOfApplication.layer.shadowRadius = 8
        view.addSubview(nameOfApplication)
        
        nameOfApplication.textAlignment = .center
        nameOfApplication.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(45)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        let enterYourNameLabel = UILabel()
        enterYourNameLabel.text = "Please login"
        enterYourNameLabel.textColor = UIColor.white
        enterYourNameLabel.font = UIFont(name: "Montserrat", size: 23)
        enterYourNameLabel.numberOfLines = 3
        view.addSubview(enterYourNameLabel)
        enterYourNameLabel.textAlignment = .center
        
        enterYourNameLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(nameOfApplication.snp.bottom).offset(20)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        nameTextField.placeholder = "name"
        nameTextField.layer.cornerRadius = 15.0
        nameTextField.backgroundColor = UIColor.white
        nameTextField.textColor = UIColor.black
        nameTextField.font = UIFont(name: "corbel", size: 30.0)
        nameTextField.textAlignment = .center
        nameTextField.returnKeyType = .next
        nameTextField.delegate = self
        nameTextField.tag = 0
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(enterYourNameLabel.snp.bottom).offset(7)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.centerX.equalTo(view.snp.centerX)
            
        }
        passwordTextField.placeholder = "password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.textColor = UIColor.black
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.font = UIFont(name: "corbel", size: 30)
        passwordTextField.textAlignment = .center
        passwordTextField.returnKeyType = .go
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.width.equalTo(nameTextField.snp.width)
            make.centerX.equalTo(view.snp.centerX)
            
        }
        warningLabel.text = "wrong password"
        warningLabel.textColor = UIColor.white
        warningLabel.font = UIFont(name: "Montserrat", size: 20 )
        view.addSubview(warningLabel)
        warningLabel.textAlignment = .center
        warningLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        warningLabel.isHidden = true
    }
    func textFieldShouldReturn(_ textField: UITextField)
        -> Bool
    {
        if textField == nameTextField {
            self.currentUsersName = textField.text
            passwordTextField.becomeFirstResponder()
            
        } else {
            currentUsersPassword = textField.text
            currentUsersName = nameTextField.text
            if currentUsersName != nil && currentUsersPassword != nil  {
                userVerificationDelegate?.userVerificate(userName: currentUsersName!, userPass: currentUsersPassword!, showWarningLabeldDeledate: self)
                
            }
        }
        
        return false
    }
    
    func showWarningLabel()
    {
        warningLabel.isHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
