//
//  Date + Extansions.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import Foundation

extension Date {
    
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
}
