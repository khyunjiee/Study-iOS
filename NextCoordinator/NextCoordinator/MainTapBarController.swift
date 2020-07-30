//
//  MainTapBarController.swift
//  NextCoordinator
//
//  Created by 김현지 on 2020/07/30.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class MainTapBarController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.start()
        viewControllers = [main.navigationController]
    }
}
