//
//  WeatherListScreen.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListScreen: View {
    
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
            }
        .listStyle(PlainListStyle())
        
        .sheet(item: $activeSheet, content: { (item) in
            switch item {
                case .addNewCity:
                    AddCityScreen().environmentObject(store)
                case .settings:
                    SettingsScreen().environmentObject(store)
            }
        })
        
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            activeSheet = .addNewCity
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Cities")
        .embedInNavigationView()
       
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    @EnvironmentObject var store: Store
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                .frame(width: 50, height: 50)
            
            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))")
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

    }
}

