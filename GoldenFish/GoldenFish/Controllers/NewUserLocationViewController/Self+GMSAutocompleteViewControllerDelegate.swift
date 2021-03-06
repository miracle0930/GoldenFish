//
//  NewUserLocationViewController+GMSAutocompleteViewControllerDelegate.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/3.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit
import GooglePlaces

extension NewUserLocationViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        
        GMSPlacesClient.shared().lookUpPlaceID(prediction.placeID!) { (place, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let locationInfo: [String: Any] = [
                    "address": place!.formattedAddress!,
                    "latitude": place!.coordinate.latitude,
                    "longitude": place!.coordinate.longitude
                ]
                NotificationCenter.default.post(name: Notification.Name(rawValue: "hiddenViewShowsUp"), object: nil, userInfo: locationInfo)
            }
        }

        return true
    }
    
}
