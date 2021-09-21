//
//  WeatherTestApp.swift
//  WeatherTest
//
//  Created by Ru Nue on 21.09.2021.
//

import SwiftUI

@main
struct WeatherTestApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherListScreen().environmentObject(Store())
        }
    }
}

