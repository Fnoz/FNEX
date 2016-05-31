//
//  DefaultView.swift
//  Demo
//
//  Created by 荣浩 on 16/3/3.
//  Copyright © 2016年 荣浩. All rights reserved.
//

import UIKit

public class DefaultDropView: UIView, EasyViewManual {
    // MARK: - constant and veriable and property
    let arrowImage:UIImageView = UIImageView(image: UIImage(named: "icon_arrow.png", inBundle: NSBundle(forClass: DefaultDropView.self), compatibleWithTraitCollection: nil))
    let indicatorView: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    let titleLabel:UILabel = UILabel()
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - public method
    public func showManualPulling(progress:CGFloat) {
        arrowImage.hidden = false
        indicatorView.hidden = true
        titleLabel.text = "Pull to refresh..."
        UIView.animateWithDuration(0.4) { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(0);
        }
    }
    
    public func showManualPullingOver() {
        titleLabel.text = "Release to refresh..."
        UIView.animateWithDuration(0.4) { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
        }
    }
    
    public func showManualExcuting() {
        arrowImage.hidden = true
        indicatorView.hidden = false
        titleLabel.text = "Loading..."
    }
    
    public func resetManual() {
        arrowImage.hidden = true
        indicatorView.hidden = true
        titleLabel.text = ""
        arrowImage.transform = CGAffineTransformMakeRotation(0);
    }
    
    // MARK: - private method
    private func initView() {
        backgroundColor = UIColor.whiteColor()
        
        let width = frame.size.width,
        height = frame.size.height
        
        arrowImage.frame = CGRectMake(width * 0.5 - 50, height * 0.5, 10, 13)
        arrowImage.hidden = true
        addSubview(arrowImage)
        
        indicatorView.frame = CGRectMake(width * 0.5 - 50, height * 0.5, 10, 13)
        indicatorView.startAnimating()
        addSubview(indicatorView)
        
        titleLabel.frame = CGRectMake(width * 0.5 - 27, height * 0.5 - 3, 150, 20)
        titleLabel.font = UIFont.systemFontOfSize(14.0)
        titleLabel.textColor = UIColor.blackColor()
        addSubview(titleLabel)
    }
}

public class DefaultUpView: UIView, EasyViewManual, EasyViewAutomatic {
    // MARK: - constant and veriable and property
    let arrowImage:UIImageView = UIImageView(image: UIImage(named: "icon_arrow.png", inBundle: NSBundle(forClass: DefaultDropView.self), compatibleWithTraitCollection: nil))
    let indicatorView: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    let titleLabel:UILabel = UILabel()
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - EasyViewManual
    public func showManualPulling(progress:CGFloat) {
        arrowImage.hidden = false
        indicatorView.hidden = true
        titleLabel.text = "Pull to load more..."
        UIView.animateWithDuration(0.4) { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
        }
    }
    
    public func showManualPullingOver() {
        titleLabel.text = "Release to load more..."
        UIView.animateWithDuration(0.4) { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2));
        }
    }
    
    public func showManualExcuting() {
        arrowImage.hidden = true
        indicatorView.hidden = false
        titleLabel.text = "Loading..."
    }
    
    public func resetManual() {
        arrowImage.hidden = true
        indicatorView.hidden = true
        titleLabel.text = ""
        arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
    }
    
    // MARK: - EasyViewAutomatic
    public func showAutomaticPulling(progress: CGFloat) {
        indicatorView.hidden = true
        titleLabel.text = "Pull to load more"
    }
    
    public func showAutomaticExcuting() {
        indicatorView.hidden = false
        titleLabel.text = "Loading..."
    }
    
    public func showAutomaticUnable() {
        indicatorView.hidden = true
        titleLabel.text = "Nothing more..."
    }
    
    public func resetAutomatic() {
        arrowImage.hidden = true
        indicatorView.hidden = true
        titleLabel.text = ""
    }
    
    // MARK: - private method
    private func initView() {
        backgroundColor = UIColor.whiteColor()
        
        let width = frame.size.width,
        height = frame.size.height
        
        arrowImage.frame = CGRectMake(width * 0.5 - 50, height * 0.5 - 10, 10, 13)
        arrowImage.hidden = true
        arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        addSubview(arrowImage)
        
        indicatorView.frame = CGRectMake(width * 0.5 - 50, height * 0.5 - 10, 10, 13)
        indicatorView.startAnimating()
        addSubview(indicatorView)
        
        titleLabel.frame = CGRectMake(width * 0.5 - 27, height * 0.5 - 13, 150, 20)
        titleLabel.font = UIFont.systemFontOfSize(14.0)
        titleLabel.textColor = UIColor.blackColor()
        addSubview(titleLabel)
    }
}
