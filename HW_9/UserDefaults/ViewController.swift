//
//  ViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = UserDef.safekeepingUD.userName
        lastNameTF.text = UserDef.safekeepingUD.userLastName
        
        self.nameTF.rx.text
            .orEmpty
            .subscribe(onNext: {new_Name in
                UserDef.safekeepingUD.userName = new_Name
        }).disposed(by: disposeBag)
        
        self.lastNameTF.rx.text
            .orEmpty
            .subscribe(onNext: {new_LastName in
                UserDef.safekeepingUD.userLastName = new_LastName
        }).disposed(by: disposeBag)
        
        print(UserDef.safekeepingUD.userName ?? "Name is Empty")
        print(UserDef.safekeepingUD.userLastName ?? "Last Name is Empty")
    }
}

