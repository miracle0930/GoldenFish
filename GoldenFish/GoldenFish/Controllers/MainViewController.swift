//
//  LaunchScreenViewController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/3.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var coverView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(hideCoverView), name: NSNotification.Name(rawValue: "hideCoverView"), object: nil)
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        coverView?.backgroundColor = Util.hexStringToUIColor(hex: "#2FE1D6")
        view.addSubview(coverView!)
    }
    
    @objc func hideCoverView() {
        UIView.animate(withDuration: 1, animations: {
            self.coverView?.alpha = 0
        }) { (_) in
            self.coverView?.removeFromSuperview()
        }
    }
}
