//
//  MockData.swift
//  WeChatMoments
//
//  Created by Haibin Wang on 4/6/16.
//  Copyright © 2016 Lei Huang. All rights reserved.
//

import Alamofire
import ObjectMapper

struct MockData {
//    static func mockData() -> [Tweet] {
//        let mrSong = User(username:"宋仲基", nick: "", avatar: "MrSong")
//        let comments = [Comment(content: "This is comment", sender: mrSong)]
//        let t1 = Tweet(content: "Nice to meet you", images: ["pic1", "pic2", "pic3"], sender: mrSong, comments: comments)
//
//        return [t1, t1, t1]
//    }
    
    static func fetchData(completionHandler:Tweets? -> Void) {
        Alamofire.request(
            .GET, "http://127.0.0.1:4000/tweets")
            .responseString {
                if let json = $0.result.value {
                    let tweets = Mapper<Tweets>().map(json);
                    completionHandler(tweets)
                } else {
                    completionHandler(nil)
                }
            }
    }
    
}