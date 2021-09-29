//
//  DishDetailViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/27/21.
//

import UIKit

class DishDetailViewController: UIViewController {
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameField: UITextField!

    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with:dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedColories
    }
    
    @IBAction func orderNow(_ sender: UIButton) {
        
    }
    

}
