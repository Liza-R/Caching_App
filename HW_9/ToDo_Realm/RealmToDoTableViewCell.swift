//
//  RealmToDoTableViewCell.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import UIKit

class RealmToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTF: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func checkingButton(_ sender: Any) {
    }
    @IBAction func removingButton(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
