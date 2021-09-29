//
//  OnBoardingCollectionViewCell.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet var slideImageView: UIImageView!
    @IBOutlet var slideTitleLabel: UILabel!
    @IBOutlet var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnBoardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
    
}
