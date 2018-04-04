//
//  NewUserLocationViewController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/3.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit
import GoogleMaps

class NewUserLocationViewController: UIViewController {
    
    var mapView: GMSMapView?
    var locationManager = CLLocationManager()
    @IBOutlet var basicView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
    }
    
    func configureMapView() {
        let mapWidth = basicView.frame.width
        let mapHeight = basicView.frame.height
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: mapWidth, height: mapHeight), camera: GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 15))
        mapView!.settings.myLocationButton = true
        mapView!.isMyLocationEnabled = true
        mapView!.delegate = self
        basicView.addSubview(mapView!)
        mapView!.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.leadingMargin, relatedBy: NSLayoutRelation.equal, toItem: basicView, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.trailingMargin, relatedBy: NSLayoutRelation.equal, toItem: basicView, attribute: NSLayoutAttribute.trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.topMargin, relatedBy: NSLayoutRelation.equal, toItem: basicView, attribute: NSLayoutAttribute.topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.bottomMargin, relatedBy: NSLayoutRelation.equal, toItem: basicView, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1, constant: 0).isActive = true
        if let location = locationManager.location {
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15)
            mapView!.animate(to: camera)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


extension NewUserLocationViewController: GMSMapViewDelegate {
    
}
