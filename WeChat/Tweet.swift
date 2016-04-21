//
//  Tweet.swift
//  WeChatMoments
//
//  Created by Haibin Wang on 4/6/16.
//  Copyright © 2016 Lei Huang. All rights reserved.
//

struct Tweet {
    let content: String?
    let images: [String]?
    let sender: User
    let comments: [Comment]?
}

struct Comment {
    let content: String
    let sender: User
}

struct User {
    let username: String
    let nick: String
    let avatar: String
}

