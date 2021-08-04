//
//  TDRealmViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift


var qt = 0
class TDRealmViewController: UIViewController {

    @IBOutlet weak var todoTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var labelForQT: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        RealmSaving.safekeepingRealm.forUpload()
        self.todoTable.rowHeight = 100
        self.todoTable.dataSource = self
        self.todoTable.reloadData()
        self.labelForQT.text = "\(qt)"
    }
    
    @IBAction func addingButton(_ sender: Any) {
        RealmSaving.safekeepingRealm.safekeeping()
        self.todoTable.reloadData()
        self.labelForQT.text = "\(qt)"
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
