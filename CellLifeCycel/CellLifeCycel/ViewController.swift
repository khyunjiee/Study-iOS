//
//  ViewController.swift
//  CellLifeCycel
//
//  Created by 김현지 on 2020/08/27.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var defaultTV: UITableView!
    
    let data = Array(0..<40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTV.delegate = self
        defaultTV.dataSource = self
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will Display Cell : \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Did End Display Cell : \(indexPath.row)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        
        cell.textLabel?.text = "Cell \(indexPath.row)"
        print("cellForRowAt : \(indexPath.row)")
        return cell
    }
    
    
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetch : \(indexPaths)")
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetching : \(indexPaths)")
    }
    
}



