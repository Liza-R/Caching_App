//
//  RealmToDoTableViewCell.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import UIKit

class RealmToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
