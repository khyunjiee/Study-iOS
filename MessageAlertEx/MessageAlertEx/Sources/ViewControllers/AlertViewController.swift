//
//  AlertViewController.swift
//  MessageAlertEx
//
//  Created by 김현지 on 2019/12/22.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func alert(_ sender: UIButton) {
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel) // 취소버튼
        let ok = UIAlertAction(title: "확인", style: .default) // 확인버튼
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 메시지 창 실행
        self.present(alert, animated: false)
    }
    
}
