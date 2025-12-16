//
//  TabBarCoordinatorView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import Combine

struct TabBarCoordinatorView: View {
    @StateObject private var coordinator = TabBarCoordinator()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            Tab("Home", systemImage: "house", value: .home) {
                HomeCoordinatorView()
            }
            
            Tab("Profile", systemImage: "person.crop.circle", value: .profile) {
                ProfileCoordinatorView()
            }
        }
    }
}
