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
    private var layout:LogInLayout!
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.layout = LogInLayout(view: view)
        layout.nameTextField.delegate = self
        layout.passwordTextField.delegate = self
        layout.warningLabel.isHidden = true
    }
    func textFieldShouldReturn(_ textField: UITextField)
        -> Bool
    {   //moving to the next textfield
        if textField == layout.nameTextField {
            self.currentUsersName = textField.text
            layout.passwordTextField.becomeFirstResponder()
            
        } else {
            currentUsersPassword = textField.text
            currentUsersName = layout.nameTextField.text
            if currentUsersName != nil && currentUsersPassword != nil  {
                userVerificationDelegate?.userVerificate(userName: currentUsersName!, userPass: currentUsersPassword!, showWarningLabeldDeledate: self)
            }
        }
        
        return false
    }
    
    func showWarningLabel()
    {
        layout.warningLabel.isHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
