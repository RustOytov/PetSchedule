//
//  ResourcesView.swift
//  PetSchedule
//
//  Created by Polaroytov on 1/21/26.
//

import SwiftUI

final class Resources {
    
    // MARK: - nextButton
    
    static func nextButton(text: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            ZStack {
                Color.secondaryBg
                    .ignoresSafeArea()
                Text(text)
                    .foregroundStyle(.text)
                    .font(.alegreya(weight: .medium, size: 22))
                    .padding(14)
            }
            .frame(maxHeight: 60)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    // MARK: - customTextField
    
    static func customTextField(_ titleKey: LocalizedStringKey, text: Binding<String>) -> some View {
        TextField(titleKey, text: text)
            .padding(10)
            .background(.secondaryBg.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
}

