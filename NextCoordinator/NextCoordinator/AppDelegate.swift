//
//  AppDelegate.swift
//  NextCoordinator
//
//  Created by 김현지 on 2020/07/30.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTapBarController()
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

