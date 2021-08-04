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
        self.todoTable.delegate = self
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

extension TDRealmViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qt
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeRemove = UIContextualAction(style: .normal, title: "Remove"){ (action, view, success) in
            self.todoTable.performBatchUpdates({
                //self.model.CellActions().actions.removingCell(indPath: indexPath)
                self.todoTable.deleteRows(at: [indexPath], with: .automatic)
            }, completion: nil)
            print("Removing \(indexPath.row)")
        }
        swipeRemove.backgroundColor = #colorLiteral(red: 0.646001092, green: 0.05260277429, blue: 0, alpha: 1)

        let swipes = UISwipeActionsConfiguration(actions: [swipeRemove])
        swipes.performsFirstActionWithFullSwipe = true
        
        return swipes
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let swipeCheck = UIContextualAction(style: .normal, title: "Check"){ (action, view, success) in
            
            self.todoTable.performBatchUpdates({
                //self.model.CellActions().actions.removingCell(indPath: indexPath)
                self.todoTable.deleteRows(at: [indexPath], with: .automatic)
            }, completion: nil)
            print("Checking \(indexPath.row)")
        }
        swipeCheck.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
     
        let swipes = UISwipeActionsConfiguration(actions: [swipeCheck])
        swipes.performsFirstActionWithFullSwipe = true
        
        return swipes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView.dequeueReusableCell(withIdentifier: "realmCell", for: indexPath) as! RealmToDoTableViewCell

        return cell_Alam
    }
    
    
}
