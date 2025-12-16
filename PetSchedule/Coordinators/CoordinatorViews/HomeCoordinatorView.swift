//
//  HomeCoordinatorView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import Combine

struct HomeCoordinatorView: View {
    @StateObject private var coordinator = HomeCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView(viewModel: HomeVM(changeFeed: coordinator.showChangeFeed, showDetails: coordinator.showDetails))
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .details:
                        Text("DetailsScreen")
                    }
                }
        }
        .sheet(item: $coordinator.selectedSheet) { sheet in
            switch sheet {
            case .changeFeed:
                Text("changeFeed")
            case .changePlans:
                Text("changePlans")
            case .changeWalks:
                Text("changeWalks")
            }
        }
    }
}
