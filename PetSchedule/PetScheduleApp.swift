//
//  PetScheduleApp.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/14/25.
//

import SwiftUI
import SwiftData

@main
struct PetScheduleApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var coordinator = OnboardingCoordinator()
    @AppStorage("onboardingCompleted") var appOnboardingCompleted = false
    
    var body: some Scene {
        WindowGroup {
            if appOnboardingCompleted {
                TabBarCoordinatorView()
            } else {
                OnboardCoordinatorView(coordinator: coordinator, appCoordinator: appCoordinator)
            }
        }
        .modelContainer(for: [User.self, Pet.self, Feed.self, Meal.self, Walk.self, Plan.self])
    }
}
