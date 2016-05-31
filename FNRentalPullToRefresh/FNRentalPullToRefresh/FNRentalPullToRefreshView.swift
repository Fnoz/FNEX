//
//  FNRentalPullToRefreshAnimator.swift
//  FNRentalPullToRefresh
//
//  Created by Fnoz on 16/5/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import EasyPull
import DKChainableAnimationKit

public class FNRentalPullToRefreshHeaderView: UIView, EasyViewManual, EasyViewAutomatic {
    let sky :UIImageView = UIImageView()
    let building : UIImageView = UIImageView()
    let sun : UIImageView = UIImageView()
    var isAnimating = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func showManualPulling(progress:CGFloat) {
        if progress<0.2 {
            resetManual()
        }
        print(progress)
        var rect = sun.frame;
        rect.size.width = (42/28.0-1)*progress * 28 + 28
        rect.size.height = (42/28.0-1)*progress * 28 + 28
        rect.origin.y = (1-progress*0.9)*frame.size.height
        rect.origin.x = bounds.size.width/3 - (42/28.0-1)*progress * 28 / 2
        sun.frame = rect
    }
    
    public func showManualPullingOver() {
        if !isAnimating {
            isAnimating = true
            var rotationAnimation: CABasicAnimation
            rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = CFloat((M_PI*2.0))
            rotationAnimation.duration = 0.7
            rotationAnimation.cumulative = true
            rotationAnimation.repeatCount = 1024
            rotationAnimation.removedOnCompletion = false
            rotationAnimation.fillMode = kCAFillModeForwards
            sun.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        }
    }
    
    public func showManualExcuting() {}
    
    public func resetManual() {
        isAnimating = false
        sun.layer.removeAllAnimations()
    }
    
    public func showAutomaticPulling(progress: CGFloat) {
    }
    
    public func showAutomaticExcuting() {
    }
    
    public func showAutomaticUnable() {
    }
    
    public func resetAutomatic() {
    }
    
    private func initView() {
        clipsToBounds = true
        
        sky.frame = bounds
        sky.image = UIImage.init(named: "sky")
        addSubview(sky)
        
        sun.frame = CGRectMake(bounds.size.width/3, sky.frame.size.height, 42, 42)
        sun.image = UIImage.init(named: "sun")
        addSubview(sun)
        
        building.frame = CGRectMake(0, bounds.size.height - 72, bounds.size.width, 72)
        building.image = UIImage.init(named: "buildings")
        addSubview(building)
    }
}
