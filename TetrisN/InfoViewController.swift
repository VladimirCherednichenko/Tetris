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
import FBSDKShareKit
import Social
protocol LogoutDelegate
{
    func showLogInView()
}
class InfoViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    private let currentUserName:String
    private let score:Int
    private var myImage = UIImage()
    let logoutDelegate:LogoutDelegate
    private let itIsCurrentUser:Bool
    private let photoButton = UIButton()
    private let imagePicker =  UIImagePickerController()
    private let currentUserStruct:User
    
    init(_ currentUser:User, _ logoutDelegate:LogoutDelegate,_ itIsCurrentUser:Bool)
    {
        self.itIsCurrentUser = itIsCurrentUser
        self.logoutDelegate = logoutDelegate
        self.currentUserStruct = currentUser
        self.currentUserName = currentUser.name
        self.score = currentUser.score
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
    }
    
    override func viewDidLoad()
    {
        // TODO: lets make LoginViewLayout class which will do constraints code. Ask me about examples.
        
        UIApplication.shared.statusBarStyle = .default
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let nameLabel = UILabel()
        nameLabel.text = currentUserName
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.center.equalTo(view)
        }
        photoButton.setTitle("+", for: .normal)
        photoButton.titleLabel?.font = UIFont(name: "PingFang SC", size: 32)
        photoButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(photoButton)
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
        scoreLabel.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom)
            
        }
        let logOutButton = UIButton()
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.titleLabel?.font = UIFont(name: "XPED Shadow", size: 35.0)
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
        view.addSubview(photoLabel)
        photoLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        photoButton.addTarget(self, action: #selector(didPhotoButtonTup), for: .touchDown )
        photoButton.addTarget(self, action: #selector(makeButtonStandart), for: .touchUpInside )
        photoButton.setBackgroundImage(currentUserStruct.readUIImage(), for: .normal)
        let facebookShareButton = UIButton()
        facebookShareButton.setImage(#imageLiteral(resourceName: "facebookImage"), for: .normal)
        facebookShareButton.addTarget(self, action: #selector(self.didFacebookShare), for: .touchUpInside)
        view.addSubview(facebookShareButton)
        
        facebookShareButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(scoreLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        if currentUserStruct.readUIImage() != nil {
            self.preparePhotoButtonForImage()
        }
        if !itIsCurrentUser {
            logOutButton.isHidden = true
            facebookShareButton.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func didLogout()
    {
        
        logoutDelegate.showLogInView()
        
    }
    func didFacebookShare()
    {
        if let facebookView = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            facebookView.setInitialText("Hi, I achieved \(score) points in(at) Tetris, try by yourself")
            self.view?.window?.rootViewController?.present(facebookView, animated: true, completion: nil)
        }
    }
    
    func didPhotoButtonTup(sender: UIButton)
    {
        sender.layer.borderColor = UIColor.blue.cgColor
        sender.layer.borderWidth = 1
        sender.layer.shadowColor = UIColor.blue.cgColor
        sender.layer.shadowRadius = 12
        sender.layer.shadowOpacity = 1
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true) {
            
        }
    }
    
    func makeButtonStandart()
    {
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.borderWidth = 1
        photoButton.layer.shadowOpacity = 0
    }
    
    func preparePhotoButtonForImage()
    {
        photoButton.clipsToBounds = true
        photoButton.setTitle("", for: .normal)
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.borderWidth = 1
        photoButton.layer.shadowOpacity = 0
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
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
func getDocumentsDirectory()
    -> URL
{
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
