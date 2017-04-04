//
//  TrainingPlanCell.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 19/03/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class TrainingPlanCell: UITableViewCell, Reusable {
    
    let nameLabel = UILabel()
    let durationInfoLabel = UILabel()
    let pressureInfoLabel = UILabel()
    let durationLabel = UILabel()
    let pressureLabel = UILabel()
    let favouriteButton = UIButton()
    
    var trainingPlan : TrainingPlan? {
        didSet {
            if let t = trainingPlan {
                nameLabel.text = t.name
                durationLabel.text = t.getExercisesNumber()
                pressureLabel.text = t.type
                setButtonImage()
            }
        }
    }
    var tapAction: ((UITableViewCell) -> Void)?
    
    var pressed : Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.accessoryType = .disclosureIndicator
        
        setupSubviews()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupSubviews()
    {
        let nameFont = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
        setupLabel(nameLabel, Text: "", Alignment: .center, Font: nameFont )
        setupLabel(pressureInfoLabel, Text: "Typ:", Alignment: .left)
        setupLabel(pressureLabel, Text: "<typ>", Alignment: .left)
        setupLabel(durationInfoLabel, Text: "Ilosc Dni Treningowych", Alignment: .left)
        setupLabel(durationLabel, Text: "Miliard", Alignment: .left)
        setupFavoriteButton(favouriteButton)
        // setup button

    }
    
    private func setLayout()
    {
        // constants
        let margin = contentView.layoutMarginsGuide
        let padding = CGFloat(5)

        // nameLabelConstraint
        nameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: favouriteButton.trailingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true

        // button constraint
        favouriteButton.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        favouriteButton.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: CGFloat(20)).isActive = true
        
        // durationInfoLabel constraints
        durationInfoLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor).isActive = true
        durationInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding).isActive = true
        durationInfoLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        durationInfoLabel.firstBaselineAnchor.constraint(equalTo: durationLabel.firstBaselineAnchor).isActive = true
        
        // durationLabel constraints
        durationLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        durationLabel.leadingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor, constant: padding).isActive = true
        durationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding).isActive = true
        
        // presssureInfoLabel constraints
        pressureInfoLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        pressureInfoLabel.topAnchor.constraint(equalTo: durationInfoLabel.bottomAnchor, constant: padding).isActive = true
        pressureInfoLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        pressureInfoLabel.firstBaselineAnchor.constraint(equalTo: pressureLabel.firstBaselineAnchor).isActive = true
        
        // PresureLabel constraints
        pressureLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        pressureLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: padding).isActive = true
        pressureLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        pressureLabel.leadingAnchor.constraint(lessThanOrEqualTo: margin.centerXAnchor, constant: padding).isActive = true
        
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
        contentView.addSubview(label)
    }
    
    private func setupFavoriteButton(_ button : UIButton)
    {
        let image = UIImage(named: "starInactive")
        button.setImage(image, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(cellButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
    }
    
    func cellButtonTapped()
    {
        tapAction?(self)
        setButtonImage()
    }
    
    private func setButtonImage()
    {
        if (trainingPlan?.favorite)! {
            let image = UIImage(named: "starActive")
            favouriteButton.setImage(image, for: .normal)
            print ("Zmieniono obrazek na Active| \(trainingPlan?.favorite)")
        }
        else {
            let image = UIImage(named: "starInactive")
            favouriteButton.setImage(image, for: .normal)
            print ("Zmieniono obrazek na Inactive| \(trainingPlan?.favorite)")
        }
    }
    

}
