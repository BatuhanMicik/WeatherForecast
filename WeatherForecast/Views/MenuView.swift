//
//  MenuView.swift
//  WeatherForecast
//
//  Created by Batuhan Mıcık on 3.10.2021.
//

import SwiftUI


struct MenuView: View {
    
    @ObservedObject var cityVM : CitiesViewModel
    @State private var searching = "Iskenderun"
    var body: some View {
        HStack{
            TextField("", text: $searching)
                
               
                .padding(.leading,21)
                .frame(width: 200, height: 50, alignment: .leading)
            Button{
                cityVM.city = searching
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.secondary)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray).accentColor(.black)
                        .frame(width: 20, height: 20, alignment: .center)
                }
            }
            .frame(width: 60, height: 60)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading, content: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue.opacity(0.5))
        }))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
