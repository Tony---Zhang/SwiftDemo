//
//  HeaderCell.swift
//  WeChat
//
//  Created by Shuai Zhang on 5/4/16.
//  Copyright © 2016 ZhangShuai. All rights reserved.
//

import UIKit
import Kingfisher

class HeaderCell: UIView {
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    func bind(user: User?) {
        if let avatarURL = user?.avatar, url = NSURL(string: avatarURL) {
            avatar.kf_setImageWithURL(url)
        }
        
        if let bgURL = user?.background, url = NSURL(string: bgURL) {
            bg.kf_setImageWithURL(url)
        }
        
        if let userName = user?.username {
            name.text = userName
        }
    }
}
