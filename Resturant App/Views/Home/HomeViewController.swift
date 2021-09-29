//
//  HomeViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var specialsCollectionView: UICollectionView!
    
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dishes", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dishes 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dishes 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dishes 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dishes 5", image: "https://picsum.photos/100/200")]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 134),
        .init(id: "id2", name: "Indomie", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 324),
        .init(id: "id3", name: "Pizza", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 214),
            .init(id: "id1", name: "Garri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 334)]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Frank Tom", description: "This is my Favourite Dish", image: "https://picsum.photos/100/200", colories: 134),
        .init(id: "id2", name: "Beans and Gerri", description: "This is the best I have tested", image: "https://picsum.photos/100/200", colories: 324)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registryCell()
    }
    
    private func registryCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DeshisPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DeshisPortraitCollectionViewCell.identifier)
        
            specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let category = categories[indexPath.row]
            cell.setup(category: category)
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeshisPortraitCollectionViewCell.identifier, for: indexPath) as! DeshisPortraitCollectionViewCell
            let popular = populars[indexPath.row]
            cell.setup(dish: popular )
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            let special = specials[indexPath.row]
            cell.setup(dish: special)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let vc = ListDishesViewController.instantiate()
            vc.category = categories[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = DishDetailViewController.instantiate()
            vc.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
