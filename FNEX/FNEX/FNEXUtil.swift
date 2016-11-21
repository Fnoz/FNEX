//
//  FNEXUtil.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit


class FNEXUtil {
    class func allWindow() -> Array<UIWindow> {
        let windowArrayRetain = UIWindow.self.perform(NSSelectorFromString("allWindowsIncludingInternalWindows:onlyVisibleWindows:"), with: NSNumber.init(value: true), with: NSNumber.init(value: false))
        let windowArray = windowArrayRetain?.takeUnretainedValue() as! Array<UIWindow>
        return windowArray as Array
    }
    
    class func viewAtPoint(point: CGPoint) -> UIView? {
        var tmpView: UIView? = UIApplication.shared.keyWindow
        for window in allWindow() {
            if (window as AnyObject).isKind(of: FNEXWindow.self) {
                continue
            }
            if viewAtPoint(point: point, inView: window as UIView) != nil {
                tmpView = viewAtPoint(point: point, inView: window as UIView)
            }
        }
        
        return tmpView
    }
    
    class func viewAtPoint(point: CGPoint, inView: UIView) -> UIView? {
        var tmpView: UIView?
        for view in (inView.subviews) {
            if view.isHidden || view.alpha < 0.01 {
                continue
            }
            if view.convert(view.bounds, to: view.window).contains(point) {
                tmpView = view
                if viewAtPoint(point: point, inView: view) != nil {
                    tmpView = viewAtPoint(point: point, inView: view)
                }
            }
        }
        return tmpView
    }
    
    class func exploreSuperViewTree(view: UIView) -> Array<UIView> {
        var array = [view]
        var tmpView = view
        while tmpView.superview != nil {
            array.insert(tmpView.superview!, at: 0)
            tmpView = tmpView.superview!
        }
        return array
    }
}
