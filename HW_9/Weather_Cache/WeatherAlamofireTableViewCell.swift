
import UIKit
import Alamofire

private var dayCounter = 0


class WeatherAlamofireTableViewCell: UITableViewCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionTableAlam.delegate = self
        collectionTableAlam.dataSource = self
        collectionTableAlam.reloadData()
    }
    
    var dataForCollectionAlam: [DaysInfo.forBaseTableAlam] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForCollectionAlam.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWeatherAlam", for: indexPath) as! WeatherCollectionViewCellAlam,
            options = dataForCollectionAlam[indexPath.row]

        cell.temperLabelAlam.text = "\(options.temper_Alam)"
        cell.descriptLabelAlam.text = "\(options.descript_Alam)"
        cell.timeLabelAlam.text = options.time_Alam
        cell.iconImageAlam.image = options.icon_Alam
        //cell.iconImageAlam.backgroundColor = UIColor(red: 0.683, green: 0.496, blue: 0.673, alpha: 1.0)
        createSpinner().stopSpinner()
        return cell
}
    
    @IBOutlet weak var day_Label_Alam: UILabel!
    @IBOutlet weak var collectionTableAlam: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension WeatherAlamofireTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{}
