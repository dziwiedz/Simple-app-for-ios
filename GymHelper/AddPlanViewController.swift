//
//  AddPlanViewController.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 26/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

protocol AddPlanViewControllerDelegates : UIPickerViewDelegate, UITextFieldDelegate
{
}

class AddPlanViewController: UIViewController, AddPlanViewControllerDelegates {

    let planNameLabel = UILabel()
    let planNameTextField = UITextField()
    
    let planPressureLabel = UILabel()
    let planPressurePicker = UIPickerView()
    
    let viewModel = AddPlanViewModel()
    
    var pickedPlanType : String?
    
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
        self.title = "Add Plan"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.edgesForExtendedLayout = []
        self.hideKeyboardWhenTappedAround()
    }
    private func setupSubviews()
    {

        setupPicker(picker: planPressurePicker)
        
        setupLabel(planNameLabel, Text: "Nazwa Planu", Alignment: .center)
        setupLabel(planPressureLabel, Text: "Typ Planu", Alignment: .center)
        
        setupTextField(textField: planNameTextField, placeHolderText: "Plan name")
        
    }
    private func setLayout()
    {
        let margin = view.layoutMarginsGuide
        let padding = CGFloat(10)
        planNameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        planNameLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        planNameLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        planNameTextField.topAnchor.constraint(equalTo: planNameLabel.bottomAnchor).isActive = true
        planNameTextField.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        planNameTextField.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        planPressureLabel.topAnchor.constraint(lessThanOrEqualTo: planNameTextField.bottomAnchor, constant: padding).isActive = true
        planPressureLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        planPressureLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        planPressurePicker.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        planPressurePicker.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        planPressurePicker.topAnchor.constraint(equalTo: planPressureLabel.bottomAnchor).isActive = true
    }
    
    private func setupLabel(_ label : UILabel, Text text : String, Alignment alignment : NSTextAlignment, Font font : UIFont? = nil)
    {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = alignment
        label.numberOfLines = 0
        if (font != nil) {
            label.font = font
        }
        self.view.addSubview(label)
    }
    
    private func setupTextField(textField : UITextField, placeHolderText : String)
    {
        textField.borderStyle = .bezel
        textField.placeholder = placeHolderText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        view.addSubview(textField)
    }
    
    private func setupPicker(picker: UIPickerView)
    {
        picker.dataSource = viewModel
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(picker)
    }

    
    func cancelButtonTapped()
    {
        print("Cancel tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveButtonTapped()
    {
        guard let text = planNameTextField.text
            else {
                return
        }
        
        if text.characters.count > 0 {
            viewModel.addPlan(name: text, selectedRow: planPressurePicker.selectedRow(inComponent: 0))
            self.dismiss(animated: true, completion: nil)
        }
        else {
            planNameTextField.placeholder = "You must type a plan name!"
            let alertBorderColor = UIColor.red
            planNameTextField.layer.borderColor = alertBorderColor.cgColor
        }
        
        print("SaveButtonTapped")
    }
}

    // MARK: EXTENSIONS 

extension AddPlanViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected Row at picket data: \(row)")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.pickerData[row]
    }
}

extension AddPlanViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
