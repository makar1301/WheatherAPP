//
//  SecondViewController.swift
//  HW12
//
//  Created by mac on 28.02.2021.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, DailyWheather2LoaderDelegate {

    @IBOutlet weak var wheather2TableView: UITableView!
    @IBOutlet weak var city2Label: UILabel!
    @IBOutlet weak var wheather2Label: UILabel!
    @IBOutlet weak var feelsLike2Label: UILabel!
    
    
    func updateDaily2Wheather(){
        wheather2TableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate2 = self
        getDaily2Wheather()
        loaded2Wheather()
        wheather2TableView.backgroundColor = .systemBlue
    }
    
    
    func loaded2Wheather() {
        var cityName: String?
        var temp: Double?
        var feelsLike: Double?

        AF.request("http://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=dacda99f789972c741181a121168023c&units=metric").responseJSON { response in
            if let objects = try? response.result.get() as? [String: AnyObject] {
            do {
             
              cityName = objects["name"] as? String

            if let main = objects["main"] {
                feelsLike = main["feels_like"] as? Double
                temp = main["temp"] as? Double
            }
            DispatchQueue.main.async {
                self.feelsLike2Label.text = "Ощущается как \(Int(feelsLike!))ºC"
                self.wheather2Label.text = "\(Int(temp!))ºC"
                self.city2Label.text = cityName
            }
            }
        }
        }
        }
        }
        
    

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WheatherCell2", for: indexPath) as! Wheather2TableViewCell
        
            cell.data2Label?.text = "\(dailiWheather2Delegate!.list[indexPath.item].dt_txt)"
        
            cell.dailyTemp2Label?.text = "\(Int(dailiWheather2Delegate!.list[indexPath.item].main.temp))"
        
            cell.dailyFeelsLike2Label.text = "\(Int(dailiWheather2Delegate!.list[indexPath.item].main.feels_like))"
            cell.backgroundColor = .systemBlue
        cell.data2Label.textColor = .white
        cell.dailyTemp2Label.textColor = .white
        cell.dailyFeelsLike2Label.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dailiWheather2Delegate?.list.count ?? 0)
    }
}

    
