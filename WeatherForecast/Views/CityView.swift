//
//  CityView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI

struct CityView: View {
    var city : String
    var date : String
    
    var body: some View {
        HStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                Text(city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text(date)
            })
            .foregroundColor(.white)
        }
}
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
