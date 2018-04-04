//
//  BasePresentationController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/4.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

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


final class LocationsPresentationController: BasePresentationViewController {
    
    override var controllerHeight: CGFloat {
        return 500
    }
    
    lazy var sureButton:UIButton = {
        let button = UIButton(frame: CGRect(x: kScreenWidth - 60, y: 0, width: 40, height: 40))
        button.setImage(UIImage(named: "hide"), for: .normal)
        button.backgroundColor = Util.hexStringToUIColor(hex: "#F4EEC0")
        button.addTarget(self, action: #selector(sureButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 75, width: kScreenWidth, height: kScreenHeight-75))
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame:CGRect(x: (kScreenWidth-150)/2, y: 20, width: 150, height: 30))
        label.textAlignment = .center
        label.text = "Locations"
        label.font = UIFont(name: "Chalkboard SE", size: 20)
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    lazy var locationsTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 2, y: 2, width: kScreenWidth - 4, height: 500))
        tableView.backgroundColor = Util.hexStringToUIColor(hex: "#F4EEC0")
        return tableView
    }()
    
    lazy var roundView: RoundView = {
        let roundView = RoundView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        roundView.backgroundColor = .clear
        return roundView
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        view.backgroundColor = UIColor.clear
        view.addSubview(roundView)
        roundView.addSubview(titleLabel)
        view.addSubview(containerView)
        view.addSubview(sureButton)
        containerView.addSubview(locationsTableView)
    }
    
    @objc func sureButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}


//extension LocationsPresentationController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return tableView.cellForRow(at: indexPath)!
//    }
//
//
//}
