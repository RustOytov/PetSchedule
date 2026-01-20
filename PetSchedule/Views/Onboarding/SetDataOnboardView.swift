//
//  SetDataOnboardView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import SwiftData


struct SetDataOnboardView: View {
    @StateObject var viewModel: SetDataOnboardVM
    
    @Environment(\.modelContext) private var modelContext
    @Query() private var pets: [Pet]
    
    var body: some View {
        VStack {
            Text(String(pets.first?.feed?.dailyNorm ?? 0))
                .padding()
            Text(String(pets.first?.feed?.gramsPerServing ?? 0))
            
            TextField("Input daily norm", text: $viewModel.dailyNorm)
                .keyboardType(.numberPad)
            TextField("Input number of meals", text: $viewModel.numberOfMeals)
                .keyboardType(.numberPad)
            Toggle("Notification", isOn: $viewModel.notification)
            
            Button {
                if let pet = pets.first {
                    viewModel.setData(pet: pet, context: modelContext)
                }
                
            } label: {
                Text("save data")
            }
        }
    }
}
