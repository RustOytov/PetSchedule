//
//  WelcomeOnboardView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI


struct WelcomeOnboardView: View {
    var viewModel: WelcomeOnboardVM
    
    var body: some View {
        Button {
            viewModel.nextTapped()
        } label: {
            Text("next")
        }
    }
    
}
