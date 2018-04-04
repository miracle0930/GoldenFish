//
//  UIViewControllerExtension.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/4.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UIViewControllerTransitioningDelegate {
    
    public func presentBottom(_ vc: BasePresentationViewController.Type) {
        let controller = vc.init()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = PresentBottom(presentedViewController: presented, presenting: presenting)
        return present
    }
    
}
