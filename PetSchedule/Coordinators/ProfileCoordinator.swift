//
//  ProfileCoordinator.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine

enum ProfileFullScreen: Hashable, Identifiable {
    var id: String {
        switch self {
        case .showImages:
            return "showImages"
        case .changeProfile:
            return "changeProfile"
        }
    }
    case showImages
    case changeProfile
}

final class ProfileCoordinator: Coordinator {
    @Published var selectedFullScreen: ProfileFullScreen?
    
    func showImages() {
        selectedFullScreen = .showImages
    }
    
    func changeProfile() {
        selectedFullScreen = .changeProfile
    }
    
    func dismissFullScreen() {
        selectedFullScreen = nil
    }
}
