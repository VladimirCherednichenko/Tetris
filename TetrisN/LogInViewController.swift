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
    private var warningLabel = UILabel()
    private var nameTextField = UITextField()
    private var passwordTextField = UITextField()
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let layout = LogInLayout(view: view)
        
        nameTextField = layout.nameTextField
        passwordTextField  = layout.passwordTextField
        warningLabel = layout.warningLabel
        
        nameTextField.delegate = self
        passwordTextField.delegate = self
       
        
        
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
