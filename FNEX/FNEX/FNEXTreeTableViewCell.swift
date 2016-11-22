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
    var fnViewName = ""
    var fnViewInfo = ""
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewNameLabel = UILabel.init(frame: CGRect.init(x: 15, y: 10, width: kScreenWidth, height: 15))
        viewNameLabel?.font = FNEXUtil.fnexFont(size: 15)
        viewNameLabel?.textColor = .black
        contentView.addSubview(viewNameLabel!)
        
        frameLabel = UILabel.init(frame: CGRect.init(x: 20, y: 30, width: kScreenWidth, height: 12))
        frameLabel?.font = FNEXUtil.fnexFont(size: 12)
        frameLabel?.textColor = .black
        contentView.addSubview(frameLabel!)
        
        let detailBtn = UIButton.init(frame: CGRect.init(x: kScreenWidth - 44, y: 0, width: 44, height: 44))
        detailBtn.setImage(UIImage.init(named: "info"), for: .normal)
        detailBtn.addTarget(self, action: #selector(detailBtnClicked), for: .touchUpInside)
        contentView.addSubview(detailBtn)
    }
    
    func loadInfo(byView: UIView, leftMargin: Double) {
        viewNameLabel?.text = String.init(format: "-\(type(of: byView)):%p", byView)
        var tmpFrame = viewNameLabel?.frame
        tmpFrame?.origin.x = CGFloat(leftMargin)
        tmpFrame?.size.width = kScreenWidth - (tmpFrame?.origin.x)! - 44
        viewNameLabel?.frame = tmpFrame!
        
        frameLabel?.text = "\(byView.frame)"
        tmpFrame = frameLabel?.frame
        tmpFrame?.origin.x = CGFloat(leftMargin + 5)
        tmpFrame?.size.width = kScreenWidth - (tmpFrame?.origin.x)! - 5
        frameLabel?.frame = tmpFrame!
        
        fnViewName = "\(type(of: byView))"
        fnViewInfo = byView.infoStr()
    }
    
    func detailBtnClicked() {
        
        var fnexWindow = UIApplication.shared.keyWindow
        let windowArray = UIApplication.shared.windows
        for window in windowArray {
            if window.isKind(of: FNEXWindow.self) {
                fnexWindow = window
                break
            }
        }
        
        let vc = FNEXUtil.currentTopViewController(rootViewController: (fnexWindow?.rootViewController)!)
        let alert = UIAlertController(title: fnViewName, message: fnViewInfo, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Well", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
