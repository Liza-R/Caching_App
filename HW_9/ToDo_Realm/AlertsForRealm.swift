//
//  Alerts.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 07.08.2021.
//

import Foundation
import UIKit

class AlertsRealm{
    func alertEmptyTF(vc: UIViewController){
        let alert = UIAlertController(title: "Empty task", message: "Fill in a blank task", preferredStyle: UIAlertController.Style.actionSheet),
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)

         alert.addAction(cancelAction)
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
