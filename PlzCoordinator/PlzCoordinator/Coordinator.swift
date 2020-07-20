//
//  Coordinator.swift
//  PlzCoordinator
//
//  Created by 김현지 on 2020/07/20.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
}
