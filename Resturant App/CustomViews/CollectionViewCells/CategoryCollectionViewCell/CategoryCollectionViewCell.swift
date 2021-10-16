//
//  CategoryCollectionViewCell.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryTitleLabel: UILabel!
    
    func setup(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        
        
//        print("DEBUUG: \()")
    }
    

}
