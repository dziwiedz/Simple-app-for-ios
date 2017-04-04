//
//  DietTableViewCell.swift
//  GymHelper
//
//  Created by Łukasz Niedźwiedź on 01/04/17.
//  Copyright © 2017 Łukasz Niedźwiedź. All rights reserved.
//

import UIKit

class DietTableViewCell: UITableViewCell, Reusable {

    let nameLabel = UILabel()
    let fatsLabel = UILabel()
    let proteinsLabel = UILabel()
    let carboLabel = UILabel()
    
    let totalFatsValueLabel = UILabel()
    let totalProteinsValueLabel = UILabel()
    let totalCarboValueLabel = UILabel()
    
    let favouriteButton = UIButton()
    
    var diet : Diet? {
        didSet {
            if let d = diet {
                nameLabel.text = d.name
                totalFatsValueLabel.text = String(d.totalFats)
                totalCarboValueLabel.text = String(d.totalCarbo)
                totalProteinsValueLabel.text = String(d.totalProteins)
                setButtonImage()
            }
        }
    }
    
    var tapAction: ((UITableViewCell) -> Void)?
    
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
    
    private func setupSubviews()
    {
        setupLabel(nameLabel, Alignment: .center)
        setupLabel(fatsLabel, Text: "Suma tluszczy", Alignment: .left)
        setupLabel(proteinsLabel, Text: "Suma protein", Alignment: .left)
        setupLabel(carboLabel, Text: "Suma weglowodanow", Alignment: .left)
        setupLabel(totalProteinsValueLabel, Alignment: .left)
        setupLabel(totalCarboValueLabel, Alignment: .left)
        setupLabel(totalFatsValueLabel, Alignment: .left)
        setupFavoriteButton(favouriteButton)
    }
    
    private func setLayout()
    {
        
        let margin = self.contentView.layoutMarginsGuide
        
        // favorite button constraints
        favouriteButton.topAnchor.constraint(equalTo: margin.topAnchor)
        favouriteButton.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        
        // Name Label constraints
        nameLabel.leadingAnchor.constraint(equalTo: favouriteButton.trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // fats label constraints
        fatsLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        fatsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        fatsLabel.trailingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        // carbo label constraints
        carboLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        carboLabel.topAnchor.constraint(equalTo: fatsLabel.bottomAnchor).isActive = true
        carboLabel.trailingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        // proteins label constraints
        proteinsLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        proteinsLabel.topAnchor.constraint(equalTo: carboLabel.bottomAnchor).isActive = true
        proteinsLabel.trailingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        proteinsLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        
        // total fats value label constraints
        totalFatsValueLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        totalFatsValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        totalFatsValueLabel.firstBaselineAnchor.constraint(equalTo: fatsLabel.firstBaselineAnchor).isActive = true
        
        
        // total carbo value label constraints
        totalCarboValueLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        totalCarboValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        totalCarboValueLabel.firstBaselineAnchor.constraint(equalTo: carboLabel.firstBaselineAnchor).isActive = true
        
        // total proteins value label constraints
        totalProteinsValueLabel.leadingAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        totalProteinsValueLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        totalProteinsValueLabel.firstBaselineAnchor.constraint(equalTo: proteinsLabel.firstBaselineAnchor).isActive = true
        
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
    
    private func setupFavoriteButton(_ button : UIButton)
    {
        let image = UIImage(named: "starInactive")
        button.setImage(image, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(cellButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellButtonTapped()
    {
        tapAction?(self)
        setButtonImage()
    }
    
    private func setButtonImage()
    {
        if (diet?.favorite)! {
            let image = UIImage(named: "starActive")
            favouriteButton.setImage(image, for: .normal)
        }
        else {
            let image = UIImage(named: "starInactive")
            favouriteButton.setImage(image, for: .normal)
        }
    }

}
