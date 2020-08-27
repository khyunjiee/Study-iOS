//
//  PersonData.swift
//  DemoRealm
//
//  Created by 김현지 on 2020/08/07.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation
import RealmSwift

class PersonData: Object {
    @objc dynamic var userName = ""
    @objc dynamic var userAge = 0
    @objc dynamic var userEmail = ""
}
