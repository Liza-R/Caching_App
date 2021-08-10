//
//  Alerts.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 07.08.2021.
//

import Foundation
import UIKit

class AlertsRealm{
    
    func alertAddNewTask(vc: UIViewController, table: UITableView){
        let alert = UIAlertController(title: "New Task", message: "Enter task:", preferredStyle: .alert),
            cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil),
            model = realm.objects(Task.self),
            curTasks = model.filter("taskComplited = 0")
        
        
        var alertTF = UITextField()
        alert.addTextField{ textF in
            alertTF = textF
            textF.placeholder = "New task"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default){ action in
            guard let taskText = alertTF.text, !taskText.isEmpty else { return }
            let newTask = Task()
            newTask.taskNote = taskText
            newTask.taskComplited = false
            try! realm.write{
                realm.add(newTask)
            }
            table.insertRows(at: [IndexPath(row: curTasks.count - 1, section: 0)], with: .automatic)
        }
        
         alert.addAction(cancelAction)
         alert.addAction(saveAction)
         alert.pruneNegativeWidthConstraintsRealm()
         vc.present(alert, animated: true, completion: nil)
    }
}

extension UIAlertController{
    func pruneNegativeWidthConstraintsRealm(){
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
