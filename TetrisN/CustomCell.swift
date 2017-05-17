//
//  CustomCell.swift
//  TetrisN
//
//  Created by Vladimir on 17.05.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class CustomeCell:UICollectionViewCell
{
    let nameLabel = UILabel()
    let scoreLabel = UILabel()
    var icon = UIImageView()
    
    
    
    func setLabeltext(name:String, score:String)
    {
        self.nameLabel.text = name
        self.nameLabel.textColor = UIColor.white
        self.scoreLabel.text = score
        self.scoreLabel.textColor = UIColor.white
    }
    
    func setImage(image:UIImage?)
    {
        if image != nil {
            self.icon.alpha = 0.0
            self.icon.image = image
            UIView.animate(withDuration: 0.5, animations: {
                self.icon.alpha = 1.0
            })
            
        } else {
            
            self.icon.image = #imageLiteral(resourceName: "defaultImage")
        }
        
        self.setLabelsAndImageView()
    }
    
    func setLabelsAndImageView()
    {
        self.icon.isHidden = false
        addSubview(nameLabel)
        addSubview(scoreLabel)
        addSubview(icon)
        icon.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.snp.top).offset(2)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        icon.clipsToBounds = true
        icon.layer.borderColor = UIColor.black.cgColor
        icon.layer.borderWidth = 1
        icon.layer.cornerRadius = 40
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(icon.snp.bottom).offset(2)
            make.centerX.equalTo(self.snp.centerX)
            
        }
        scoreLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}
