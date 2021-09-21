//
//  View + Extansions.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
