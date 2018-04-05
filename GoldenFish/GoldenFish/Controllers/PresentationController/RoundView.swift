//
//  RoundView.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/5.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import Foundation
import UIKit


public class RoundView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func draw(_ rect: CGRect) {
        let color = Util.hexStringToUIColor(hex: "F4EEC0")
        color.set()
        let path = UIBezierPath(ovalIn: rect)
        path.fill()
    }
    
}
