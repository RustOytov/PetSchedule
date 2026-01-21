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
    @State var date: Date = .now
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Let's fill out the meal schedule")
                    .foregroundStyle(.text)
                    .font(.alegreya(weight: .medium, size: 30))
                
                Image(.setFeedDog)
                    .resizable()
                    .scaledToFit()
                
                if !viewModel.allDataIsCorrect {
                    Text("All fields must be filled in")
                        .font(.alegreya(weight: .regular, size: 18))
                        .foregroundStyle(.red)
                }
                
                Resources.customTextField("Input daily norm", text: $viewModel.dailyNorm)
                    .keyboardType(.numberPad)
                
                Resources.customTextField("Input number of meals", text: $viewModel.numberOfMeals)
                    .keyboardType(.numberPad)
                
                HStack {
                    Text("Notifications")
                        .foregroundStyle(.text)
                        .font(.alegreya(weight: .regular, size: 18))
                        .padding(.leading, 8)
                    Toggle("", isOn: $viewModel.notificationsIsOn)
                }
                
            Resources.nextButton(text: "Save data", action: { viewModel.setData(pet: pets[0], context: modelContext)})
                   
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SetDataOnboardView(viewModel: SetDataOnboardVM(nextAction: { }))
}
