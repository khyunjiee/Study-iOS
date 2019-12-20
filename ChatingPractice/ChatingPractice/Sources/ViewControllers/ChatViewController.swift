//
//  ChatViewController.swift
//  ChatingPractice
//
//  Created by 김현지 on 2019/12/21.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    public var destinationUid: String?  // 나중에 내가 채팅할 대상의 uid
    
    var uid: String?
    var chatRoomUid: String?
    
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var textfield_message: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uid = Auth.auth().currentUser?.uid

        sendButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        
        checkChatRoom()
    }
    

    @objc func createRoom() {
        let createRoomInfo : Dictionary<String,Any> = [
            "users" : [
                uid!: true,
                destinationUid!: true
            ]
        ]
        
        if(chatRoomUid == nil) {
            // 방 생성 코드
            Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo)
        }else{
            let value: Dictionary<String,Any> = [
                "comments" : [
                    "uid" : uid!,
                    "message" : textfield_message.text!
                ]
            ]
            Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value)
        }
    }
    
    @objc func checkChatRoom() {
        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/"+uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value, with: { (datasnapshot) in
            for item in datasnapshot.children.allObjects as! [DataSnapshot] {
                self.chatRoomUid = item.key
            }
        })
    }

}
