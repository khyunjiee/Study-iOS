//
//  Coordinator.swift
//  Coordinators
//
//  Created by 김현지 on 2020/07/12.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
