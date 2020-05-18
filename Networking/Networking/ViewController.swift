//
//  ViewController.swift
//  Networking
//
//  Created by 김현지 on 2020/05/18.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier: String = "friendCell"
    
    var friends: [Friend] = []
    
    @objc func didReceiveFriendsNotification(_ noti: Notification) {
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else { return }
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestFriend()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        // 셀의 이미지가 다운되기 전에 다른 사람의 이미지가 표시되기 전에 nil로 설정한다.
        cell.imageView?.image = nil
        
        // 백그라운드 큐
        // 다운로드를 받는 동안 사용자가 스크롤을 할 경우 인덱스가 달라질 수가 있음.
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            // Data(contentsOf:)는 동기 메서드이기 때문에 이미지 다운로드가 끝나기 전까지 화면이 멈춤.
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            // 이미지를 보여주는 것만 메인 스레드로 비동기 실행
            DispatchQueue.main.async {
                
                // 인덱스가 같을 때만 이미지 설정해라
                if let index: IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
        
    }


}

