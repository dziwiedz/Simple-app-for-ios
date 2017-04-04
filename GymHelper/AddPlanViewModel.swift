//
//  AddPlanViewModel.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 26/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import CoreData

protocol AddPlanViewModeling: UIPickerViewDataSource
{
    
}

class AddPlanViewModel : NSObject, AddPlanViewModeling
{
    var pickerData: [String] = [String]()
    
    override init() {
        super.init()
        for pressure in PlanPressures.allValues{
            pickerData.append(pressure.rawValue)
        }
    }
    

    func addPlan(name : String, selectedRow: Int)
    {
        let realm = try! Realm()
        let newPlan = TrainingPlan()
        newPlan.name = name
        newPlan.favorite = false
        newPlan.type = pickerData[selectedRow]
        
        try! realm.write {
            realm.add(newPlan)
        }
    }
    
    
}

extension AddPlanViewModel : UIPickerViewDataSource
{
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}
