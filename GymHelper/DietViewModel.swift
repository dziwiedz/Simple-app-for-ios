//
//  DietViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 01/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol DietViewModeling : UITableViewDataSource
{
    func starClicked(at row: Int)
    func addDiet(name : String)
    func getDiet(AtIndex: Int) -> Diet
}


class DietViewModel: NSObject, DietViewModeling {
    var data : Results<Diet>!
    
    let realm = try! Realm()
    
    override init()
    {
        super.init()
        data = realm.objects(Diet.self)
    }
    
    func starClicked(at row: Int)
    {
        print("func starClicked at /(row)")
        try! realm.write {
            data[row].favorite = !data[row].favorite
        }
    }
    
    func addDiet(name: String) {
        let diet = Diet()
        diet.name = name
        diet.favorite = false
        diet.totalCarbo = 0
        diet.totalFats = 0
        diet.totalProteins = 0
        
        try! realm.write {
            realm.add(diet)
        }
    }
    
    func getDiet(AtIndex: Int) -> Diet {
        return data[AtIndex]
    }
}

extension DietViewModel : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DietTableViewCell.reuseIdentifier, for: indexPath) as! DietTableViewCell
        cell.diet = data[indexPath.row]
        cell.tapAction = { (cell) in
            self.starClicked(at: indexPath.row)
        }
        return cell     
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

/*
 
 
 
 */
