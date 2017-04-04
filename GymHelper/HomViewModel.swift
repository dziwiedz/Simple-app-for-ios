//
//  HomViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 30/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol HomeViewModeling : UITableViewDataSource
{
    func getPlan(AtIndex index : Int) -> TrainingPlan
    func getDiet(AtIndex index : Int) -> Diet
}

class HomeViewModel : NSObject, HomeViewModeling
{
    var favoritePlans : Results<TrainingPlan>!
    var favoriteDiets : Results<Diet>!
    
    let realm = try! Realm()
    
    override init() {
        favoritePlans = realm.objects(TrainingPlan.self).filter("favorite = true")
        favoriteDiets = realm.objects(Diet.self).filter("favorite = true")
    }
    
    func getPlan(AtIndex index : Int) -> TrainingPlan
    {
        return favoritePlans[index]
    }
    func getDiet(AtIndex index : Int) -> Diet
    {
        print("Count: \(favoriteDiets.count) Indeks:\(index)")
        return favoriteDiets[index]
    }
    
}



extension HomeViewModel : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return favoritePlans.count
        case 1:
            print ("\(favoriteDiets.count) Diet")
            return favoriteDiets.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell : UITableViewCell
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlan", for: indexPath)
            cell.textLabel?.text = favoritePlans[indexPath.row].name
            cell.accessoryType = .disclosureIndicator
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellDiet", for: indexPath)
            cell.textLabel?.text = favoriteDiets[indexPath.row].name
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Training Plans"
        case 1:
            return "Diets"
        default:
            return "What section?"
        }
    }
    
    
    
    
    
}
