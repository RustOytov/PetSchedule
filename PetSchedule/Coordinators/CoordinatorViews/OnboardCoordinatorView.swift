//
//  OnboardCoordinatorView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI

struct OnboardCoordinatorView: View {
    @StateObject var coordinator: OnboardingCoordinator
    let appCoordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            WelcomeOnboardView(viewModel: WelcomeOnboardVM(nextAction: coordinator.goToSetDataView))
                .navigationDestination(for: OnboardingRoute.self) { route in
                    switch route {
                    case .setdata:
                        SetDataOnboardView(viewModel: SetDataOnboardVM(nextAction: coordinator.goToSetProfileView))
                        
                    case .profile:
                        ProfileOnboardView(viewModel: ProfileOnboardVM(nextAction: { appCoordinator.finishOnboarding() }))
                    }
                }
        }
        .onAppear {
            coordinator.showWelcomeView()
        }
    }
}
