//
//  LoginViewController.swift
//  ChatingPractice
//
//  Created by 김현지 on 2019/12/19.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        
        statusBar.snp.makeConstraints { (make) in
            make.right.top.left.equalTo(self.view)
            make.height.equalTo(20)
         }
        
        color = remoteConfig["splash_background"].stringValue
        
        statusBar.backgroundColor = UIColor(hex: color)
        loginButton.backgroundColor = UIColor(hex: color)
        signupButton.backgroundColor = UIColor(hex: color)
        
        signupButton.addTarget(self, action: #selector(presentSignup), for: .touchUpInside)
    }
    
    @objc func presentSignup() {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
         
        self.present(view, animated: true, completion: nil)
        
    }

}
