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
    
    class Config {
        static let server: String = "http://127.0.0.1:4000/"
        static let tweet: String = "tweets"
        static let profile: String = "profile"
        
        static func tweetUrl() -> String {
            return server + tweet
        }
        
        static func profileUrl() -> String {
            return server + profile
        }
    }
    
    static func fetchData(completionHandler:Tweets? -> Void) {
        fetch(Config.tweetUrl(), completionHandler: completionHandler)
    }
    
    static func fetchProfile(completionHandler:User? -> Void) {
        fetch(Config.profileUrl(), completionHandler: completionHandler)
    }
    
    private static func fetch<T: Mappable>(url: String, completionHandler:T? -> Void) {
        Alamofire.request(
            .GET, url)
            .responseString {
                if let json = $0.result.value {
                    let data = Mapper<T>().map(json)
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
        }
    }
    
}