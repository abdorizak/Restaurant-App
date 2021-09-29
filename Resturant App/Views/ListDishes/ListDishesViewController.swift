//
//  ListDishesViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/29/21.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var category: DishCategory?
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 134),
        .init(id: "id2", name: "Indomie", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 324),
        .init(id: "id3", name: "Pizza", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 214),
            .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 334)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCells()
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
