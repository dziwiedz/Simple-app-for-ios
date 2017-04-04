//
//  AddMealViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 03/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

//    MARK: - Constatns
    
    let nameTextField = UITextField()
    let fatsTextField = UITextField()
    let proteinsTextField = UITextField()
    let carboTextField = UITextField()
    let recipeTextField = UITextView()
    var viewModel : AddMealViewModel!
    
//    MARK: -  UIViewController methods
    
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
    
//    MARK: - private methods
    
    private func setupView()
    {
        self.title = "Add Meal"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.edgesForExtendedLayout = []
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupSubviews()
    {
        setupTextField(textField: nameTextField, placeHolderText: "Meal name")
        setupTextField(textField: fatsTextField, placeHolderText: "Fats amount")
        setupTextField(textField: proteinsTextField, placeHolderText: "Proteins amount")
        setupTextField(textField: carboTextField, placeHolderText: "Carbo amount")
        setupTextView(textView: recipeTextField, placeHolderText: "dasda")
//        setupTextField(textField: recipeTextField, placeHolderText: "Recipe?")
    }
    
    private func setLayout()
    {
        let margin = view.layoutMarginsGuide
        let padding = CGFloat(10)
        // Name text field constraints
        nameTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: margin.topAnchor, constant : padding).isActive = true
        
        // Fats text field constraints
        fatsTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        fatsTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        fatsTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant : padding).isActive = true
        
        // Carbo text field constraints
        carboTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        carboTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        carboTextField.topAnchor.constraint(equalTo: fatsTextField.bottomAnchor, constant : padding).isActive = true
        
        // Proteins text field constraints
        proteinsTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        proteinsTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        proteinsTextField.topAnchor.constraint(equalTo: carboTextField.bottomAnchor, constant : padding).isActive = true
        
        // Recipe text field constraints
        recipeTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        recipeTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        recipeTextField.topAnchor.constraint(equalTo: proteinsTextField.bottomAnchor, constant : padding).isActive = true

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
    
    private func setupTextView(textView : UITextView, placeHolderText : String)
    {
        textView.translatesAutoresizingMaskIntoConstraints   = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.blue
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5
        textView.delegate = self
        view.addSubview(textView)
    }
    
//    MARK: - Buttons actions
    
    func cancelButtonTapped()
    {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonTapped()
    {
        if (viewModel.addMeal(MealName: nameTextField.text,
                              fatsTextField.text, proteinsTextField.text, carboTextField.text, recipeTextField.text))
        {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
//    MARK: Text view delegates method
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if (textView.contentSize.height < 100) {
            textView.isScrollEnabled = false
        }
        else {
            textView.isScrollEnabled = true
        }
        return true
    }
    

}
