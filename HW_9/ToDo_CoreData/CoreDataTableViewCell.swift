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
    @IBOutlet weak var arrowBn: UIButton!
    
    @IBAction func didBeginTF(_ sender: Any) {
        UIView.animate(withDuration: 0.33, delay: 0, options: .autoreverse, animations: {
            self.tralingTaskTF.constant = 40
        })
        self.arrowBn.tintColor = .label
    }
    @IBAction func didEndTF(_ sender: Any) {
        /*let stop = taskTF.attributedText?.string,
            item = model[eventTF.tag]

        try! realm.write({
            item.taskNote = stop ?? ""
        })
        */
        UIView.animate(withDuration: 0.33, delay: 0, options: .autoreverse, animations: {
            self.tralingTaskTF.constant = 0
        })
        self.arrowBn.tintColor = .clear
    }
    
    @IBAction func arrowButton(_ sender: Any) {
        didEndTF(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
