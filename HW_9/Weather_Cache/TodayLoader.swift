//
//  TodayLoader.swift
//  HW_9
//
//  Created by Elizaveta Rogozhina on 14.07.2021.
//

import Foundation
import Alamofire

class TodayLoader{

    func loadTodayAlamofire(completion: @escaping ([DaysInfo.All_Day_Info]) -> Void){
        AF.request(URL(string: url_today_uploadAlam)!)
        .validate()
            .responseDecodable(of: DaysInfo.All_Day_Info.self) { (response) in
          guard let today = response.value else { return }
                completion([today])
        }
    }
}

