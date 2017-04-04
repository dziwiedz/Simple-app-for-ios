//
//  AddExerciseViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 04/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol AddExerciseViewModeling
{
    func addExercise(name : String, series : String, repeats: String) -> Bool
}

class AddExerciseViewModel : DetailPlanViewModel, AddExerciseViewModeling
{    
    func addExercise(name : String, series : String, repeats: String) -> Bool
    {
        guard let seriesNumber = Int(series)
            else { return false }
        guard let repeatsNumber = Int(repeats)
            else { return false }
        let exercise = Exercise()
        if (name.characters.count > 0) {
            exercise.name = name
        }
        else {
            return false
        }
        exercise.repeatsNumber = repeatsNumber
        exercise.seriesNumber = seriesNumber
        try! realm.write()
            {
                masterTrainingPlan.exercises.append(exercise)
        }
        return true
    }
}
