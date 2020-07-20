//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by 김현지 on 2020/07/12.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubsciption() {
        let vc = BuyViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
