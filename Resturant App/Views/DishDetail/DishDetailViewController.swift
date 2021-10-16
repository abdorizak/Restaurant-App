//
//  DishDetailViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/27/21.
//

import UIKit
import ProgressHUD

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
        caloriesLabel.text = dish.formattedCalories
    }
    
    @IBAction func orderNow(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your Order has been received")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    

}
