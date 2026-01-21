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
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                
                Text("Welcome")
                    .foregroundStyle(.text)
                    .font(.alegreya(weight: .medium, size: 30))
                
                Image(.welcomeDog)
                    .resizable()
                    .scaledToFit()
                    
                
                Text("Set up your pet's schedule in just a few clicks and your day will become much easier")
                    .foregroundStyle(.text)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .font(.alegreya(weight: .medium, size: 22))
                
                Resources.nextButton(text: "Next", action: viewModel.nextTapped)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeOnboardView(viewModel: WelcomeOnboardVM(nextAction: { }))
}
