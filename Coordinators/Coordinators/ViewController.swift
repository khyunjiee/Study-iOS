//
//  ViewController.swift
//  Coordinators
//
//  Created by 김현지 on 2020/07/12.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        coordinator?.buySubsciption()
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        coordinator?.createAccount()
    }
}

