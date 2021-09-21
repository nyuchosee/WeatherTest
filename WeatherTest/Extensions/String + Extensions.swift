//
//  String + Extansions.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
