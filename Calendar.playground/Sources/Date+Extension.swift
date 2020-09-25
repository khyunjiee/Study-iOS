import Foundation

extension Date {
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    public var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    public var monthName: String {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM월"
        monthFormatter.locale = Locale(identifier: "ko")
        return monthFormatter.string(from: self)
    }
    
    public var isLeapMonth: Bool {
        return Calendar.current.dateComponents([.year, .month, .day], from: self).isLeapMonth!
    }
}

