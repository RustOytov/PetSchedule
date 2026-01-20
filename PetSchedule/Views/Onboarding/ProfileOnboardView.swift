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
        VStack {
            Text(users.first?.name ?? "None name")
            Text(users.first?.pets.first?.nickname ?? "None nickname")
            
            TextField("Input name", text: $viewModel.name)
            TextField("Input nickname", text: $viewModel.nickname)
            TextField("Input breed", text: $viewModel.breed)
            TextField("Input age", text: $viewModel.age)
                .keyboardType(.numberPad)
            TextField("Input weight", text: $viewModel.weight)
                .keyboardType(.numbersAndPunctuation)
            
            Button {
                viewModel.setData(context: modelContext)
            } label: {
                Text("save data")
            }
        }
    }
}
