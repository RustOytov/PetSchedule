//
//  User.swift
//  PetSchedule
//
//  Created by Polaroytov on 1/12/26.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var createdAt: Date
    var notificationsIsOn: Bool
    
    @Relationship(deleteRule: .cascade)
    var pets: [Pet] = []
    
    init(name: String, createdAt: Date, notificationsIsOn: Bool) {
        self.name = name
        self.createdAt = createdAt
        self.notificationsIsOn = notificationsIsOn
    }
}

@Model
class Pet {
    var nickname: String
    var age: Int
    var breed: String
    var weight: Double
    var imagesUrls: [String] = []
    
    var owner: User?
    
    @Relationship(deleteRule: .cascade)
    var feed: Feed?
    @Relationship(deleteRule: .cascade)
    var plans: [Plan] = []
    @Relationship(deleteRule: .cascade)
    var walks: [Walk] = []
    
    init(nickname: String, age: Int, breed: String, weight: Double) {
        self.nickname = nickname
        self.age = age
        self.breed = breed
        self.weight = weight
    }
}

@Model
class Feed {
    var numberOfMeals: Int
    var dailyNorm: Int
    var gramsPerServing: Int
    
    @Relationship(deleteRule: .cascade)
    var meals: [Meal] = []
    
    init(numberOfMeals: Int, dailyNorm: Int, gramsPerServing: Int) {
        self.numberOfMeals = numberOfMeals
        self.dailyNorm = dailyNorm
        self.gramsPerServing = gramsPerServing
    }
}

@Model
class Meal {
    var time: Date
    var isDone: Bool
    
    init(time: Date, isDone: Bool) {
        self.time = time
        self.isDone = isDone
    }
}

@Model
class Walk {
    var date: Date
    var isDone: Bool
    
    init(date: Date, isDone: Bool) {
        self.date = date
        self.isDone = isDone
    }
}

@Model
class Plan {
    var title: String
    var text: String
    var date: Date
    
    init(title: String, text: String, date: Date) {
        self.title = title
        self.text = text
        self.date = date
    }
}

