//
//  ViewModelBase.swift
//  HW_7_
//
//  Created by Elizaveta Rogozhina on 10.05.2021.
//  Copyright © 2021 Lio Rin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol uploadWeatherAlamofire{
    func uploadToday(todayAlam: DaysInfo.All_Day_Info, description: String, image: UIImage)
    func uploadFiveDays(daysNum: Int, dataForCollectionAlam: [[DaysInfo.forBaseTableAlam]], cod: String,
                        dataForTable: [String])
}

class ViewModelAlamofire{
    
    private var today_Alam: [DaysInfo.All_Day_Info] = [],
                five_days_Alam: [DaysInfo.All_Five_Days_Info] = [],
               dayForTable_F: [String] = [],
               allData_F: [String] = [],
               massForTable_F: [DaysInfo.forBaseTableAlam] = []
    
    var weatherDelegateAlam: uploadWeatherAlamofire?

    init(){
        uploadToday()
        uploadDays()
    }
    
    func uploadToday(){
        TodayLoader().loadTodayAlamofire { today in
            self.today_Alam = today
            DispatchQueue.main.async {
                for i in today{
                     var icon_today_Alam: String? = "",
                         descript: String = ""
                     
                     for j in i.weather{
                        icon_today_Alam = j?.icon
                        descript = j?.description ?? "Not Found"
                     }
  
                    let url_icon_Al = url_icon_upload.replacingOccurrences(of: "PICTURENAME", with: "\(icon_today_Alam!)")

                    AF.request(URL(string: url_icon_Al)!, method: .get).response{ response in
                        switch response.result {
                            case .success(let responseData):
                                self.weatherDelegateAlam?.uploadToday(todayAlam: i, description: descript, image: UIImage(data: responseData!, scale:1) ?? .checkmark)
                            case .failure(let error):
                                print("error--->",error)
                        }
                    }
                }
            }
        }
    }
    
    func uploadDays(){
        
        var temp_: [String] = [],
            descript: [String] = [],
            iconLinkAlam: [String] = [],
            iconsAlam: [UIImage] = [],
            data: [String] = [],
            time: [String] = [],
            cod: String = ""
  
        let date = Date(),
        formatter = DateFormatter()
        
        formatter.dateFormat = "YYYY-MM-dd"
        
        let result_Al = formatter.string(from: date)

        TodayFiveDaysLoader().loadFiveDaysAlamofire { five_days in
            self.five_days_Alam = five_days
            DispatchQueue.main.async {
                for i in five_days{
                    cod = i.cod
                    for j in i.list{
                        let denechek = j?.dt_txt.components(separatedBy: " ")
                        if denechek![0] != result_Al{
                            temp_.append("\(String(describing: Int((j!.main!.temp) - 273.15)))°C ")
                            data.append(denechek?[0] ?? "Not Found")
                            time.append(denechek?[1] ?? "Not Found")
                            for (_, w) in (j?.weather.enumerated())!{
                                descript.append("\(w!.description)")
                                iconLinkAlam.append(w!.icon)
                            }
                            for (k, ic) in iconLinkAlam.enumerated(){
                                let url_icon = url_icon_upload.replacingOccurrences(of: "PICTURENAME", with: "\(ic)")
                                AF.request(URL(string: url_icon)!, method: .get).response{ response in
                                    switch response.result{
                                        case .success(let responseData):
                                        iconsAlam.append(UIImage(data: responseData!, scale:1) ?? .checkmark)
                                        
                                        if iconsAlam.count == temp_.count{
                                            var allWeatherInfo_Alam: [[DaysInfo.forBaseTableAlam]] = [[]]
                                            let d: DaysInfo.forBaseTableAlam = DaysInfo.forBaseTableAlam(temper_Alam: temp_[k], icon_Alam: iconsAlam[k], descript_Alam: descript[k], data_Alam: data[k], time_Alam: time[k])
                                            self.massForTable_F.append(d)
                                            self.allData_F.append(d.data_Alam)
                                            
                                            var set = Set<String>()
                                            self.dayForTable_F = self.allData_F.filter{ set.insert($0).inserted }
                                            self.dayForTable_F = self.dayForTable_F.filter { $0 != result_Al }

                                            for _ in 0...self.dayForTable_F.count - 2{
                                                allWeatherInfo_Alam.append([])
                                            }
                                            for (y, u) in self.dayForTable_F.enumerated(){
                                                for (_, j) in self.allData_F.enumerated(){
                                                    if u == j{
                                                        allWeatherInfo_Alam[y].append(d)
                                                    }
                                                }
                                            }
                                            print(allWeatherInfo_Alam)
                                            self.weatherDelegateAlam?.uploadFiveDays(daysNum: self.dayForTable_F.count, dataForCollectionAlam: allWeatherInfo_Alam, cod: cod, dataForTable: self.dayForTable_F)
                                        }
                                    case .failure(let error):
                                        print("error--->",error)
                                }
                            }
                        }
                    }
                
                    }
                }
            }
        }
    }
}
