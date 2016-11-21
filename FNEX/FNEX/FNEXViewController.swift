//
//  FNEXViewController.swift
//  FNEX
//
//  Created by Fnoz on 2016/11/8.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

enum FNEXState {
    case select
    case move
}

class FNEXViewController: UIViewController {
    
    var selectedView: UIView?
    var startRect: CGRect?
    var toolBar: FNEXToolBar?
    var currentState: FNEXState = .select
    var highLightFrameView: UIView?
    var superViewFrameView: UIView?
    var highLightHorizonalEdgeLine0: UIView?
    var highLightHorizonalEdgeLine1: UIView?
    var highLightVerticalEdgeLine0: UIView?
    var highLightVerticalEdgeLine1: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewFrameView = UIView.init(frame: CGRect.zero)
        superViewFrameView?.layer.borderColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        superViewFrameView?.layer.borderWidth = 1
        superViewFrameView?.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.3)
        view.addSubview(superViewFrameView!)
        
        highLightHorizonalEdgeLine0 = UIView.init(frame: CGRect.init(x: 0, y: -1, width: view.frame.width, height: 0.5))
        highLightHorizonalEdgeLine0?.backgroundColor = .red
        view.addSubview(highLightHorizonalEdgeLine0!)
        highLightHorizonalEdgeLine1 = UIView.init(frame: CGRect.init(x: 0, y: -1, width: view.frame.width, height: 0.5))
        highLightHorizonalEdgeLine1?.backgroundColor = .red
        view.addSubview(highLightHorizonalEdgeLine1!)
        highLightVerticalEdgeLine0 = UIView.init(frame: CGRect.init(x: -1, y: 0, width: 0.5, height: view.frame.height))
        highLightVerticalEdgeLine0?.backgroundColor = .red
        view.addSubview(highLightVerticalEdgeLine0!)
        highLightVerticalEdgeLine1 = UIView.init(frame: CGRect.init(x: -1, y: 0, width: 0.5, height: view.frame.height))
        highLightVerticalEdgeLine1?.backgroundColor = .red
        view.addSubview(highLightVerticalEdgeLine1!)
        
        highLightFrameView = UIView.init(frame: CGRect.zero)
        highLightFrameView?.layer.borderColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        highLightFrameView?.layer.borderWidth = 1
        highLightFrameView?.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.3)
        view.addSubview(highLightFrameView!)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(pan:)))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleTap(tap:)))
        view.addGestureRecognizer(tapGesture)
        
        toolBar = FNEXToolBar.init(frame: CGRect.init(x: 0, y: 100, width: view.frame.width, height: 64), iconArray: [UIImage.init(named: "cursor")!, UIImage.init(named: "collect")!, UIImage.init(named: "flow")!, UIImage.init(named: "close")!])
        view.addSubview(toolBar!)
        fnexToolBarClickedBlock = {[unowned self] (btnIndexNumber:NSNumber) in
            switch btnIndexNumber.intValue {
            case 1:
                self.currentState = .select
            case 2:
                self.currentState = .move
            case 3:
                if nil == self.selectedView {
                    break
                }
                let vc = FNEXTreeViewController()
                self.present(vc, animated: true, completion: nil)
                vc.viewArray = FNEXUtil.exploreSuperViewTree(view: self.selectedView!)
                vc.selectedBlock = {[unowned self](view) in
                    if nil != view {
                        self.selectedView = view
                        self.updateSelectedViewInfo()
                    }
                }
            case 4:
                FNEX.close()
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @objc func handlePan(pan: UIPanGestureRecognizer) {
        if currentState != .move || nil == selectedView {
            return
        }
        switch pan.state {
        case .began:
            startRect = selectedView?.frame
        case .changed:
            var newFrame = startRect
            newFrame?.origin.x = (startRect?.origin.x)! + pan.translation(in: selectedView).x
            newFrame?.origin.y = (startRect?.origin.y)! + pan.translation(in: selectedView).y
            selectedView?.frame = newFrame!
        default:
            break
        }
        updateSelectedViewInfo()
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        if currentState != .select {
            return
        }
        switch tap.state {
        case .ended:
            selectedView = FNEXUtil.viewAtPoint(point: tap.location(in: view))
        default:
            break
        }
        updateSelectedViewInfo()
    }
    
    
    func updateSelectedViewInfo() {
        let frame = selectedView?.convert((selectedView?.bounds)!, to: selectedView?.window)
        highLightFrameView?.frame = frame!
        toolBar?.descFrame = (selectedView?.frame)!
        
        highLightHorizonalEdgeLine0?.center = CGPoint.init(x: (highLightHorizonalEdgeLine0?.center.x)!, y: (frame?.minY)!)
        highLightHorizonalEdgeLine1?.center = CGPoint.init(x: (highLightHorizonalEdgeLine0?.center.x)!, y: (frame?.maxY)!)
        highLightVerticalEdgeLine0?.center = CGPoint.init(x: (frame?.minX)!, y: (highLightVerticalEdgeLine0?.center.y)!)
        highLightVerticalEdgeLine1?.center = CGPoint.init(x: (frame?.maxX)!, y: (highLightVerticalEdgeLine0?.center.y)!)
        
        if selectedView?.superview != nil {
            let superView = (selectedView?.superview!.convert((selectedView?.superview!.bounds)!, to: selectedView?.superview!.window))!
            superViewFrameView?.frame = superView
        }
        else {
            superViewFrameView?.frame = CGRect.zero
        }
    }

}
