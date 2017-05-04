//
//  infoViewConroller.swift
//  Tetris
//
//  Created by pc on 31.03.17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


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
        
        
        
        
        
        nameLabel.text = currentUserName
        
       
        
        
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.snp.makeConstraints{(make) -> Void in
        make.center.equalTo(view)
        }
        
        
        
        photoButton.setTitle("+", for: .normal)
        photoButton.titleLabel?.font = UIFont(name: "PingFang SC", size: 32)
        
        photoButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(photoButton)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        
        photoButton.snp.makeConstraints{(make) -> Void in
            make.bottom.equalTo(nameLabel.snp.top).offset(-70)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        photoButton.backgroundColor = .clear
        photoButton.layer.cornerRadius = 50
        photoButton.layer.borderWidth = 1
        photoButton.layer.borderColor = UIColor.black.cgColor
        
        
        
        let scoreLabel = UILabel()
        scoreLabel.text =  ("score: \(score)")
        view.addSubview(scoreLabel)
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom)
            
        }
        
        
        
        let logOutButton = UIButton()
        
        logOutButton.setTitle("Logout", for: .normal)
        
        logOutButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 35.0)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.setTitleColor(UIColor.black, for: .normal)
        logOutButton.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(logOutButton)
        
        
        
        logOutButton.snp.makeConstraints{(make) -> Void in
        make.top.equalTo(scoreLabel.snp.bottom).offset(70)
        
        }
        logOutButton.snp.makeConstraints{ (make) -> Void in
            make.width.equalTo(200)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
        }
        
        
        logOutButton.contentMode = .center
        logOutButton.addTarget(self, action: #selector(self.didLogout), for: .touchUpInside)
        
        let photoLabel = UILabel()
        photoLabel.text = "Photo"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(photoLabel)
        photoLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
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
