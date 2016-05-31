//
//  FNRentalPullToRefreshCellTableViewCell.swift
//  FNRentalPullToRefresh
//
//  Created by Fnoz on 16/5/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNRentalPullToRefreshCellTableViewCell: UITableViewCell {
    var centerImageView: UIImageView = UIImageView.init(frame: CGRectMake(0, 0, 80, 76))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(centerImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
