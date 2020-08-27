//
//  DefaultCell.swift
//  CellLifeCycel
//
//  Created by 김현지 on 2020/08/27.
//  Copyright © 2020 김현지. All rights reserved.
//

import UIKit

class DefaultCell: UITableViewCell {

//    @IBOutlet var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("--------------awakeFromNib---------------")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("--------------prepareForeReuse---------------")
    }

    deinit {
        print("---------------deinit---------------")
    }

}
