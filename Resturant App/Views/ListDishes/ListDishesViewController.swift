//
//  ListDishesViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/29/21.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var category: DishCategory?
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category?.id ?? "") { (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self.dishes = dishes
                self.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        let dishees = dishes[indexPath.row]
        cell.setup(dish: dishees)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailViewController.instantiate()
        vc.dish = dishes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
