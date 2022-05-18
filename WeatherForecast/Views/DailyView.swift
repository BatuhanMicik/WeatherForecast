//
//  DailyView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI

struct DailyView: View {
    
    @ObservedObject var cityVM : CitiesViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily){ weather in
            LazyVStack{
                dailyCell(weather: weather)
            }
        }
    }
    private func dailyCell(weather : DailyWeather) -> some View{
        HStack{
            Text(cityVM.getDay(timeStamp: weather.dt).uppercased())
                .frame(width : 50)
            Spacer()
            
            Text("\(cityVM.getTemp(temp: weather.temp.max)) | \(cityVM.getTemp(temp: weather.temp.min)) C")
                .frame(width : 150)
            Spacer()
            
            cityVM.getWeatherIcon(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical,15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
