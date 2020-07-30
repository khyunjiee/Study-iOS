//
//  ViewController.swift
//  NextCoordinator
//
//  Created by 김현지 on 2020/07/30.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    var buyAction: (() -> Void)?
    var createAccountAction: (() -> Void)
    @IBOutlet var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        buyAction?()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        createAccountAction?()
    }
    
}

