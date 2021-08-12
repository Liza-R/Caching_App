import UIKit
import DataCache

var cityNameAlam: String = "" // needed for search city

class WeatherViewController: UIViewController {

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var today_Label_Alam: UILabel!
    @IBOutlet weak var icon_Image_Alam: UIImageView!
    @IBOutlet weak var temp_Label_Alam: UILabel!
    @IBOutlet weak var max_Label_Alam: UILabel!
    @IBOutlet weak var min_temp_Label_alam: UILabel!
    @IBOutlet weak var descript_Label_Alam: UILabel!
    @IBOutlet weak var feels_like_Label_Alam: UILabel!
    @IBOutlet weak var weather_Table_Alamofire: UITableView!
    
    var codFiveDays = "",
        tableRowDataAlam: String = "",
        dayForTableAlam: [String] = [],
        allDataAlam: [String] = [],
        allWeatherInfo_Alam: [[DaysInfo.forBaseTableAlam]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSpinner().startSpinner()
        cityNameAlam = searchTF.text!
        let viewModelAlam = ViewModelAlamofire()
        viewModelAlam.weatherDelegateAlam = self
        self.weather_Table_Alamofire.reloadData()
        self.weather_Table_Alamofire.dataSource = self
        descript_Label_Alam.text = DataCache.instance.readString(forKey: "todayDescript")
        icon_Image_Alam.image = DataCache.instance.readImageForKey(key: "todayImage")
        temp_Label_Alam.text = DataCache.instance.readString(forKey: "todayCityNameTemp")
        today_Label_Alam.text = DataCache.instance.readString(forKey: "today")
        min_temp_Label_alam.text = DataCache.instance.readString(forKey: "todayMinT")
        max_Label_Alam.text = DataCache.instance.readString(forKey: "todayMaxT")
        feels_like_Label_Alam.text = DataCache.instance.readString(forKey: "todayFLT")
    }
    @IBAction func searchButton(_ sender: Any) {
        let alert = Alerts()
        if searchTF.text?.isEmpty == true{
            alert.alertNilTF(vc: self)
        }
        else{
            cityNameAlam = searchTF.text!
            let changeURL = changeURL()
            changeURL.changeTodayURLAlam(cityName: cityNameAlam)
            changeURL.changeFiveDaysURLAlam(cityName: cityNameAlam)
            if codFiveDays == ""{
                alert.alertCityNotFound(vc: self, cityName: cityNameAlam)
            }else{
                codFiveDays = ""
                let viewModelAlam = ViewModelAlamofire()
                viewModelAlam.weatherDelegateAlam = self
                self.weather_Table_Alamofire.reloadData()
                self.weather_Table_Alamofire.dataSource = self
            }
        }
    }
}

extension WeatherViewController: uploadWeatherAlamofire{

    func uploadFiveDays(allData_: [String], cod: String, allWeatherInfo_:  [[DaysInfo.forBaseTableAlam]], daysForTable: [String]) {
        allWeatherInfo_Alam = allWeatherInfo_
        codFiveDays = cod
        allDataAlam = allData_
        dayForTableAlam = daysForTable
        weather_Table_Alamofire.reloadData()
    }
    
    func uploadToday(todayAlam: DaysInfo.All_Day_Info, description: String, image: UIImage) {
        let date = NSDate(timeIntervalSince1970: TimeInterval(todayAlam.dt)),
            dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "YYYY-MM-dd"

        let dateString = dayTimePeriodFormatter.string(from: date as Date),
            todayInfo = "\(String(describing: Int(todayAlam.main!.temp - 273.15)))°C \(cityNameAlam)",
            min_temp = "Min: \(String(describing: Int(todayAlam.main!.temp_min - 273.15)))°C",
            max_temp = "Max: \(String(describing: Int(todayAlam.main!.temp_max - 273.15)))°C",
            feelsL_temp = "Feels like: \(String(describing: Int(todayAlam.main!.feels_like - 273.15)))°C"
     
        DataCache.instance.write(string: description, forKey: "todayDescript")
        DataCache.instance.write(image: image, forKey: "todayImage", format: .none)
        DataCache.instance.write(string: todayInfo, forKey: "todayCityNameTemp")
        DataCache.instance.write(string: "TODAY: \(dateString)", forKey: "today")
        DataCache.instance.write(string: "\(min_temp)", forKey: "todayMinT")
        DataCache.instance.write(string: "\(max_temp)", forKey: "todayMaxT")
        DataCache.instance.write(string: "\(feelsL_temp)", forKey: "todayFLT")

        self.min_temp_Label_alam.text = "\(min_temp)"
        self.max_Label_Alam.text = "\(max_temp)"
        self.feels_like_Label_Alam.text = "\(feelsL_temp)"
        self.descript_Label_Alam.text = description
        self.icon_Image_Alam.image = image
        self.today_Label_Alam.text = "TODAY: \(dateString)"
        self.temp_Label_Alam.text = "\(todayInfo)"
        weather_Table_Alamofire.reloadData()
    }
}

extension WeatherViewController: UITableViewDataSource{

    func tableView(_ tableView_Alam: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayForTableAlam.count
    }

    func tableView(_ tableView_Alam: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell_Alam = tableView_Alam.dequeueReusableCell(withIdentifier: "weather_Alamofire", for: indexPath) as! WeatherAlamofireTableViewCell
        
        tableRowDataAlam = dayForTableAlam[indexPath.row]
        cell_Alam.dataForCollectionAlam = allWeatherInfo_Alam[indexPath.row]
        cell_Alam.collectionTableAlam.reloadData()
        
        //day cell
        cell_Alam.day_Label_Alam.text = "\(tableRowDataAlam) \(cityNameAlam)"
        return cell_Alam
    }
}
