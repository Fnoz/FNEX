//
//  FNEX.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

var fnexWindow = FNEXWindow.init(frame: UIScreen.main.bounds)

class FNEX {
    class func setup() {
        fnexWindow.rootViewController = FNEXViewController()
        fnexWindow.isHidden = false
        fnexWindow.windowLevel = UIWindowLevelAlert + 1
    }
    
    class func show() {
        fnexWindow.isHidden = false
    }
    
    class func close() {
        fnexWindow.isHidden = true
    }

}
