//
//  AllCityView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 4.10.2021.
//

import SwiftUI

struct AllCityView: View {
    
    @ObservedObject var cityVM : CitiesViewModel
    var body: some View {
        VStack{
            CityView(city: cityVM.city, date: cityVM.date)
                .shadow(radius: 0)
            DayWeatherView(cityVM: cityVM)
                .padding()
            HourWeatherView(cityVM: cityVM)
            DailyView(cityVM: cityVM)
        }.padding(.bottom,30)
    }
}

struct AllCityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
