//
//  RealmFile.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import Foundation
import RealmSwift

class ToDoInfo: Object{
    @objc dynamic var taskName = "",
                      check = false,
                      delite = false,
                      qtTasks = 0
}

class RealmSaving{
    static let safekeepingRealm = RealmSaving()
    private let realm = try! Realm()
    
    func safekeeping(){
        let task = ToDoInfo()
        task.taskName = taskDescript
        task.check = checking
        task.delite = deliting
        task.qtTasks = qtTasks
        try! realm.write{
            realm.add(task)
        }
        
        let allTasks = realm.objects(ToDoInfo.self)
        for task in allTasks{
            print(task)
        }
        
    }
}
