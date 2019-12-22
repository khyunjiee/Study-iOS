//
//  AlertViewController.swift
//  MessageNotification
//
//  Created by 김현지 on 2019/12/22.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @objc func appMovedToBackground() {
        print("App moved to background!")
    }

}
