//
//  DishListTableViewCell.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/27/21.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = "DishListTableViewCell"
    
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func setup(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    
}
