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
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
    }
    
    
}
