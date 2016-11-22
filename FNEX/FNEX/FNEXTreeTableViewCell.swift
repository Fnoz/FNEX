//
//  FNEXTreeTableViewCell.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/21.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNEXTreeTableViewCell: UITableViewCell {
    
    var viewNameLabel: UILabel?
    var frameLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewNameLabel = UILabel.init(frame: CGRect.init(x: 15, y: 10, width: self.frame.width, height: 15))
        viewNameLabel?.font = FNEXUtil.fnexFont(size: 15)
        viewNameLabel?.textColor = .black
        contentView.addSubview(viewNameLabel!)
        
        frameLabel = UILabel.init(frame: CGRect.init(x: 20, y: 30, width: self.frame.width, height: 12))
        frameLabel?.font = FNEXUtil.fnexFont(size: 12)
        frameLabel?.textColor = .black
        contentView.addSubview(frameLabel!)
    }
    
    func loadInfo(byView: UIView, leftMargin: Double) {
        viewNameLabel?.text = String.init(format: "-\(type(of: byView)):%p", byView)
        var tmpFrame = viewNameLabel?.frame
        tmpFrame?.origin.x = CGFloat(leftMargin)
        viewNameLabel?.frame = tmpFrame!
        
        frameLabel?.text = "\(byView.frame)"
        tmpFrame = frameLabel?.frame
        tmpFrame?.origin.x = CGFloat(leftMargin + 5)
        frameLabel?.frame = tmpFrame!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
