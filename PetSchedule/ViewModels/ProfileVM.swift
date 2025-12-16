//
//  ProfileVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine

class ProfileVM: ObservableObject {
    let changeProfile: () -> Void
    let showImages: () -> Void
    let dismissFullScreen: () -> Void
    
    init(changeProfile: @escaping () -> Void, showImages: @escaping () -> Void, dismissFullScreen: @escaping () -> Void) {
        self.changeProfile = changeProfile
        self.showImages = showImages
        self.dismissFullScreen = dismissFullScreen
    }
    
    func changeProfileTapped() {
        changeProfile()
    }
    
    func showImagesTapped() {
        showImages()
    }
    
    func dismissImageCollection() {
        dismissFullScreen()
    }
    
    func dismissChangeProfile() {
        dismissFullScreen()
    }
}
