//
//  File.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .celsius
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
}
