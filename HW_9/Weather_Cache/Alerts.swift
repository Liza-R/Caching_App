//
//  Alerts.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import Foundation
import UIKit

class Alerts{
    func alertNilTF(vc: UIViewController){
 
        let alert = UIAlertController(title: "Enter city", message: "The search string must not be empty", preferredStyle: UIAlertController.Style.actionSheet),
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)

         alert.addAction(cancelAction)
         alert.pruneNegativeWidthConstraints()
         vc.present(alert, animated: true, completion: nil)
    }
    func alertCityNotFound(vc: UIViewController, cityName: String){
 
        let alert = UIAlertController(title: "City \(cityName) not found", message: "Enter another city", preferredStyle: UIAlertController.Style.actionSheet),
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)

         alert.addAction(cancelAction)
         alert.pruneNegativeWidthConstraints()
         vc.present(alert, animated: true, completion: nil)
    }
}
extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
