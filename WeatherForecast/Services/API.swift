//
//  API.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import Foundation
struct API {
    static let key = "5f315e51a22a90789a0c30ad443fbf25"
}

extension API{
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    
    static func getLatLong(lat : Double, long : Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(long)&exlude=minutely&appid=\(key)&units=metric"
    }
}
