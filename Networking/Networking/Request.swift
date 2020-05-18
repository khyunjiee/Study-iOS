//
//  Request.swift
//  Networking
//
//  Created by 김현지 on 2020/05/18.
//  Copyright © 2020 김현지. All rights reserved.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriend() {
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    let session: URLSession = URLSession(configuration: .default)
    
    // response가 왔을 때 클로저 실행
    // reloadData는 메인 스레드에서 실행해주어야함. 백그라운드에서 하면 실행이 안됨. 동기로 하면
    // 스크롤이 끊기기 때문에 비동기로 실행.
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else { return }
        
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends": apiResponse.results])

        } catch(let err) {
            print(err.localizedDescription)
        }
        
    }
    
    dataTask.resume()
}
