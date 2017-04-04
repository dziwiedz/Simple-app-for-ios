//
//  ExerciseTableViewCell.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 29/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell, Reusable {
    
    let nameLabel = UILabel()
    let repeatsLabel = UILabel()
    let seriesLabel = UILabel()
    
    let exerciseNameLabel = UILabel()
    let exerciseRepeatsLabel = UILabel()
    let exerciseSeriesLabel = UILabel()
    
    var exercise : Exercise? {
        didSet {
            if let ex = exercise {
                exerciseNameLabel.text = ex.name
                exerciseSeriesLabel.text = String(ex.seriesNumber)
                let repeats = ex.repeatsNumber
                exerciseRepeatsLabel.text = repeats == 0 ? "MAX" : String(repeats)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setLayout()
        
    }
    
    func setupSubviews()
    {
        setupLabel(nameLabel, Text: "Nazwa:", Alignment: .left)
        setupLabel(seriesLabel, Text: "Ilosc serii:", Alignment: .left)
        setupLabel(repeatsLabel, Text: "Ilosc powtorzen:", Alignment: .left)
        setupLabel(exerciseNameLabel, Alignment: .left)
        setupLabel(exerciseSeriesLabel, Alignment: .left)
        setupLabel(exerciseRepeatsLabel, Alignment: .left)
    }
    
    private func setLayout()
    {
        let margin = contentView.layoutMarginsGuide
//        let padding = CGFloat(8)
        
        // Name Label constraints
        nameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor).isActive = true
        
        // Series Label constraints
        seriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        seriesLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        seriesLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor).isActive = true
        
        // Repeats Label constraints
        repeatsLabel.topAnchor.constraint(equalTo: seriesLabel.bottomAnchor).isActive = true
        repeatsLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        repeatsLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor).isActive = true
        repeatsLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        
        // Exercise name label constraints
        exerciseNameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        exerciseNameLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        exerciseNameLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // Exercise series label constraints
        exerciseSeriesLabel.topAnchor.constraint(equalTo: exerciseNameLabel.bottomAnchor).isActive = true
        exerciseSeriesLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        exerciseSeriesLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // Exercise repeats label constraints
        exerciseRepeatsLabel.topAnchor.constraint(equalTo: exerciseSeriesLabel.bottomAnchor).isActive = true
        exerciseRepeatsLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        exerciseRepeatsLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        exerciseRepeatsLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
