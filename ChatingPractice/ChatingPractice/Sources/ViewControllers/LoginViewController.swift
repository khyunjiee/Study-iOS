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
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! Auth.auth().signOut()
        
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
        loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener { (Auth, authResult) in
            if(authResult != nil) {
                let view = self.storyboard?.instantiateViewController(withIdentifier: "MainViewTabBarController") as! UITabBarController
                self.present(view, animated: true, completion: nil)
            }
        }
    }
    
    @objc func presentSignup() {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
         
        self.present(view, animated: true, completion: nil)
        
    }
    
    @objc func loginEvent() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (authResult, error) in
            
            if(error != nil) {
                let alert = UIAlertController(title: "에러", message: error.debugDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }

}
