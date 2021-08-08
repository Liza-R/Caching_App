//
//  RealmToDoTableViewCell.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import UIKit
import RealmSwift

class RealmToDoTableViewCell: UITableViewCell {

    let model = realm.objects(Task.self)

    @IBOutlet weak var eventTF: UITextField!
    @IBOutlet weak var savingButton: UIButton!
    @IBOutlet weak var tralingEventTF: NSLayoutConstraint!
    
    @IBAction func eventTFDidBegin(_ sender: Any) {
        UIView.animate(withDuration: 0.33, delay: 0, options: .autoreverse, animations: {
            self.tralingEventTF.constant = 40
        })
        self.savingButton.tintColor = .label
    }
    @IBAction func eventTFDidEnd(_ sender: Any) {
        let stop = eventTF.attributedText?.string,
            item = model[eventTF.tag]

        try! realm.write({
            item.taskNote = stop ?? ""
        })
        
        UIView.animate(withDuration: 0.33, delay: 0, options: .autoreverse, animations: {
            self.tralingEventTF.constant = 0
        })
        self.savingButton.tintColor = .clear
    }
    
    @IBAction func saveBt(_ sender: Any) {
        eventTFDidEnd(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
