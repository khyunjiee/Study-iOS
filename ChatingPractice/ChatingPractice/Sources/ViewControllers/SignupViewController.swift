//
//  SignupViewController.swift
//  ChatingPractice
//
//  Created by 김현지 on 2019/12/19.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import Firebase


class SignupViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
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
        signupButton.backgroundColor = UIColor(hex: color)
        cancelButton.backgroundColor = UIColor(hex: color)
        
        signupButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
        
    }
    
    @objc func signupEvent() {
        
        guard let email_text = email.text, let password_text = password.text else { return }
        
        Auth.auth().createUser(withEmail: email_text, password: password_text) { (authResult, error) in
            
            guard let user = authResult?.user else {return}
            
            if error == nil {
                let uid = user.uid
                Database.database().reference().child("users").child(uid).setValue(["name": self.name.text!])
            }
            
        }
        
    }
    
    @objc func cancelEvent() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
