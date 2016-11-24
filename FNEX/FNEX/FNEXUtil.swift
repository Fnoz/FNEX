//
//  FNEXUtil.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width

class FNEXUtil {
    class func allWindow() -> Array<UIWindow> {
        let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as! UIWindow
        var windowArray = UIApplication.shared.windows
        windowArray.append(statusBarWindow)
        return windowArray
    }
    
    class func viewAtPoint(point: CGPoint) -> UIView? {
        var tmpView: UIView? = UIApplication.shared.keyWindow
        for window in allWindow() {
            if ((window as AnyObject).isKind(of: FNEXWindow.self)
                || (window as AnyObject).isKind(of: NSClassFromString("UITextEffectsWindow").self!)
                || (window as AnyObject).isKind(of: NSClassFromString("UIRemoteKeyboardWindow").self!)){
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
    
    class func fnexFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Courier", size: size)!
    }
    
    class func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }
}
