//
//  ChatViewController.swift
//  ChatingPractice
//
//  Created by 김현지 on 2019/12/21.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public var destinationUid: String?  // 나중에 내가 채팅할 대상의 uid
    
    var uid: String?
    var chatRoomUid: String?
    var comments: [ChatModel.Comment] = []
    
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var textfield_message: UITextField!
    @IBOutlet var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let view = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        view.textLabel?.text = self.comments[indexPath.row].message
        
        return view
    }
    
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
            self.sendButton.isEnabled = false
            // 방 생성 코드
            Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo, withCompletionBlock: { (err, ref) in
                
                if(err == nil){
                    self.checkChatRoom()
                }
                
            })
        }else{
            let value: Dictionary<String,Any> = [
                "uid" : uid!,
                "message" : textfield_message.text!
                
            ]
            Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value)
        }
    }
    
    @objc func checkChatRoom() {
        
        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/"+uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value, with: { (datasnapshot) in
            
            for item in datasnapshot.children.allObjects as! [DataSnapshot] {
                
                if let chatRoomdic = item.value as? [String:AnyObject]{
                    
                    let chatModel = ChatModel(JSON: chatRoomdic)
                    if(chatModel?.users[self.destinationUid!] == true){
                        self.chatRoomUid = item.key
                        self.sendButton.isEnabled = true
                        self.getMessageList()
                    }
                    
                }
                
            }
            
        })
        
    }
    
    @objc func getMessageList() {
        
        Database.database().reference().child("chatrooms").child(self.chatRoomUid!).child("comments").observe(DataEventType.value, with: { (datasnapshot) in
            
            self.comments.removeAll()
            
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                
                let comment = ChatModel.Comment(JSON: item.value as! [String:AnyObject])
                self.comments.append(comment!)
                
            }
            
            self.tableview.reloadData()
            
        })
        
    }

}

class MyMessageCell: UITableViewCell {
    
    @IBOutlet var label_message: UILabel!
    
}

class DestinationMessageCell: UITableViewCell {
    
    @IBOutlet var label_message: UILabel!
    
}
