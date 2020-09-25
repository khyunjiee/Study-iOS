//
//  ViewController.swift
//  SignInEx
//
//  Created by 김현지 on 2020/09/18.
//

import UIKit
import SuperEasyLayout
import SnapKit

class ViewController: UIViewController {
    
    var backImageView = UIImageView(image: UIImage(named: "backSignup"))
    var topLabel = UILabel()
    var idLabel = UILabel()
    var idView = UIView()
    var idTextField = UITextField()
    var pwLabel = UILabel()
    var pwView = UIView()
    var pwTextField = UITextField()
    var checkPwLabel = UILabel()
    var checkPwView = UIView()
    var checkPwTextField = UITextField()
    var signInButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
    }
    
    func layout() {
        topLabel.text = """
                            회원가입 후
                            얼리버디와 함께해요!
                        """
        topLabel.textColor = UIColor(cgColor: CGColor(red: 49/255, green: 49/255, blue: 49/255, alpha: 1.0))
        topLabel.font = UIFont(name: "NotoSansKR-Medium", size: 23)
        topLabel.numberOfLines = 2
        idLabel.text = "아이디"
        idLabel.textColor = UIColor(cgColor: CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0))
        idLabel.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        idTextField.placeholder = "아이디를 입력해주세요."
        idTextField.font = UIFont(name: "NotoSansKR-Medium", size: 16)
        idView.layer.cornerRadius = 25
        idView.layer.borderWidth = 2
        idView.layer.borderColor = CGColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1.0)
        pwLabel.text = "비밀번호"
        pwLabel.textColor = UIColor(cgColor: CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0))
        pwLabel.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        pwTextField.placeholder = "영어+숫자 6자 이상 입력해주세요."
        pwTextField.font = UIFont(name: "NotoSansKR-Medium", size: 16)
        pwView.layer.cornerRadius = 25
        pwView.layer.borderWidth = 2
        pwView.layer.borderColor = CGColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1.0)
        checkPwLabel.text = "비밀번호 확인"
        checkPwLabel.textColor = UIColor(cgColor: CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0))
        checkPwLabel.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        checkPwTextField.placeholder = "비밀번호를 한 번 더 입력해주세요."
        checkPwTextField.font = UIFont(name: "NotoSansKR-Medium", size: 16)
        checkPwView.layer.cornerRadius = 25
        checkPwView.layer.borderWidth = 2
        checkPwView.layer.borderColor = CGColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1.0)
        signInButton.backgroundColor = UIColor(cgColor: CGColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1.0))
        signInButton.layer.cornerRadius = 25
        signInButton.setTitle("가입하기", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 18)
        
        
        view.addSubview(backImageView)
        view.addSubview(topLabel)
        view.addSubview(idLabel)
        view.addSubview(idView)
        idView.addSubview(idTextField)
        view.addSubview(pwLabel)
        view.addSubview(pwView)
        pwView.addSubview(pwTextField)
        view.addSubview(checkPwLabel)
        view.addSubview(checkPwView)
        checkPwView.addSubview(checkPwTextField)
        view.addSubview(signInButton)
        
