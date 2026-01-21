//
//  ProfileOnboardView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI
import SwiftData

struct ProfileOnboardView: View {
    @StateObject var viewModel: ProfileOnboardVM
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.createdAt, order: .reverse) private var users: [User]

    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack() {
                Spacer()
                
                Text("Let's fill out the profile")
                    .foregroundStyle(.text)
                    .font(.alegreya(weight: .regular, size: 30))
                
                Image(.setProfileDog)
                    .resizable()
                    .scaledToFit()
                
                if !viewModel.allDataIsCorrect {
                    Text("All fields must be filled in")
                        .font(.alegreya(weight: .regular, size: 18))
                        .foregroundStyle(.red)
                }
                
                Resources.customTextField("Input your name", text: $viewModel.name)
                
                Resources.customTextField("Input nickname your pet", text: $viewModel.nickname)
                
                Resources.customTextField("Input breed your pet", text: $viewModel.breed)
                
                Resources.customTextField("Input weight your pet", text: $viewModel.weight)
                    .keyboardType(.numberPad)
                
                Resources.customTextField("Input how age your pet", text: $viewModel.age)
                    .keyboardType(.numberPad)
                    .padding(.bottom, 8)
                
                Resources.nextButton(text: "Next", action: { viewModel.setData(context: modelContext)
                })
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let vm = ProfileOnboardVM(nextAction: {})
    
    let container = try! ModelContainer(for: User.self, Pet.self)
    let context = ModelContext(container)
    
    ProfileOnboardView(viewModel: vm)
        .environment(\.modelContext, context)
}
