//
//  MainCoordinator.swift
//  PlzCoordinator
//
//  Created by 김현지 on 2020/07/20.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var nav: UINavigationController
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let vc = MainViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func showSecondVC() {
        let vc = SecondViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
}
