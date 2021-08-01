//
//  TDRealmViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit

var checking = false,
    deliting = false,
    taskDescript = "",
    qtTasks = 0

class TDRealmViewController: UIViewController {

    @IBOutlet weak var todoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RealmSaving.safekeepingRealm.safekeeping()
        self.todoTable.rowHeight = 100
        self.todoTable.dataSource = self
        self.todoTable.reloadData()
    }
    
    @IBAction func addingButton(_ sender: Any) {
        qtTasks += 1
        self.todoTable.reloadData()
    }
    
}

extension TDRealmViewController: UITableViewDataSource{

    func tableView(_ tableView_Alam: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qtTasks
    }

    func tableView(_ tableView_Alam: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView_Alam.dequeueReusableCell(withIdentifier: "realmCell", for: indexPath) as! RealmToDoTableViewCell
        
        
        return cell_Alam
    }
}
