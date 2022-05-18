//
//  HourWeatherView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI

struct HourWeatherView: View {
    @ObservedObject var cityVM : CitiesViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators : false){
            HStack(spacing: 20){
                ForEach(cityVM.weather.hourly){ weather in
                    let icon = cityVM.getWeatherIcon(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVM.getTime(timeStamp: weather.dt)
                    let temp = cityVM.getTemp(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
                
            }
        }
    }
    private func getHourlyView(hour : String, image : Image, temp : String) -> some View{
        VStack(spacing : 20){
            Text(hour)
            image.foregroundColor(.yellow)
                .font(.title)
            Text(temp)
                .font(.system(size: 28))
        }
        .foregroundColor(.white)
        .padding(.vertical, 35)
        .padding(.horizontal, 35)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct HourWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
