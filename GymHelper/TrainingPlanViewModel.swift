//
//  TrainingPlanViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 19/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol TrainingPlanViewModeling: UITableViewDataSource {
    
}


class TrainingPlanViewModel : NSObject, TrainingPlanViewModeling
{
    var data : Results<TrainingPlan>!
    
    let realm = try! Realm()
    
    override init()
    {
        super.init()
        data = realm.objects(TrainingPlan.self)
    }
    
    
    func getPlan(at index : Int) -> TrainingPlan
    {
        return data[index]
    }
    
    func starClicked(at row: Int)
    {
        print("func starClicked at /(row)")
        let realm = try! Realm()
        try! realm.write {
            data[row].favorite = !data[row].favorite
        }
    }
    
}

extension TrainingPlanViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainingPlanCell.reuseIdentifier, for: indexPath) as! TrainingPlanCell
        cell.trainingPlan = data[indexPath.row]
        cell.tapAction = { [unowned self] (cell) in
            self.starClicked(at: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            print("Editing style = delete")
            try! realm.write {
                realm.delete(data[indexPath.row])
            }
            tableView.reloadData()
        }
    }
    
    
}

