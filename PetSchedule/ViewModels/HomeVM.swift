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

    func getLocation() {
        locationManager.requestLocation()
        if let location = locationManager.location {
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
        }
    }
}