//        backImageView.snp.makeConstraints { (img) in
//            img.top.leading.trailing.bottom.equalTo(view)
//        }
//        topLabel.snp.makeConstraints { (tl) in
//            tl.top.equalTo(76)
//            tl.leading.equalTo(backImageView.snp.leading).offset(48)
//            tl.height.equalTo(80)
//        }
//        idLabel.snp.makeConstraints { (il) in
//            il.top.equalTo(topLabel.snp.bottom).offset(47)
//            il.leading.equalTo(backImageView.snp.leading).offset(61)
//        }
//        idView.snp.makeConstraints { (iv) in
//            iv.top.equalTo(100)
//            iv.leading.equalTo(backImageView.snp.leading).offset(42)
//            iv.trailing.equalTo(backImageView.snp.trailing).offset(-42)
//        }
//        idTextField.snp.makeConstraints { (itf) in
//            itf.centerY.equalTo(idView.snp.centerY)
//            itf.leading.equalTo(idView.snp.leading).offset(19)
//            itf.trailing.equalTo(idView.snp.trailing).offset(-19)
//        }
        
        backImageView.top == view.top
        backImageView.leading == view.leading
        backImageView.trailing == view.trailing
        backImageView.bottom == view.bottom
        topLabel.top == backImageView.top + 76
        topLabel.leading == backImageView.leading + 48
        topLabel.height == 80
        idLabel.top == topLabel.bottom + 47
        idLabel.leading == backImageView.leading + 61
        idView.top == idLabel.bottom + 8
        idView.height == 49
        idView.leading == backImageView.leading + 42
        idView.trailing == backImageView.trailing - 42
        idTextField.centerY == idView.centerY
        idTextField.leading == idView.leading + 19
        idTextField.trailing == idView.trailing - 19
        pwLabel.top == idView.bottom + 16
        pwLabel.leading == backImageView.leading + 61
        pwView.top == pwLabel.bottom + 8
        pwView.height == 49
        pwView.leading == backImageView.leading + 42
        pwView.trailing == backImageView.trailing - 42
        pwTextField.centerY == pwView.centerY
        pwTextField.leading == pwView.leading + 19
        pwTextField.trailing == pwView.trailing - 19
        checkPwLabel.top == pwView.bottom + 16
        checkPwLabel.leading == backImageView.leading + 61
        checkPwView.top == checkPwLabel.bottom + 8
        checkPwView.height == 49
        checkPwView.leading == backImageView.leading + 42
        checkPwView.trailing == backImageView.trailing - 42
        checkPwTextField.centerY == checkPwView.centerY
        checkPwTextField.leading == checkPwView.leading + 19
        checkPwTextField.trailing == checkPwView.trailing - 19
        signInButton.top == checkPwView.bottom + 57
        signInButton.leading == backImageView.leading + 42
        signInButton.trailing == backImageView.trailing - 42
        signInButton.height == 49
        
        
//        view.translatesAutoresizingMaskIntoConstraints = false
//        backImageView.translatesAutoresizingMaskIntoConstraints = false
//        topLabel.translatesAutoresizingMaskIntoConstraints = false
//        idLabel.translatesAutoresizingMaskIntoConstraints = false
//        idView.translatesAutoresizingMaskIntoConstraints = false
//        idTextField.translatesAutoresizingMaskIntoConstraints = false
//        pwLabel.translatesAutoresizingMaskIntoConstraints = false
//        pwView.translatesAutoresizingMaskIntoConstraints = false
//        pwTextField.translatesAutoresizingMaskIntoConstraints = false
//        checkPwLabel.translatesAutoresizingMaskIntoConstraints = false
//        checkPwView.translatesAutoresizingMaskIntoConstraints = false
//        checkPwTextField.translatesAutoresizingMaskIntoConstraints = false
//        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            topLabel.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 76),
//            topLabel.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 48),
//            topLabel.heightAnchor.constraint(equalToConstant: 80),
//            idLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 47),
//            idLabel.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 61),
//            idView.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
//            idView.heightAnchor.constraint(equalToConstant: 49),
//            idView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 42),
//            idView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: -42),
//            idTextField.centerYAnchor.constraint(equalTo: idView.centerYAnchor),
//            idTextField.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 19),
//            idTextField.trailingAnchor.constraint(equalTo: idView.trailingAnchor, constant: -19),
//            pwLabel.topAnchor.constraint(equalTo: idView.bottomAnchor, constant: 16),
//            pwLabel.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 61),
//            pwView.topAnchor.constraint(equalTo: pwLabel.bottomAnchor, constant: 8),
//            pwView.heightAnchor.constraint(equalToConstant: 49),
//            pwView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 42),
//            pwView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: -42),
//            pwTextField.centerYAnchor.constraint(equalTo: pwView.centerYAnchor),
//            pwTextField.leadingAnchor.constraint(equalTo: pwView.leadingAnchor, constant: 19),
//            pwTextField.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: -19),
//            checkPwLabel.topAnchor.constraint(equalTo: pwView.bottomAnchor, constant: 16),
//            checkPwLabel.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 61),
//            checkPwView.topAnchor.constraint(equalTo: checkPwLabel.bottomAnchor, constant: 8),
//            checkPwView.heightAnchor.constraint(equalToConstant: 49),
//            checkPwView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 42),
//            checkPwView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: -42),
//            checkPwTextField.centerYAnchor.constraint(equalTo: checkPwView.centerYAnchor),
//            checkPwTextField.leadingAnchor.constraint(equalTo: checkPwView.leadingAnchor, constant: 19),
//            checkPwTextField.trailingAnchor.constraint(equalTo: checkPwView.trailingAnchor, constant: -19),
//            signInButton.topAnchor.constraint(equalTo: checkPwView.bottomAnchor, constant: 57),
//            signInButton.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 42),
//            signInButton.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: -42),
//            signInButton.heightAnchor.constraint(equalToConstant: 49)
//        ])
        
        
        
        
    }


}

