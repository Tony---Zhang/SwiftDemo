//
//  MomentCell.swift
//  WeChatMoments
//
//  Created by Haibin Wang on 3/30/16.
//  Copyright © 2016 Lei Huang. All rights reserved.
//

import UIKit

class MomentCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var tweetUserName: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var commentUser: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    @IBOutlet var images: [UIImageView]!
    
    func bindData(tweet : Tweet) {
        avatar.image = UIImage(named: tweet.sender.avatar)
        tweetUserName.text = tweet.sender.username
        tweetContent.text = tweet.content
        
        images.forEach {
            $0.image = nil
            $0.hidden = true
        }

        guard let imgArr = tweet.images else {
            return
        }
        
        for i in 0..<imgArr.count {
            images[i].image = UIImage(named: imgArr[i])
            images[i].hidden = false
        }
        
        commentUser.text = tweet.comments?.first?.sender.username
        comment.text = tweet.comments?.first?.content
    }
    
}
