//
//  TabBarController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 17/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBarControllerItems()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    private func setupTabBarControllerItems()
    {
        
        //Create Diet Plan Tab
        let dietTab = DietViewController()
        let dietTabBarItem = UITabBarItem(title: "Diet", image: nil, tag: 0)
        let dietNavigationController = UINavigationController(rootViewController: dietTab)
        dietNavigationController.tabBarItem = dietTabBarItem
        
        //Create Home Tab
        let homeTab = HomeViewController()
        let homeTabBarItem = UITabBarItem(title: "Home", image: nil, tag: 1)
        let homeNavigationController = UINavigationController(rootViewController: homeTab)
        homeNavigationController.tabBarItem = homeTabBarItem
        
        // Create Training Plan Tab
        let trainigPlanTab = TrainingPlanViewController()
        let trainigPlanTabBarItem = UITabBarItem(title: "Trainig Plan", image: nil, tag: 2)
        let trainingPlanNavigationController = UINavigationController(rootViewController: trainigPlanTab)
        trainingPlanNavigationController.tabBarItem = trainigPlanTabBarItem
        
        // Add view controllers
        self.viewControllers = [dietNavigationController,
                                homeNavigationController
            ,trainingPlanNavigationController
        ]
        
        self.selectedIndex = 1
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("Selected \(viewController.title!)")
    }

}
