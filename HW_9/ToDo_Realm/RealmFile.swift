//
//  RealmFile.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import Foundation
import RealmSwift

class Task: Object{
    @objc dynamic var taskNote = "",
                      taskComplited = false
}

class TaskComplite: Object{
    @objc dynamic var taskName = ""
                  var allTasks = List<Task>()
}
