//
//  Diet.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 20/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import RealmSwift

class Diet : Object {
    dynamic var name = ""
    dynamic var favorite = false
    dynamic var totalFats = 0
    dynamic var totalProteins = 0
    dynamic var totalCarbo = 0
    let meals = List<Meal>()
    
}

//class Diet
//{
//    var dietName : String!
//    var totalFats: Int?
//    var totalProteins: Int?
//    var totalCarbo: Int?
//    var melasList = [Meal]()
//    
//    init (dietName: String)
//    {
//        self.dietName = dietName
//    }
//    
//}
