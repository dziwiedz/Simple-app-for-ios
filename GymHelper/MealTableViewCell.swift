//
//  MealTableViewCell.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 01/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell, Reusable {

    let nameLabel = UILabel()
    let fatsLabel = UILabel()
    let proteinsLabel = UILabel()
    let carboLabel = UILabel()
    
    let fatsValueLabel = UILabel()
    let proteinsValueLabel = UILabel()
    let carboValueLabel = UILabel()
    
    var meal : Meal? {
        didSet {
            if let m = meal {
                fatsValueLabel.text = String(m.fats)
                proteinsValueLabel.text = String(m.proteins)
                carboValueLabel.text = String(m.carbo)
                nameLabel.text = m.name
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupSubviews()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCell()
    {
        accessoryType = .detailButton
    }
    
    private func setupSubviews()
    {
        
        setupLabel(nameLabel, Alignment: .left)
        setupLabel(proteinsLabel, Text: "Proteiny", Alignment: .left, Font: nil)
        setupLabel(fatsLabel, Text: "Tluszcze", Alignment: .left, Font: nil)
        setupLabel(carboLabel, Text: "Weglowodany", Alignment: .left, Font: nil)
        setupLabel(proteinsValueLabel, Alignment: .left, Font: nil)
        setupLabel(fatsValueLabel, Alignment: .left, Font: nil)
        setupLabel(carboValueLabel, Alignment: .left, Font: nil)
    }
    
    private func setLayout()
    {
        let margin = contentView.layoutMarginsGuide
        let offset = CGFloat(20)
        let desribingLabelMultiplier = CGFloat(0.4)
        // Name label constraints
        nameLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // Proteins label constraints
        proteinsLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        proteinsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        proteinsLabel.widthAnchor.constraint(equalTo: margin.widthAnchor, multiplier: desribingLabelMultiplier).isActive = true

        // fats label constraints
        fatsLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        fatsLabel.topAnchor.constraint(equalTo: proteinsLabel.bottomAnchor).isActive = true
        fatsLabel.widthAnchor.constraint(equalTo: margin.widthAnchor, multiplier: desribingLabelMultiplier).isActive = true

        // carbo label constraints
        carboLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        carboLabel.topAnchor.constraint(equalTo: fatsLabel.bottomAnchor).isActive = true
        carboLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        carboLabel.widthAnchor.constraint(equalTo: margin.widthAnchor, multiplier: desribingLabelMultiplier).isActive = true

        // proteins value label constraints
        proteinsValueLabel.firstBaselineAnchor.constraint(equalTo: proteinsLabel.firstBaselineAnchor).isActive = true
        proteinsValueLabel.leadingAnchor.constraint(equalTo: proteinsLabel.trailingAnchor, constant: offset).isActive = true
        proteinsValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // carbo value label constraints
        fatsValueLabel.firstBaselineAnchor.constraint(equalTo: fatsLabel.firstBaselineAnchor).isActive = true
        fatsValueLabel.leadingAnchor.constraint(equalTo: fatsLabel.trailingAnchor, constant: offset).isActive = true
        fatsValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // fats value label constraints
        carboValueLabel.firstBaselineAnchor.constraint(equalTo: carboLabel.firstBaselineAnchor).isActive = true
        carboValueLabel.leadingAnchor.constraint(equalTo: carboLabel.trailingAnchor, constant: offset).isActive = true
        carboValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
    }
    
    private func setupLabel(_ label : UILabel, Text text : String? = nil, Alignment alignment : NSTextAlignment, Font font : UIFont? = nil)
    {
        label.translatesAutoresizingMaskIntoConstraints = false
        if text != nil {
            label.text = text
        }
        label.textAlignment = alignment
        label.numberOfLines = 0
        if (font != nil) {
            label.font = font
        }
        contentView.addSubview(label)
    }

}
