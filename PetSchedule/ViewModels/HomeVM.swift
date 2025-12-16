//
//  HomeVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation

class HomeVM {
    let changeFeed: () -> Void
    let showDetails: () -> Void
    
    init(
        changeFeed: @escaping () -> Void,
        showDetails: @escaping () -> Void
        
    ) {
        self.changeFeed = changeFeed
        self.showDetails = showDetails
    }
    
    func showDetailsTapped() {
        showDetails()
    }
    
    func changeFeedTapped() {
        changeFeed()
    }
}
