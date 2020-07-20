//
//  MainViewController.swift
//  PlzCoordinator
//
//  Created by 김현지 on 2020/07/20.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextVC(_ sender: Any) {
//        print(coordinator)
        coordinator?.showSecondVC()
    }
    

}
