//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 김현지 on 2019/12/15.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet var wv: WKWebView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var mvo : MovieVO!  // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    override func viewDidLoad() {
        
        NSLog("linkurl = \(self.mvo.detail!), title=\(self.mvo.title!)")
        
        // 내비게이션 바의 타이틀에 영화명을 출력한다
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        // URLRequest 인스턴스를 생성한다
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        // loadRequest 메소드를 호출하면서 req를 인자값으로 전달한다.
        self.wv.load(req)
    }
    


}
