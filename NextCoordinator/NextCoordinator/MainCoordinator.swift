//
//  MainCoordinator.swift
//  NextCoordinator
//
//  Created by 김현지 on 2020/07/30.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, Buying, AccountCreating {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let vc = ViewController.instantiate()
//        vc.buyAction = { [weak self] in
//            self?.buySubscription()
//        }
//
//        vc.createAccountAction = { [weak self] in
//            self?.createAccount()
//        }
    }
    
    func buySubscription(to productType: Int) {
        let vc = BuyViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
