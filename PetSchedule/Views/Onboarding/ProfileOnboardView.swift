//
//  ProfileOnboardView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI


struct ProfileOnboardView: View {
    var viewModel: ProfileOnboardVM
    
    var body: some View {
        Button {
            viewModel.nextTapped()
        } label: {
            Text("next")
        }
    }
}
