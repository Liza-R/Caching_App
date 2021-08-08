//
//  CoreDataTableViewCell.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 08.08.2021.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {
    @IBOutlet weak var taskTF: UITextField!
    @IBOutlet weak var tralingTaskTF: NSLayoutConstraint!
    
    @IBAction func didBeginTF(_ sender: Any) {
    }
    @IBAction func didEndTF(_ sender: Any) {
    }
    
    @IBAction func arrowButton(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
