//
//  CitiesViewModel.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI
import CoreLocation

final class CitiesViewModel : ObservableObject{
    @Published var weather = WeatherResponse.empty()
    @Published var city : String = "Iskenderun"{
        didSet{
            getLocation()
        }
    }
    private lazy var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE"
    return formatter
    }()
    
    private lazy var timeFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init(){
       
    }
    
    var date : String {
        //weatherdaki date'i verecek
        return dateFormatter.string(from : Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    var weatherIcon : String{
        if weather.current.weather.count > 0{
            //taking icon from api
            return weather.current.weather[0].icon
        }
        //default icon
        return "sun.max.fill"
    }
    var temperature : String{
        return getTemp(temp: weather.current.temp)
    }
    var conditions : String{
        if weather.current.weather.count  > 0{
            //return main to take how is weather
            return weather.current.weather[0].main
        }
        //default icon
        return "main"
    }
    
    var windSpeed : String{
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity : String{
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances : String{
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getTime(timeStamp : Int) -> String{
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    func getTemp(temp: Double) -> String{
        return String(format: "%0.1f", temp)
        
    }
    
    func getDay(timeStamp : Int) -> String{
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first{
                self.getWeather(coordinate: place.location?.coordinate) //city with coordinate eşlemesi

                
            }
        }
    }
    
    private func getWeather(coordinate : CLLocationCoordinate2D?){
        if let coordinate = coordinate{
            let urlString = API.getLatLong(lat: coordinate.latitude, long: coordinate.longitude)
            getWeatherForCity(city: city, for: urlString)
        }else{
            //if coord not here
            let urlString = API.getLatLong(lat: 36.58718, long: 36.17347)
            getWeatherForCity(city: city, for: urlString)
        }
    }
    private func getWeatherForCity(city: String, for urlString: String){
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result{
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
        }
    }
   
    func getWeatherIcon(icon : String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
           return Image(systemName: "moon.fill")
        case "02d":
           return Image(systemName: "cloud.sun.fill")
        case "02n":
           return Image(systemName: "cloud.moon.fill")
        case "03d":
           return Image(systemName: "cloud.fill")
        case "03n":
           return Image(systemName: "cloud.fill")
        case "04d":
           return Image(systemName: "cloud.fill")
        case "04n":
           return Image(systemName: "cloud.fill")
        case "09d":
           return Image(systemName: "cloud.drizzle.fill")
        case "09n":
           return Image(systemName: "cloud.drizzle.fill")
        case "10d":
           return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
           return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
           return Image(systemName: "cloud.bolt.fill")
        case "11n":
           return Image(systemName: "cloud.bolt.fill")
        case "13d":
           return Image(systemName: "cloud.snow.fill")
        case "13n":
           return Image(systemName: "cloud.snow.fill")
        case "50d":
           return Image(systemName: "cloud.fog.fill")
        case "50n":
           return Image(systemName: "cloud.fog.fill")
        default:
            return Image (systemName: "sun.max.fill")
        }
    }
}
