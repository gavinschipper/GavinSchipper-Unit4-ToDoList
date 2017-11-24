//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Gavin Schipper on 23-11-17.
//  Copyright © 2017 Gavin Schipper. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {

    var delegate: ToDoCellDelegate?
    
    @IBAction func completedButtonTapped2(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

}


