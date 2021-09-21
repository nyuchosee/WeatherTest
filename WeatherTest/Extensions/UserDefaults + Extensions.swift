//
//  UserDefault + Extensions.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import Foundation

extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .celsius
        }
        return TemperatureUnit(rawValue: value) ?? .celsius
    }
    
}
