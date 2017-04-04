//
//  DetailPlanViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 29/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol DetailPlanViewModeling : UITableViewDataSource
{
    func saveExercise(_ exercise: Exercise)
    func removeExercise(AtIndex index : Int)
}

class DetailPlanViewModel : NSObject, DetailPlanViewModeling
{
    var dataSource : List<Exercise>!
    var masterTrainingPlan : TrainingPlan!
    let realm = try! Realm()
    var planName : String!
    
    
    init(plan : TrainingPlan)
    {
        super.init()
        masterTrainingPlan = plan
        dataSource = masterTrainingPlan.exercises
        planName = plan.name
    }
    
    func saveExercise(_ exercise: Exercise)
    {
        try! realm.write {
            dataSource.append(exercise)
        }
        
    }
    
    func removeExercise(AtIndex index: Int) {
        try! realm.write {
            dataSource.remove(objectAtIndex: index)
        }
    }
    
}

extension DetailPlanViewModel : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseTableViewCell
        cell.exercise = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write {
                dataSource.remove(objectAtIndex: indexPath.row)
            }
            tableView.reloadData()
        }
    }
}
