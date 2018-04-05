//
//  BottomPresentation.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/4.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

class BottomPresentation: UIPresentationController {

    var controllerHeight: CGFloat
    
    lazy var blurView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let vc as BasePresentationViewController = presentedViewController {
            controllerHeight = vc.controllerHeight ?? kScreenHeight
        } else {
            controllerHeight = kScreenHeight
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        blurView.alpha = 0
        containerView?.addSubview(blurView)
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 1
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.blurView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: kScreenHeight - controllerHeight, width: kScreenWidth, height: controllerHeight)
    }
}

