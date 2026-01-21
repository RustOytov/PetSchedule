//
//  HomeVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine
import SwiftUI
import CoreLocation

class HomeVM {
    @Published var locationManager = LocationManager()
    @AppStorage("appLatitude") var appLatitude = 0.0
    @AppStorage("appLongitude") var appLongitude = 0.0
    let api = OpenMeteoAPI()
    
    let changeFeed: () -> Void
    let showDetails: () -> Void
    
    init(
        changeFeed: @escaping () -> Void,
        showDetails: @escaping () -> Void,
    ) {
        self.changeFeed = changeFeed
        self.showDetails = showDetails
    }
    
    func showDetailsTapped() {
        showDetails()
    }
    
    func changeFeedTapped() {
        changeFeed()
    }
    func getWeatherTest() {
        Task {
            do {
                let res = try await api.fetchWeather()
            } catch {
                print("error \(error)")
            }
        }
    }

    func getLocation() {
        locationManager.requestLocation()
        if let location = locationManager.location {
            appLatitude = location.coordinate.latitude
            appLongitude = location.coordinate.longitude
        }
    }
}
