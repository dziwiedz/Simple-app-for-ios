//
//  File.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 04/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol AddMealViewModeling {
    func addMeal(MealName name : String?,_ fats : String?,_ proteins : String?,_ carbo : String?,_ recipe : String?) -> Bool
}

class AddMealViewModel: DietDetailViewModel, AddMealViewModeling {
    func addMeal(MealName name : String?,_ fats : String?,_ proteins : String?,_ carbo : String?,_ recipe : String?) -> Bool
    {
        guard let name = name, name.characters.count > 0
            else { return false }
        
        guard let fats = fats, let intFats = Int(fats)
            else { return false }
        guard let proteins = proteins, let intProteins = Int(proteins)
            else { return false }
        guard let carbo = carbo, let intCarbo = Int(carbo)
            else { return false }
        
        let meal = Meal()
        meal.name = name
        meal.carbo = intCarbo
        meal.fats = intFats
        meal.proteins = intProteins
        meal.recipe = recipe

        try! realm.write {
            masterDiet.totalFats += intFats
            masterDiet.totalCarbo += intCarbo
            masterDiet.totalProteins += intProteins
            masterDiet.meals.append(meal)
        }
        return true
    }
}
