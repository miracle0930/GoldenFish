//
//  Self+ConfigureHiddenView.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/5.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension NewUserLocationViewController {
    
    struct HiddenViewStruct {
        
        lazy var addressLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 5, y: 2, width: kScreenWidth - 10, height: 30))
            label.textAlignment = .center
            label.font = UIFont(name: "Chalkboard SE", size: 15)
            label.minimumScaleFactor = 0.5
            return label
        }()
        
        lazy var distanceLabel: UILabel = {
            
            let label = UILabel(frame: CGRect(x: 97, y: 87, width: 100, height: 30))
            label.font = UIFont(name: "Chalkboard SE", size: 15)
            return label
        }()
        
        lazy var photoImageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 40, width: 82, height: 82))
            imageView.image = UIImage(named: "Fish")!
            return imageView
        }()
        
        lazy var nameTextField: UITextField = {
            let textField = UITextField(frame: CGRect(x: 97, y: 50, width: kScreenWidth - 102, height: 30))
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            return textField
        }()
        
        lazy var confirmButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 50, y: 132, width: 100, height: 20))
            button.setTitle("Confirm", for: .normal)
            button.backgroundColor = .blue
            button.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 15)
            return button
        }()
        
        lazy var discardButton: UIButton = {
            let button = UIButton(frame: CGRect(x: kScreenWidth - 150, y: 132, width: 100, height: 20))
            button.setTitle("Discard", for: .normal)
            button.backgroundColor = .red
            button.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 15)
            return button
        }()
    }
    
    
    func configureHiddenView() {
        hiddenView?.backgroundColor = Util.hexStringToUIColor(hex: "#F4EEC0")
        var hiddenViewStruct = HiddenViewStruct()
        hiddenView!.addSubview(hiddenViewStruct.addressLabel)
        hiddenView!.addSubview(hiddenViewStruct.photoImageView)
        hiddenView!.addSubview(hiddenViewStruct.nameTextField)
        hiddenView!.addSubview(hiddenViewStruct.distanceLabel)
        hiddenView!.addSubview(hiddenViewStruct.confirmButton)
        hiddenView!.addSubview(hiddenViewStruct.discardButton)
    }
    
    
}
