//
//  ProfileOnboardVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation

final class ProfileOnboardVM {

    let nextAction: () -> Void

    init(nextAction: @escaping () -> Void) {
        self.nextAction = nextAction
    }

    func nextTapped() {
        nextAction()
    }
}
