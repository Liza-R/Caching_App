//
//  RealmFile.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import Foundation
import RealmSwift

class ToDoInfo: Object{
    @objc dynamic var qtTasks = 0
}
private let realm = try! Realm()

class RealmSaving{
    static let safekeepingRealm = RealmSaving()
    private let task = ToDoInfo()
    func safekeeping(){
        if task.qtTasks < qt{
            task.qtTasks = qt
        }
        try! realm.write{
            task.qtTasks += 1
            realm.add(task)
            forUpload()
        }
    }
    func forUpload(){
        let allTasks = realm.objects(ToDoInfo.self)
        qt = allTasks.last?.qtTasks ?? 0
    }
}
