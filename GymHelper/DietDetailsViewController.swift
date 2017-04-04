//
//  DietDetailsViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 02/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class DietDetailsViewController: UIViewController, UITableViewDelegate {
    
    var tableView : UITableView!
    var viewModel : DietDetailViewModel!

    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: Private methods
    private func setupView()
    {
        self.title = viewModel.masterDiet.name
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func setupTableView()
    {
        tableView = UITableView(frame: view.bounds)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(MealTableViewCell.self, forCellReuseIdentifier: MealTableViewCell.reuseIdentifier)
        tableView.dataSource = viewModel
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func setLayout()
    {
        
    }
    
    // MARK: Buttons functions
    
    func addButtonTapped()
    {
        let destination = AddMealViewController()
        let masterDiet = viewModel.masterDiet!
        destination.viewModel = AddMealViewModel(diet: masterDiet)
        let nav = UINavigationController(rootViewController: destination)
        present(nav, animated: true, completion: nil)
        
    }
    
    
    // MARK: UITableView delegate methods
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let recipe = viewModel.getRecipe(AtIndex: indexPath.row)
        let alert = UIAlertController(title: "Przepis", message: recipe, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
//    MARK: AddMealDelegate methods
    
    func addMeal()
    {
        print("add meal")
    }


}
