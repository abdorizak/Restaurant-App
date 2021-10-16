//
//  ListOrdersViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/29/21.
//

import UIKit

class ListOrdersViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    var orders:[Order] = [
        .init(id: "id", name: "Cabdi", dish: .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", calories: 134)),
        .init(id: "id", name: "Axmed", dish: .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", calories: 134)),
        .init(id: "id", name: "Mohamed", dish: .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", calories: 134)),
        .init(id: "id", name: "Khalid", dish: .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", calories: 134))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }


}

extension ListOrdersViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        let orderss = orders[indexPath.row]
        cell.setup(order: orderss)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailViewController.instantiate()
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
}
