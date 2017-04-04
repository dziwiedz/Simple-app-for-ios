//
//  TrainingPlanViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 14/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class TrainingPlanViewController: UIViewController , UITableViewDelegate{

    // MARK: Variables
    
    private var tableView : UITableView!
    
    var viewModel : TrainingPlanViewModel! //= TrainingPlanViewModel()
    
    
    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TrainingPlanViewModel()
        setupView()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setEditing(false, animated: animated)
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    // MARK: Private functions
    
    private func setupView()
    {
        self.title = "Training Plan View"
        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    private func setupTableView()
    {
        tableView = UITableView(frame: view.bounds)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(TrainingPlanCell.self, forCellReuseIdentifier: TrainingPlanCell.reuseIdentifier)
        tableView.dataSource = viewModel
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // MARK: Buttons actions
    
    func addButtonTapped() {
        print("Add tapped")
        let destination = AddPlanViewController()
        let nav = UINavigationController(rootViewController: destination)
        present(nav, animated: true) {
        }
    }
    
    // MARK: tableView Delegates method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row /(indexPath)")
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        let detailPlan = viewModel.getPlan(at: indexPath.row)
        let detailViewModel = DetailPlanViewModel(plan: detailPlan)
        let destination = DetailPlanViewController()
        destination.viewModel = detailViewModel
        navigationController?.pushViewController(destination, animated: true)
        
    }

}
