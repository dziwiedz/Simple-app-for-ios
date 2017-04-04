//
//  DetailDietViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 02/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol DietDetailViewModeling : UITableViewDataSource {
    func getRecipe(AtIndex index : Int) ->String?
    func removeMeal(AtIndex index : Int)
}

class DietDetailViewModel: NSObject, DietDetailViewModeling {
    
    let realm = try! Realm()
    var masterDiet : Diet!
    var dataSource : List<Meal>!
    
    init(diet : Diet)
    {
        super.init()
        masterDiet = diet
        dataSource = masterDiet.meals
    }
    
    // MARK: DietDetailViewModeling methods
    
    func getRecipe(AtIndex index : Int) ->String?
    {
        return dataSource[index].recipe
    }
    
    func removeMeal(AtIndex index: Int) {
        let meal = dataSource[index]
        try! realm.write {
            masterDiet.totalCarbo -= meal.carbo
            masterDiet.totalProteins -= meal.proteins
            masterDiet.totalFats -= meal.fats
            dataSource.remove(objectAtIndex: index)
        }
    }
}

extension DietDetailViewModel : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.reuseIdentifier) as! MealTableViewCell
        cell.meal = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeMeal(AtIndex: indexPath.row)
            tableView.reloadData()
        }
    }
}
