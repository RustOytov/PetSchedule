//
//  ProfileCoordinatorView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import Combine

struct ProfileCoordinatorView: View {

    @StateObject private var coordinator = ProfileCoordinator()
    @StateObject private var viewModel: ProfileVM

    init() {
        let coordinator = ProfileCoordinator()
        _coordinator = StateObject(wrappedValue: coordinator)

        _viewModel = StateObject(
            wrappedValue: ProfileVM(
                changeProfile: coordinator.changeProfile,
                showImages: coordinator.showImages,
                dismissFullScreen: coordinator.dismissFullScreen
            )
        )
    }

    var body: some View {
        NavigationStack {
            ProfileView(viewModel: viewModel)
        }
        .fullScreenCover(item: $coordinator.selectedFullScreen) { item in
            switch item {
            case .changeProfile:
                ChangeProfileView(viewModel: viewModel)

            case .showImages:
                ImagesCollectionView(viewModel: viewModel)
            }
        }
    }
}

