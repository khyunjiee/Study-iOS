var value = [1, 9, 5, 7, 3, 2]

//func order(s1: Int, s2: Int) -> Bool {
//    if s1 > s2 {
//        return true
//    } else {
//        return false
//    }
//}
//
value.sort(by: >)

func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s() // 성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100) { () in
    print("연산이 성공했습니다.")
}
