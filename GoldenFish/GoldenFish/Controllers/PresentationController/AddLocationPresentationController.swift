//
//  AddLocationPresentationController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/5.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit


final class AddLocationPresentationController: BasePresentationViewController {
    
    override var controllerHeight: CGFloat {
        return 300
    }
    
    lazy var locationAddressLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 2, y: 2, width: kScreenWidth - 4, height: 30))
        label.font = UIFont(name: "Chalkboard SE", size: 20)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var locationPhotoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 2, y: 34, width: 82, height: 82))
        return imageView
    }()
    
    lazy var locationNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 86, y: 34, width: kScreenWidth - 88, height: 30))
        return textField
    }()
    
    lazy var locationDistanceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: kScreenWidth - 32, y: 86, width: 60, height: 30))
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(locationAddressLabel)
        view.addSubview(locationPhotoImageView)
        view.addSubview(locationNameTextField)
        view.addSubview(locationDistanceLabel)
    }
}
