//
//  MomentsTableViewController.swift
//  WeChat
//
//  Created by Shuai Zhang on 4/20/16.
//  Copyright © 2016 ZhangShuai. All rights reserved.
//

import UIKit

class MomentsTableViewController: UITableViewController {
  
    var tweets: [Tweet]?

    override func viewDidLoad() {
        super.viewDidLoad()
        MockData.fetchData({ (tweets) in
            self.tweets = tweets?.tweets
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweetsCount = tweets?.count {
            return tweetsCount
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Moments", forIndexPath: indexPath) as! MomentCell

        if let tweets = tweets {
            cell.bindData(tweets[indexPath.row])
        }
        return cell
    }

}
