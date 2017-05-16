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
    private var currentUserName:String
    private var score:Int
    private var myImage = UIImage()
    let logoutDelegate:LogoutDelegate
    private var itIsCurrentUser:Bool
    private var imagePicker =  UIImagePickerController()
    private var currentUserStruct:User
    private var layout:InfoViewLayout!
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
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .default
        self.layout = InfoViewLayout (view: view)
        layout.scoreLabel.text =  ("score: \(score)")
        layout.logOutButton.addTarget(self, action: #selector(self.didLogout), for: .touchUpInside)
        layout.photoLabel.text = "Photo"
        layout.photoButton.addTarget(self, action: #selector(didPhotoButtonTup), for: .touchDown )
        layout.photoButton.addTarget(self, action: #selector(makeButtonStandart), for: .touchUpInside )
        layout.photoButton.setBackgroundImage(currentUserStruct.readUIImage(), for: .normal)
        
        if currentUserStruct.readUIImage() != nil {
            layout.preparePhotoButtonForImage()
        }
        if !itIsCurrentUser {
            layout.logOutButton.isHidden = true
            layout.facebookShareButton.isHidden = true
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
        layout.photoButton.layer.borderColor = UIColor.black.cgColor
        layout.photoButton.layer.borderWidth = 1
        layout.photoButton.layer.shadowOpacity = 0
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage = image
            if  let data = UIImagePNGRepresentation(myImage) {
                let photoURL = getDocumentsDirectory().appendingPathComponent(currentUserName + ".png")
                print("this is current user \(currentUserName)")
                try! data.write(to: photoURL)
            }
            layout.photoButton.setBackgroundImage(image, for: .normal)
            layout.preparePhotoButtonForImage()
            
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
