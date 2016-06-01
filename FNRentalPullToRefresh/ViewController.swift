//
//  ViewController.swift
//  FNRentalPullToRefresh
//
//  Created by Fnoz on 16/5/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import EasyPull

class ViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource {
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64), style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.backgroundColor = UIColor.init(red: 50/255.0, green: 175/255.0, blue: 195/255.0, alpha: 1)
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        
        func delayStopDrop() {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                self.tableView.easy_stopDropPull()
            })
        }
        
        let customDropView = FNRentalPullToRefreshHeaderView.init(frame: CGRectMake(0, -110, self.view.frame.size.width, 110))
        tableView.easy_addDropPull({ 
            NSLog("Run")
            delayStopDrop()
            }, customDropView: customDropView);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: FNRentalPullToRefreshCellTableViewCell? = tableView.dequeueReusableCellWithIdentifier("FNRentalPullToRefreshCellTableViewCell") as? FNRentalPullToRefreshCellTableViewCell
        if (cell == nil) {
            cell = FNRentalPullToRefreshCellTableViewCell(style: .Default, reuseIdentifier: "FNRentalPullToRefreshCellTableViewCell")
        }
        switch indexPath.row%3 {
        case 0:
            cell?.contentView.backgroundColor = UIColor.init(red: 239/255.0, green: 149/255.0, blue: 43/255.0, alpha: 1)
            break
        case 1:
            cell?.contentView.backgroundColor = UIColor.init(red: 82/255.0, green: 44/255.0, blue: 61/255.0, alpha: 1)
            break
        case 2:
            cell?.contentView.backgroundColor = UIColor.init(red: 227/255.0, green: 77/255.0, blue: 78/255.0, alpha: 1)
            break
        default:
            break
        }
        cell?.centerImageView.image = UIImage.init(named: NSString.init(format: "icn_%d", (indexPath.row+1)%3) as String)
        cell?.centerImageView.center = CGPointMake(view.bounds.size.width/2, 85)
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
}

