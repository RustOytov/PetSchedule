//
//  SetDataOnboardVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import SwiftUI
import SwiftData
import Combine

class SetDataOnboardVM: ObservableObject {
    @Published var dailyNorm: String = ""
    @Published var numberOfMeals: String = ""
    @Published var notification: Bool = false
    private(set) var pet: Pet?
    let nextAction: () -> Void

    init(nextAction: @escaping () -> Void) {
        self.nextAction = nextAction
    }

    func nextTapped() {
        nextAction()
    }
    
    @MainActor
    func setData(pet: Pet, context: ModelContext) {
        if let feed = pet.feed {
            feed.numberOfMeals = Int(numberOfMeals) ?? feed.numberOfMeals
            feed.dailyNorm = Int(dailyNorm) ?? feed.dailyNorm
            feed.gramsPerServing =
                feed.dailyNorm / max(feed.numberOfMeals, 1)
        } else {
            let feed = Feed(
                numberOfMeals: Int(numberOfMeals) ?? 0,
                dailyNorm: Int(dailyNorm) ?? 0,
                gramsPerServing:
                    (Int(dailyNorm) ?? 0) / max(Int(numberOfMeals) ?? 1, 1)
            )
            pet.owner?.notificationsIsOn = notification
            pet.feed = feed
            context.insert(feed)
        }
        nextTapped()
    }
}
