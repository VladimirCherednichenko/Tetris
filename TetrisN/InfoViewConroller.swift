//
//  infoViewConroller.swift
//  Tetris
//
//  Created by pc on 31.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit


class InfoViewConroller:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let currentUserName:String
    let score:Int
    private var myImage = UIImage()
    let logoutDelegate:LogoutDelegate
    let itIsCurrentUser:Bool
    let photoButton = UIButton()
    let imagePicker =  UIImagePickerController()
    let currentUserStruct:User
    
    init(_ currentUser:User, _ logoutDelegate:LogoutDelegate,_ itIsCurrentUser:Bool) {
        self.itIsCurrentUser = itIsCurrentUser
        self.logoutDelegate = logoutDelegate
        self.currentUserStruct = currentUser
        self.currentUserName = currentUser.name
        self.score = currentUser.score
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let nameLabel = UILabel()
        let scoreLabel = UILabel()
        let logOutButton = UIButton()
        
        
        
        nameLabel.text = currentUserName
        scoreLabel.text =  ("score: \(score)")
        
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        photoButton.setTitle("+", for: .normal)
        photoButton.titleLabel?.font = UIFont(name: "PingFang SC", size: 32)
        
        photoButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(photoButton)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        photoButton.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -70).isActive = true
        photoButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        photoButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        photoButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        photoButton.backgroundColor = .clear
        photoButton.layer.cornerRadius = 50
        
        photoButton.layer.borderWidth = 1
        photoButton.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        logOutButton.setTitle("Logout", for: .normal)
        
        logOutButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 35.0)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.setTitleColor(UIColor.black, for: .normal)
        logOutButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(logOutButton)
        
        logOutButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 70).isActive = true
        
        logOutButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logOutButton.contentMode = .center
        logOutButton.addTarget(self, action: #selector(self.didLogout), for: .touchUpInside)
        
        let photoLabel = UILabel()
        photoLabel.text = "Photo"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoLabel)
        photoLabel.bottomAnchor.constraint(equalTo: photoButton.topAnchor, constant:-30).isActive = true
        photoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoButton.addTarget(self, action: #selector(didPhotoButtonTup), for: .touchDown )
        photoButton.addTarget(self, action: #selector(makeButtonStandart), for: .touchUpInside )
        //photoButton.setTitleColor(UIColor.red, for: .highlighted)
        photoButton.setBackgroundImage(currentUserStruct.readUIImage(), for: .normal)
        if currentUserStruct.readUIImage() != nil
        {
           self.preparePhotoButtonForImage()
        }
        if !itIsCurrentUser {
            logOutButton.isHidden = true
        }
    }
    
    
    func didLogout(){
        
       logoutDelegate.showLogInView()
        
    }
    
    func didPhotoButtonTup(sender: UIButton){
        sender.layer.borderColor = UIColor.blue.cgColor
        sender.layer.borderWidth = 1
        sender.layer.shadowColor = UIColor.blue.cgColor
        sender.layer.shadowRadius = 12
        sender.layer.shadowOpacity = 1
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true){
            
        }
    }
    
    func makeButtonStandart() {
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.borderWidth = 1
        photoButton.layer.shadowOpacity = 0
    }
    
    
    
    func preparePhotoButtonForImage() {
        photoButton.clipsToBounds = true
        photoButton.setTitle("", for: .normal)
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.borderWidth = 1
        photoButton.layer.shadowOpacity = 0

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImage = image
            if  let data = UIImagePNGRepresentation(myImage) {
                let photoURL = getDocumentsDirectory().appendingPathComponent(currentUserName + ".png")
                print("this is current user \(currentUserName)")
                try! data.write(to: photoURL)
            }
            
            photoButton.setBackgroundImage(image, for: .normal)
            self.preparePhotoButtonForImage()
            
        }
        
        
        self.dismiss(animated: true, completion: nil )
        self.makeButtonStandart()
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.makeButtonStandart()
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
}


func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
