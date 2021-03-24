//
//  ViewController.swift
//  HW12
//
//  Created by mac on 26.02.2021.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DailyWheatherLoaderDelegate {

    @IBOutlet weak var wheatherTableView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var wheatherLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    
    func updateDailyWheather(){
        wheatherTableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        getDailyWheather()
        loadedWheather()
        wheatherTableView.backgroundColor = .systemBlue
        
    }
    

     private func loadedWheather() {
        var cityName: String?
        var temp: Double?
        var feelsLike: Double?
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=dacda99f789972c741181a121168023c&units=metric"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    cityName = json["name"] as? String

                if let main = json["main"] {
                    feelsLike = main["feels_like"] as? Double
                    temp = main["temp"] as? Double
                }
                DispatchQueue.main.async {
                    self.feelsLikeLabel.text = "Ощущается как \(Int(feelsLike!))ºC"
                    self.wheatherLabel.text = "\(Int(temp!))ºC"
                    self.cityLabel.text = cityName
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }
        task.resume()
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WheatherCell", for: indexPath) as! WheatherTableViewCell
        
            cell.dataLabel?.text = "\(dailiWheatherDelegate!.list[indexPath.item].dt_txt)"
        
            cell.dailyTempLabel?.text = "\(Int(dailiWheatherDelegate!.list[indexPath.item].main.temp))"
        
            cell.dailyFeelsLikeLabel.text = "\(Int(dailiWheatherDelegate!.list[indexPath.item].main.feels_like))"
            cell.backgroundColor = .systemBlue
        cell.dataLabel.textColor = .white
        cell.dailyTempLabel.textColor = .white
        cell.dailyFeelsLikeLabel.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dailiWheatherDelegate?.list.count ?? 0)
    }
}

    
    

