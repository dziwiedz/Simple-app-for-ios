//
//  DetailPlanViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 25/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class DetailPlanViewController: UIViewController, UITableViewDelegate {

    let tableView = UITableView()
    
    var viewModel : DetailPlanViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupView()
    {
        let title = viewModel?.planName
        self.title = title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func setupTableView()
    {
        tableView.frame = view.bounds
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
        tableView.dataSource = viewModel
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    func addButtonTapped()
    {
        let vc = AddExerciseViewController()
        let plan = viewModel.masterTrainingPlan!
        vc.viewModel = AddExerciseViewModel(plan: plan)
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
}
