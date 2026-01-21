//
//  ProfileOnboardVM.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import Foundation
import Combine
import SwiftData

class ProfileOnboardVM: ObservableObject {
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var breed: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    @Published var allDataIsCorrect = true
    
    
    let nextAction: () -> Void
    
    init(nextAction: @escaping () -> Void) {
        self.nextAction = nextAction
    }
    
    func goToNextScreen() {
        nextAction()
    }
    
    func checkAllParametrs() -> Bool {
        if name.isEmpty || nickname.isEmpty || breed.isEmpty || age.isEmpty || weight.isEmpty {
            allDataIsCorrect = false
            return false
        }
        return true
    }
    
    func setData(context: ModelContext) {
        guard checkAllParametrs() else { return }
        print("context = \(context)")
        print("name = \(name)")
        let user = User(name: name, createdAt: .now, notificationsIsOn: false)
        let pet = Pet(nickname: nickname, age: Int(age) ?? 0, breed: breed, weight: Double(weight) ?? 0.0)
        
        pet.owner = user
        user.pets.append(pet)
        
        context.insert(user)
        
        goToNextScreen()
    }
}
