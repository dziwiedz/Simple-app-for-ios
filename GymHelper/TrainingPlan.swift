//
//  TrainingPlan.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 19/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import RealmSwift


enum PlanPressures : String {
    case GainMass = "Nabieranie Masy"
    case Slimming = "Odchudzanie"
    case Strength = "Nabieranie sily"
    case FullBodyWorkout = "Trening calego ciala"
    case Split = "Podzial na partie miesniowe"
    
    static let allValues = [GainMass, Slimming, Strength,FullBodyWorkout, Split]
}

class TrainingPlan : Object {
    dynamic var name = ""
    dynamic var type = ""
    dynamic var favorite = false
    let exercises = List<Exercise>()
    
    func getExercisesNumber() -> String {
        return String(exercises.count)
    }
}

//class TrainingPlan
//{
//    var planName : String!
//    var planType: PlanPressures?
//    lazy var exercises = [Exercise]()
//    init(name : String) {
//        self.planName = name
//        
//    }
//}

