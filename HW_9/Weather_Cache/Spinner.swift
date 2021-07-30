//
//  Spinner.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 30.07.2021.
//

import Foundation
import Foundation
import SwiftSpinner

class createSpinner{
    func startSpinner(){
        DispatchQueue.main.async{
            SwiftSpinner.show("").outerColor = UIColor(red: 1.0, green: 0.764, blue: 0.983, alpha: 0.9)
            SwiftSpinner.show("Loading").innerColor = UIColor(red: 0.792, green: 0.609, blue: 0.188, alpha: 0.9)
        }
    }
    func stopSpinner(){
        DispatchQueue.main.async {
            SwiftSpinner.hide()
        }
    }
}
