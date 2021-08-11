//
//  TDCoreDataViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit
import CoreData

var currentTasks: [Tasks] = [],
    completedTasks: [Tasks] = []

class TDCoreDataViewController: UIViewController {

    @IBOutlet weak var todoTableCoreData: UITableView!
    
    let context = AlertsCD().getContext(),
        fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoTableCoreData.dataSource = self
        self.todoTableCoreData.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            let tasks = try context.fetch(fetchRequest)
            for i in tasks{
                switch i.taskComplite {
                case true:
                    completedTasks.append(i)
                case false:
                    currentTasks.append(i)
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.todoTableCoreData.reloadData()
    }
    
    @IBAction func addingButtonCoreData(_ sender: Any) {
        AlertsCD().alertAddNewTask(vc: self, table: self.todoTableCoreData)
        self.todoTableCoreData.reloadData()
    }
}
extension TDCoreDataViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return currentTasks.count
        case 1:
            return completedTasks.count
        default:
            print("error -> tableView's sections")
            return 0
        }
    }
    
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Current tasks"
        }
        return "Complited tasks"
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     let swipes: UISwipeActionsConfiguration?
     
     if indexPath.section == 0{
        let item = currentTasks[indexPath.row],
             swipeRemove = UIContextualAction(style: .normal, title: "Remove"){ (action, view, success) in
                self.context.delete(item)
                do {
                    try self.context.save()
                    currentTasks = try self.context.fetch(self.fetchRequest)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                self.todoTableCoreData.reloadData()
         }
         swipeRemove.backgroundColor = #colorLiteral(red: 0.646001092, green: 0.05260277429, blue: 0, alpha: 1)
         swipes = UISwipeActionsConfiguration(actions: [swipeRemove])
         swipes?.performsFirstActionWithFullSwipe = true
     }else{
        let item = completedTasks[indexPath.row],
             swipeRemove = UIContextualAction(style: .normal, title: "Remove"){ (action, view, success) in
                self.context.delete(item)
                do {
                    try self.context.save()
                    completedTasks = try self.context.fetch(self.fetchRequest)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                self.todoTableCoreData.reloadData()
         }
         swipeRemove.backgroundColor = #colorLiteral(red: 0.646001092, green: 0.05260277429, blue: 0, alpha: 1)
         swipes = UISwipeActionsConfiguration(actions: [swipeRemove])
         swipes?.performsFirstActionWithFullSwipe = true
     }
     return swipes
 }
    
    /*func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
     
     let section_ = indexPath.section,
         row_ = indexPath.row,
         swipes: UISwipeActionsConfiguration?
     
     if section_ == 0{
         let item = currentTasks?[row_],
             swipeCheck = UIContextualAction(style: .normal, title: "Check"){ (action, view, success) in
                     try! realm.write{
                         item?.taskComplited = true
                         self.loadingTasks()
                     }
                 }
         swipeCheck.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
         swipes = UISwipeActionsConfiguration(actions: [swipeCheck])
         swipes?.performsFirstActionWithFullSwipe = true
     }else{
         let item = completedTasks?[row_],
             swipeReturn = UIContextualAction(style: .normal, title: "Return"){ (action, view, success) in
                     try! realm.write{
                         item?.taskComplited = false
                         self.loadingTasks()
                     }
                 }
         swipeReturn.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
         swipes = UISwipeActionsConfiguration(actions: [swipeReturn])
         swipes?.performsFirstActionWithFullSwipe = true
     }
         return swipes
 }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coreDataCell", for: indexPath) as! CoreDataTableViewCell
        
         if indexPath.section == 0{
            let task = currentTasks[indexPath.row]
            cell.taskTF.text = task.taskNote
         }
         else{
            let task = completedTasks[indexPath.row]
            cell.taskTF.text = task.taskNote
         }
        return cell
    }
}
