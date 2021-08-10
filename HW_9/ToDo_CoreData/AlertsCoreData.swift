//
//  AlertsCoreData.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 10.08.2021.
//

import Foundation

class AlertsCD{
    
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
