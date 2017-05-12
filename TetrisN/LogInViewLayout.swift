//
//  LogInViewLayout.swift
//  TetrisN
//
//  Created by Vladimir on 11.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class LogInLayout
{
    var nameOfApplication:UILabel = {
        let label = UILabel()
        label.text = "Tetris"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Yellowtail", size: 70.0) // TODO: move fonts to some collection class, and then use fonts from this class
        label.layer.shadowColor = UIColor.red.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowRadius = 8
        label.textAlignment = .center
        return label
    } ()
    
    var enterYourNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Please login"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Montserrat", size: 23)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    } ()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "name"
        textField.layer.cornerRadius = 15.0
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        textField.font = UIFont(name: "corbel", size: 30.0)
        textField.textAlignment = .center
        textField.returnKeyType = .next
        return textField
    } ()
    
    var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 15.0
        textField.font = UIFont(name: "corbel", size: 30)
        textField.textAlignment = .center
        textField.returnKeyType = .go
        return textField
    }()
    
    var warningLabel:UILabel = {
        let label = UILabel()
        label.text = "wrong password"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Montserrat", size: 20 )
        label.textAlignment = .center
        return label
    } ()
    
    
    init(view:UIView)
    {
        view.backgroundColor = UIColor.darkGray
        view.addSubview(nameOfApplication)
        
        nameOfApplication.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(45)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(enterYourNameLabel)
        
        enterYourNameLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(nameOfApplication.snp.bottom).offset(20)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(enterYourNameLabel.snp.bottom).offset(7)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.width.equalTo(nameTextField.snp.width)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(warningLabel)
        warningLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
