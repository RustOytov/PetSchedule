//
//  OnboardingCoordinator.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//
import SwiftUI
import Combine

enum OnboardingRoute: Hashable {
    case setdata
    case profile
}

final class OnboardingCoordinator: Coordinator {
    @Published var path: [OnboardingRoute] = []
    
    func showWelcomeView() {
        path.removeAll()
    }
    
    func goToSetDataView() {
        path.append(.setdata)
    }
    
    func goToSetProfileView() {
        path.append(.profile)
    }
}
