//
//  Daily2Wheather.swift
//  HW12
//
//  Created by mac on 21.03.2021.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation
import Alamofire

protocol DailyWheather2LoaderDelegate {
    func updateDaily2Wheather()
}

struct Daily2Wheather: Decodable {
    let list: [List2]
}
struct List2: Decodable {
    let dt_txt: String
    let main: Main2
}
struct Main2: Decodable {
    let temp: Double
    let feels_like: Double
}

var delegate2: DailyWheather2LoaderDelegate?
var dailiWheather2Delegate: Daily2Wheather?

func getDaily2Wheather(){

    AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=1e2d102e87d25afa699664c4340f1530").responseData { response in
        if let objects = try? response.result.get() {
    do {
        let daily2Wheather = try JSONDecoder().decode(Daily2Wheather.self, from: objects)
            dailiWheather2Delegate = daily2Wheather
        
        DispatchQueue.main.async {
            delegate2?.updateDaily2Wheather() }
        }
    catch let error {
        print(error)
    }
}
    }
}
