//
//  AlertsCoreData.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 10.08.2021.
//

import Foundation
import UIKit
import CoreData

class AlertsCD{
    func alertAddNewTask(vc: UIViewController, table: UITableView){
        let alert = UIAlertController(title: "New Task", message: "Enter task:", preferredStyle: .alert),
            cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)/*,
            curTasks = model.filter("taskComplited = 0")
        
        */
        var alertTF = UITextField()
        alert.addTextField{ textF in
            alertTF = textF
            textF.placeholder = "New task"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default){ action in
            
            let textTask = alertTF.text
            self.saveTask(noteTask: textTask ?? "Empty note")
            table.insertRows(at: [IndexPath(row: tasks.count - 1, section: 0)], with: .automatic)
        }
        
         alert.addAction(cancelAction)
         alert.addAction(saveAction)
         alert.pruneNegativeWidthConstraintsRealm()
         vc.present(alert, animated: true, completion: nil)
    }
    
    private func saveTask(noteTask: String) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { return }
        
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.taskNote = noteTask
        taskObject.taskComplite = false
        
        do {
            try context.save()
            tasks.append(taskObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
   func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

extension UIAlertController{
    func pruneNegativeWidthConstraintsCoreData(){
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
