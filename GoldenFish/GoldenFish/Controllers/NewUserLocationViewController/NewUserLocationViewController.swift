//
//  NewUserLocationViewController.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/3.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class NewUserLocationViewController: UIViewController {
    
    var mapView: GMSMapView?
    var locationManager = CLLocationManager()
    var infoView: UIView?
    @IBOutlet weak var basicView: UIView!
    var infoViewShowsUp = false
    @IBOutlet weak var infoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        configureInfoView()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
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
    
    func configureInfoView() {
        let x = UIScreen.main.bounds.width - infoButton.frame.origin.x
        infoView = UIView(frame: CGRect(x: x, y: 50, width: 290, height: 70))
        infoView!.backgroundColor = Util.hexStringToUIColor(hex: "#6DB193")
        infoView!.alpha = 0
        infoView!.layer.cornerRadius = 10
        infoView!.layer.borderWidth = 1
        infoView!.layer.masksToBounds = true
        let infoTextView = UITextView(frame: CGRect(x: 2, y: 2, width: 286, height: 66))
        infoTextView.font = UIFont(name: "Chalkboard SE", size: 17)
        infoTextView.backgroundColor = UIColor.clear
        infoTextView.text = "Store your personal locations like home, company, supermarkets, etc."
        infoView!.addSubview(infoTextView)
    }
    
    @IBAction func addNewLocationButtonPressed(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @IBAction func manageLocationsButtonPressed(_ sender: UIButton) {
        presentBottom(LocationsPresentationController.self)
    }
    
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        if !infoViewShowsUp {
            view.addSubview(infoView!)
            UIView.animate(withDuration: 0.3, animations: {
                self.infoView?.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.infoView!.alpha = 0
            }) { (_) in
                self.infoView!.removeFromSuperview()
            }
        }
        infoViewShowsUp = !infoViewShowsUp
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

