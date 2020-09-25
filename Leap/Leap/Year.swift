//
//  Year.swift
//  Leap
//
//  Created by 김현지 on 2020/09/25.
//

import Foundation

struct Year {
    let calendarYear: Int
    var isLeapYear: Bool { get {
        return calendarYear % 4 == 0 && ( calendarYear % 100 != 0 || calendarYear % 400 == 0 )
    }
    }
}
