//
//  AppCoordinator.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import Combine

final class AppCoordinator: Coordinator {
    @Published var isOnboardingFinished = false

    func finishOnboarding() {
        isOnboardingFinished = true
    }
}
