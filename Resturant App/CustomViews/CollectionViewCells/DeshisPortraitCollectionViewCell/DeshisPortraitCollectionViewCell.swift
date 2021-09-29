//
//  DeshisPortraitCollectionViewCell.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/20/21.
//

import UIKit

class DeshisPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DeshisPortraitCollectionViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var deshImageView: UIImageView!
    @IBOutlet var coloriesLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func setup(dish: Dish){
        titleLabel.text = dish.name
        deshImageView.kf.setImage(with: dish.image?.asUrl)
        coloriesLabel.text = dish.formattedColories
        descriptionLabel.text = dish.description
    }
    
 
}
