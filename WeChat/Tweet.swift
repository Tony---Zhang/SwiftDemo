//
//  Tweet.swift
//  WeChatMoments
//
//  Created by Haibin Wang on 4/6/16.
//  Copyright © 2016 Lei Huang. All rights reserved.
//

import ObjectMapper

struct Tweets : Mappable {
    var tweets: [Tweet]?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        tweets      <- map["tweets"]
    }
}

struct Tweet : Mappable {
    var content: String?
    var images: [String]?
    var sender: User?
    var comments: [Comment]?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        content     <- map["content"]
        images      <- map["images"]
        sender      <- map["sender"]
        comments    <- map["comments"]
    }
}

struct Comment : Mappable {
    var content: String?
    var sender: User?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        content     <- map["content"]
        sender      <- map["sender"]
    }
}

struct User : Mappable {
    var username: String?
    var nick: String?
    var avatar: String?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        username    <- map["username"]
        nick        <- map["nick"]
        avatar      <- map["avatar"]
    }
}

