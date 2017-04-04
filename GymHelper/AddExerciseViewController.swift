//
//  AddExerciseViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 29/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class AddExerciseViewController: UIViewController, UITextFieldDelegate {
    
    let nameTextField = UITextField()
    let seriesTextField = UITextField()
    let repeatsTextField = UITextField()
    
    var viewModel : AddExerciseViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setLayout()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView()
    {
        self.title = "Add Exercise"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.edgesForExtendedLayout = []
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupSubviews()
    {
        setupTextField(textField: nameTextField, placeHolderText: "Nazwa cwiczenia")
        setupTextField(textField: seriesTextField, placeHolderText: "Ilosc serii")
        setupTextField(textField: repeatsTextField, placeHolderText: "Ilosc powtorzen")
    }
    
    private func setupTextField(textField : UITextField, placeHolderText : String)
    {
        textField.borderStyle = .bezel
        textField.placeholder = placeHolderText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.sizeToFit()
        textField.delegate = self
        self.view.addSubview(textField)
    }
    
    private func setLayout()
    {
        let margin = view.layoutMarginsGuide
        let padding = CGFloat(10)
        let fladding = CGFloat(30)
        
        // name text field constraints
        nameTextField.topAnchor.constraint(equalTo: margin.topAnchor, constant: padding).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        seriesTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: fladding).isActive = true
        seriesTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        seriesTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
//        seriesTextField.firstBaselineAnchor.constraint(equalTo: nameTextField.lastBaselineAnchor).isActive = true
        
        repeatsTextField.topAnchor.constraint(equalTo: seriesTextField.bottomAnchor, constant: fladding).isActive = true
        repeatsTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        repeatsTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
//        repeatsTextField.firstBaselineAnchor.constraint(equalTo: seriesTextField.lastBaselineAnchor).isActive = true
    }
    
    func cancelButtonTapped()
    {
       self.dismiss(animated: true, completion: nil)        
    }
    
    func saveButtonTapped()
    {
        guard let name = nameTextField.text
            else { return }
        guard let series = seriesTextField.text
            else { return }
        guard let repeats = repeatsTextField.text
            else { return }
        if (viewModel.addExercise(name: name, series: series, repeats: repeats))
        {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
