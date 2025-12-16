//
//  HomeCoordinator.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine

enum HomeSheet: Hashable, Identifiable {
    var id: String {
        switch self {
        case .changeFeed:
            return "changeFeed"
        case .changeWalks:
            return "changeWalks"
        case .changePlans:
            return "changePlans"
        }
    }
    
    case changeFeed
    case changeWalks
    case changePlans
}
enum HomeRoute: Hashable {
    case details
}

final class HomeCoordinator: Coordinator {
    @Published var path: [HomeRoute] = []
    @Published var selectedSheet: HomeSheet?
    
    func showDetails() {
        path.append(.details)
    }
    
    func showChangeFeed() {
        self.selectedSheet = .changeFeed
    }
}
