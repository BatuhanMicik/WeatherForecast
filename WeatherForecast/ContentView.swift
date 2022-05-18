//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CitiesViewModel()
    var body: some View {
        ZStack(alignment : .bottom){
            VStack(spacing : 0){
                MenuView(cityVM: cityVM)
                ScrollView(showsIndicators : false){
                    AllCityView(cityVM: cityVM)
                }
                
            }.padding(.top,40)
        }.background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
