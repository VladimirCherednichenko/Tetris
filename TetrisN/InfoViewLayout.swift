//
//  InfoViewLayout.swift
//  TetrisN
//
//  Created by Vladimir on 12.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class InfoViewLayout
{
    // TODO: lets make LoginViewLayout class which will do constraints code. Ask me about examples.
    var nameLabel:UILabel = {
        let label = UILabel ()
        return label
    } ()
    var photoButton:UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "PingFang SC", size: 32)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    } ()
    var scoreLabel:UILabel = {
        let label = UILabel ()
        
        return label
    } ()
    
    var logOutButton:UIButton = {
        let button = UIButton ()
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = UIFont(name: "XPED Shadow", size: 35.0)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.contentMode = .center
        return button
    } ()
    
    
    var photoLabel:UILabel = {
        let label = UILabel()
        return label
    } ()
    var facebookShareButton:UIButton = {
        let button = UIButton ()
        button.setImage(#imageLiteral(resourceName: "facebookImage"), for: .normal)
        return button
    } ()
    
    init (view:UIView)
    {
        
        view.backgroundColor = UIColor.white
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.center.equalTo(view)
        }
        view.addSubview(photoButton)
        photoButton.snp.makeConstraints{(make) -> Void in
            make.bottom.equalTo(nameLabel.snp.top).offset(-70)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        view.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom)
        }
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(scoreLabel.snp.bottom).offset(70)
            make.width.equalTo(200)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
        }
        view.addSubview(photoLabel)
        photoLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(facebookShareButton)
        facebookShareButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(scoreLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    func preparePhotoButtonForImage()
    {
        photoButton.clipsToBounds = true
        photoButton.setTitle("", for: .normal)
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.borderWidth = 1
        photoButton.layer.shadowOpacity = 0
        
    }
}
