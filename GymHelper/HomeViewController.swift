//
//  HomeViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 17/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    
    var tableView : UITableView!
    
    var viewModel = HomeViewModel()

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
        self.title = "Favourites"
        let button = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showAboutAlert))
        self.navigationItem.rightBarButtonItem = button
        
    }
    
    private func setupTableView()
    {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate=self
        tableView.dataSource = viewModel
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellPlan")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellDiet")
        view.addSubview(tableView)
    }
    
    func showAboutAlert()
    {
        let message = "This app is created by Lukasz Niedzwiedz."
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let detailPlan = viewModel.getPlan(AtIndex: indexPath.row)
            let detailViewModel = DetailPlanViewModel(plan: detailPlan)
            let destination = DetailPlanViewController()
            destination.viewModel = detailViewModel
            navigationController?.pushViewController(destination, animated: true)
            print("dd")
        case 1:
            print("DD")
            let diet = viewModel.getDiet(AtIndex: indexPath.row)
            let vm = DietDetailViewModel(diet: diet)
            let vc = DietDetailsViewController()
            vc.viewModel = vm
            navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
    }

}
