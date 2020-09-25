import Foundation

let date = Date()

date.year
date.monthName
date.day
date.isLeapMonth

print(date.year)

printCalendar()

func printCalendar() {
    if date.isLeapMonth {
        
    } else {
        print(date.monthName)
        for day in (1..<32) {
            print(day, terminator: " ")
        }
        print()
    }
}
