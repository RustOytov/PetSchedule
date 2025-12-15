//
//  SetDataOnboardView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI


struct SetDataOnboardView: View {
    var viewModel: SetDataOnboardVM
    
    var body: some View {
        Button {
            viewModel.nextTapped()
        } label: {
            Text("next")
        }
    }
    
}
