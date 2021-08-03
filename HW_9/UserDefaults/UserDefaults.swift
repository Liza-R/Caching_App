//
//  UserDefaults.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 01.08.2021.
//

import Foundation

class UserDef{
    static let safekeepingUD = UserDef()
    private let keyUserName = "UserDef.keyUserName",
                keyUserLastName = "UserDef.keyUserLastName"
    
    var userName: String?{
        set { UserDefaults.standard.set(newValue, forKey: keyUserName) }
        get { return UserDefaults.standard.string(forKey: keyUserName) }
    }
    var userLastName: String?{
        set { UserDefaults.standard.set(newValue, forKey: keyUserLastName) }
        get { return UserDefaults.standard.string(forKey: keyUserLastName) }
    }
}
