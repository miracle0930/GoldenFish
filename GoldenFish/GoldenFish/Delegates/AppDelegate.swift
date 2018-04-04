//
//  AppDelegate.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/2.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchScreenImageView: UIImageView!
    var coverView: UIView!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyD6UCyiWbfyvPxtDhcVnhty_AfD_tvQGPM")
        GMSPlacesClient.provideAPIKey("AIzaSyD6UCyiWbfyvPxtDhcVnhty_AfD_tvQGPM")
        performAnimation()
        
        
        return true
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func performAnimation() {
        window?.makeKeyAndVisible()
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        var imageWidth: CGFloat = 0.0
        var imageHeight: CGFloat = 0.0
        let launchScreenFrame = CGRect(x: (screenWidth - imageWidth) / 2, y: (screenHeight - imageHeight) / 2, width: imageWidth, height: imageHeight)
        launchScreenImageView = UIImageView(frame: launchScreenFrame)
        launchScreenImageView.image = UIImage(named: "Fish")!
        window?.addSubview(launchScreenImageView)
        UIView.transition(with: launchScreenImageView, duration: 1, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            imageWidth = 200
            imageHeight = 200
            self.launchScreenImageView.frame = CGRect(x: (screenWidth - imageWidth) / 2, y: (screenHeight - imageHeight) / 2, width: imageWidth, height: imageHeight)
        }) { (_) in
            UIView.transition(with: self.launchScreenImageView, duration: 1, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                imageWidth = 0
                imageHeight = 0
                self.launchScreenImageView.frame = CGRect(x: (screenWidth - imageWidth) / 2, y: (screenHeight - imageHeight) / 2, width: imageWidth, height: imageHeight)
            }, completion: { (_) in
                self.launchScreenImageView.removeFromSuperview()
                NotificationCenter.default.post(name: Notification.Name(rawValue: "hideCoverView"), object: nil)
            })
        }
    }


}

