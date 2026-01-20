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
    @Published var age: String = ""
    @Published var breed: String = ""
    @Published var weight: String = ""
    
    let nextAction: () -> Void
    
    init(nextAction: @escaping () -> Void) {
        self.nextAction = nextAction
    }
    
    func goToNextScreen() {
        nextAction()
    }
    
    func setData(context: ModelContext) {
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
