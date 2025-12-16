//
//  TabBarCoordinator.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine

enum SelectedTab: Hashable {
    case home
    case profile
}

final class TabBarCoordinator: Coordinator {
    @Published var selectedTab: SelectedTab = .home
    
}
