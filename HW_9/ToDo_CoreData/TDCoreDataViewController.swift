//
//  TDCoreDataViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit

class TDCoreDataViewController: UIViewController {

    @IBOutlet weak var todoTableCoreData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoTableCoreData.dataSource = self
        self.todoTableCoreData.delegate = self
        self.todoTableCoreData.reloadData()
    }
    
    
    @IBAction func addingButtonCoreData(_ sender: Any) {
        
    }
}
extension TDCoreDataViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Current tasks"
        }
        return "Complited tasks"
    }
    
    /*func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
    }*/
    
    /*func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
     
     }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView.dequeueReusableCell(withIdentifier: "coreDataCell", for: indexPath) as! CoreDataTableViewCell
        
        return cell_Alam
    }
}
