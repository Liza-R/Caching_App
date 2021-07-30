//
//  DaysLoader.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import Foundation
import Alamofire

class TodayFiveDaysLoader{
     func loadFiveDaysAlamofire(completion: @escaping ([DaysInfo.All_Five_Days_Info]) -> Void){
        
        AF.request(URL(string: url_fiveDays_uploadAlam)!)
        .validate()
            .responseDecodable(of: DaysInfo.All_Five_Days_Info.self) { (response) in
                    guard let five_days = response.value else { return }
                    completion([five_days])
        }
    }
}
