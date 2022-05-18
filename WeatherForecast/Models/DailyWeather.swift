//
//  DailyWeather.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import Foundation

struct DailyWeather : Codable,Identifiable {
    var dt : Int
    var temp : Temperature
    var weather : [DetailWeather]
    
    
    enum CodingKey : String{
    case dt
    case temp
    case weather
    }
    
    init(){
        dt = 0
        temp = Temperature(min: 0.0, max:0.0)
        weather = [DetailWeather(main: "", description: "", icon: "")]
    }
}

extension DailyWeather{
    var id: UUID{
        return UUID()
    }
}
