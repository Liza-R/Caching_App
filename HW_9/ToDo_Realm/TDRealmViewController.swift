//
//  TDRealmViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit

var qt = 0

class TDRealmViewController: UIViewController {

    @IBOutlet weak var todoTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var labelForQT: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        RealmSaving.safekeepingRealm.forUpload()
        self.todoTable.dataSource = self
        self.todoTable.reloadData()
        self.labelForQT.text = "\(qt) task(-s)"
    }
    
    @IBAction func addingButton(_ sender: Any) {
        self.todoTable.performBatchUpdates({
            RealmSaving.safekeepingRealm.safekeeping()
            self.todoTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }) { (inform) in
            self.todoTable.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
        self.labelForQT.text = "\(qt) task(-s)"
    }
}

extension TDRealmViewController: UITableViewDataSource{

    func tableView(_ tableView_Alam: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qt
    }
    
    func tableView(_ tableView_Alam: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView_Alam.dequeueReusableCell(withIdentifier: "realmCell", for: indexPath) as! RealmToDoTableViewCell

        return cell_Alam
    }
}
