//
//  FNEXToolBar.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let tagOri = 100

public typealias FNEXToolBarClickedBlock = ((_ btnIndexNumber:NSNumber) -> ())

var fnexToolBarClickedBlock = { (btnIndexNumber:NSNumber) in
    print("fnexToolBarClickedBlock:\(btnIndexNumber)")
}

class FNEXToolBar: UIView {
    var startRect: CGRect?
    var iconArray: NSArray = []

    private var selectFlagView: UIView?
    var xLabel: UILabel?
    var yLabel: UILabel?
    
    init(frame: CGRect, iconArray:Array<Any>) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(white: 1, alpha: 0.95)
        layer.shadowColor = UIColor.init(white: 0.6, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        
        var iconArrayAll = iconArray
        iconArrayAll.insert(UIImage.init(named: "menu")!, at: 0)
        let btnWidth = Double(kScreenWidth) / Double(iconArrayAll.count)
        for index in 0 ... iconArrayAll.count - 1 {
            let btn = UIButton.init(frame: CGRect.init(x: btnWidth * Double(index), y: 0, width: btnWidth, height: 44))
            btn.tag = tagOri + index
            btn.setImage(iconArrayAll[index] as? UIImage, for: .normal)
            btn.imageEdgeInsets = UIEdgeInsetsMake(10, CGFloat((btnWidth - 24) * 0.5), 10, CGFloat((btnWidth - 24) * 0.5))
            addSubview(btn)
            
            if 0 == index {
                let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(pan:)))
                btn.addGestureRecognizer(panGesture)
            }
            else {
                btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
            }
        }
        
        let cursorBtn = self.viewWithTag(tagOri + 1)
        selectFlagView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        selectFlagView?.isUserInteractionEnabled = false
        selectFlagView?.layer.borderColor = UIColor.init(red: 2/255.0, green: 185/255.0, blue: 209/255.0, alpha: 1).cgColor
        selectFlagView?.layer.borderWidth = 2
        selectFlagView?.layer.cornerRadius = 15
        selectFlagView?.backgroundColor = .clear
        selectFlagView?.center = (cursorBtn?.center)!
        addSubview(selectFlagView!)
        
        
        let point0 = UIView.init(frame: CGRect.init(x: 12, y: 51, width: 6, height: 6))
        point0.backgroundColor = .red
        point0.layer.cornerRadius = 3
        addSubview(point0)
        
        xLabel = UILabel.init(frame: CGRect.init(x: 30, y: 44, width: kScreenWidth - 30, height: 20))
        xLabel?.font = FNEXUtil.fnexFont(size: 12)
        xLabel?.textColor = .gray
        xLabel?.text = "Select a view first"
        addSubview(xLabel!)
        
        let point1 = UIView.init(frame: CGRect.init(x: 12, y: 51 + 20, width: 6, height: 6))
        point1.backgroundColor = .green
        point1.layer.cornerRadius = 3
        addSubview(point1)
        
        yLabel = UILabel.init(frame: CGRect.init(x: 30, y: 44 + 20, width: kScreenWidth - 30, height: 20))
        yLabel?.font = FNEXUtil.fnexFont(size: 12)
        yLabel?.textColor = .gray
        yLabel?.text = "And just play!"
        addSubview(yLabel!)
    }
    
    @objc func handlePan(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            startRect = frame
        case .changed:
            var newFrame = startRect
            newFrame?.origin.y = (startRect?.origin.y)! + pan.translation(in: self).y
            frame = newFrame!
        default:
            break
        }
    }
    
    func btnClicked(btn: UIButton) {
        switch btn.tag - tagOri {
        case 1,2:
            UIView.animate(withDuration: 0.5) {
                self.selectFlagView?.center = btn.center
            }
        default:
            break
        }
        fnexToolBarClickedBlock(NSNumber.init(integerLiteral: btn.tag - tagOri))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
