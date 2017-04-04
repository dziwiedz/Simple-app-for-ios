//
//  DietViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 14/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class DietViewController: UIViewController, UITableViewDelegate {

    
    var tableView : UITableView!
    
    var viewModel : DietViewModel = DietViewModel()
    
    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: Private methods
    
    private func setupView()
    {
        self.title = "Diet View"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func setupTableView()
    {
        tableView = UITableView(frame: view.bounds)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(DietTableViewCell.self , forCellReuseIdentifier: DietTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = viewModel
        self.view.addSubview(tableView)
    }
    // MARK: Buttons actions
    
    func saveDiet(diet: String) {
        print(#function)
        viewModel.addDiet(name: diet)
        tableView.reloadData() 
    }
    
    func addButtonTapped()
    {
        print("Add button tapped")
        let alert = UIAlertController(title: "Nowa dieta", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Wpisz nazwe"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] (action) in
            guard let text = alert.textFields?[0].text, text.characters.count > 0 else { return }
            self?.saveDiet(diet: text)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (self) in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: TableView delegates method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        let destination = DietDetailsViewController()
        let diet = viewModel.getDiet(AtIndex: indexPath.row)
        let detailDietViewModel = DietDetailViewModel(diet: diet)
        destination.viewModel = detailDietViewModel
        navigationController?.pushViewController(destination, animated: true)
        
    }


}
