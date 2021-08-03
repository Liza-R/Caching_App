//
//  TDRealmViewController.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

let task = ToDoInfo()

class TDRealmViewController: UIViewController {

    @IBOutlet weak var todoTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var labelForQT: UILabel!
    
    let disposeBag = DisposeBag()
    //private
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //RealmSaving.safekeepingRealm.safekeeping()
        self.todoTable.rowHeight = 100
        self.todoTable.dataSource = self
        self.todoTable.reloadData()
        self.labelForQT.text = "\(task.qtTasks)"
        
        self.addButton.rx.tap
            .subscribe(onNext: {_ in
                task.qtTasks += 1
                self.todoTable.reloadData()
                self.labelForQT.text = "\(task.qtTasks)"
        }).disposed(by: disposeBag)
        //RealmSaving.safekeepingRealm.safekeeping()
    }
}

extension TDRealmViewController: UITableViewDataSource{

    func tableView(_ tableView_Alam: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.qtTasks
    }
    
    func tableView(_ tableView_Alam: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView_Alam.dequeueReusableCell(withIdentifier: "realmCell", for: indexPath) as! RealmToDoTableViewCell
        
        
        
        return cell_Alam
    }
}
