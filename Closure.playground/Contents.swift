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

func callback(fn: @escaping () -> Void) {
    let f = fn  // 클로저를 상수 f에 대입
    f()    // 대입된 클로저를 실행
}

callback {
    print("Closure가 실행되었습니다.")
}

func condition(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}

// 실행 방법
condition(stmt: (4 > 2))

var arrs = [String]()

func addVars(fn: @autoclosure () -> Void) {
    arrs = Array(repeating: "", count: 3)
    fn()
}

addVars(fn: arrs.insert("KR", at: 1))
