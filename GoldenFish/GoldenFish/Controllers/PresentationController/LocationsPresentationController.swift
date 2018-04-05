//
//  LocationsPresentationController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/4.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

final class LocationsPresentationController: BasePresentationViewController {
    
    var locations = [UserLocation]()
    
    override var controllerHeight: CGFloat {
        return 500
    }
    
    lazy var sureButton: UIButton = {
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
        tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "locationTableViewCell")
        tableView.backgroundColor = Util.hexStringToUIColor(hex: "#F4EEC0")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 94
        return tableView
    }()
    
    lazy var roundView: RoundView = {
        let roundView = RoundView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        roundView.backgroundColor = .clear
        return roundView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = UserLocation()
        location.locationName = "This is my company"
        location.locationAddress = "1600 Amphitheatre Pkwy, Mountain View, CA 94043"
        location.locationDistance = "0.1mi"
        locations.append(location)
        locations.append(location)
        configurePresentationView()
    }
    
    private func configurePresentationView() {
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


extension LocationsPresentationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationTableViewCell", for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none
        cell.locationName.text = locations[indexPath.row].locationName
        cell.locationAddress.text = locations[indexPath.row].locationAddress
        cell.locationDistance.text = locations[indexPath.row].locationDistance
        cell.locationImage.image = UIImage(named: "Fish")!
        return cell
    }

}
