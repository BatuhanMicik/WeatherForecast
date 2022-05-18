//
//  DayWeatherView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI

struct DayWeatherView: View {
    @ObservedObject var cityVM : CitiesViewModel
    
    var body: some View {
        VStack(spacing : 12){
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing : 22){
                
                VStack(alignment : .leading){
                    Text("\(cityVM.temperature) °C")
                        .font(.system(size: 50))
                    Text(cityVM.conditions)
                }
            }
            HStack{
                Spacer()
                widgetView(image: "wind", color: .orange, title: "\(cityVM.windSpeed) km/h")
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .yellow, title: "\(cityVM.rainChances)")
                Spacer()
            }
                
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.32))
            .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    private func widgetView(image : String, color : Color, title : String) -> some View{
        VStack{
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            Text(title)
        }
    }
    
}

struct DayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
