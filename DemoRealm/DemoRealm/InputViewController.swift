//
//  InputViewController.swift
//  DemoRealm
//
//  Created by 김현지 on 2020/08/07.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    
    // segue에서 데이터가 포함되고 넘어왔을 시 떼이터를 저장
    // 만약 segue에 데이터가 포함되어 있지 않는다면 nil
    
    var personData: PersonData?
    
    let realm = try? Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: 데이터 저장
    func saveData() {
        if personData == nil {
            addPersonData()
        } else {
            updatePersonData()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Person Data를 Realm에 추가
    func addPersonData() {
        personData = PersonData()
        personData = inputDataToPersonData(db: personData!)
        
        try? realm?.write {
            realm?.add((personData)!)
        }
    }
    
    // MARK: Person Data 업데이트
    // Realm의 데이터 수정, 삭제가 있을 경우 realm.write() -> Realm에서 가져온 값 변경
    func updatePersonData() {
        try? realm.write {
            personData = inputDataToPersonData(db: personData!)
        }
    }
    
    // MARK: Person Data에 Data를 저장하고, Realm에 저장한다.
    func inputDataToPersonData(db: PersonData) -> PersonData {
        // Name
        if let name = textUserName.text {
            db.userName = name
        }
        
        // Age
        var age = 0
        if let getAge = textUserAge.text {
            if getAge == "" {
                age = 0
            } else {
                age = Int(getAge)!
            }
        }
        db.userAge = age
        
        // Email
        if let email = textUserEmail.text {
            db.userEmail = email
        }
        
        return db
    }
    
    // MARK: Load Data
    func loadData() {
        if let db = personData {
            textUserName.text = db.userName
            textUserAge.text = String(describing: db.userAge)
            textUserEmail.text = db.userEmail
        }
    }
}
