//
//  LaunchScreenViewController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/3.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    var coverView: UIView?
    @IBOutlet var logoImageView: UIImageView!
    var logoDefaultFrame: CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(hideCoverView), name: NSNotification.Name(rawValue: "hideCoverView"), object: nil)
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        coverView?.backgroundColor = Util.hexStringToUIColor(hex: "#2FE1D6") // light blue color
        view.addSubview(coverView!)
        print(logoImageView.frame)
        logoDefaultFrame = logoImageView.frame

    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            self.logoImageView.frame.origin.y += 20
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        logoImageView.frame = logoDefaultFrame!
    }
    
    @objc func hideCoverView() {
        UIView.animate(withDuration: 1, animations: {
            self.coverView?.alpha = 0
        }) { (_) in
            self.coverView?.removeFromSuperview()
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "hideCoverView"), object: nil)
        }
    }
}
