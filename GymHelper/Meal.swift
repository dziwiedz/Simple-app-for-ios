//
//  Meal.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 20/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import RealmSwift

enum MealTime
{
    case Breakfast
    case Lunch
    case Dinner
    
}

class Meal: Object {
    dynamic var name = ""
    dynamic var fats : Int = 0
    dynamic var proteins : Int = 0
    dynamic var carbo : Int = 0
    dynamic var recipe : String? = nil
}
//
//class Meal
//{
//    var mealName : String!
//    var fats : Int?
//    var carbo : Int?
//    var proteins : Int?
//    var recipe : String?
//    
//    init (mealName : String)
//    {
//        self.mealName = mealName
//    }
//    
//}
