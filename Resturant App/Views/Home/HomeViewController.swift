//
//  HomeViewController.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var specialsCollectionView: UICollectionView!
    
    
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        registryCell()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self](result) in
            switch result {
            case .success(let alldishes):
                print("seccessfull")
                ProgressHUD.dismiss()
                self?.categories = alldishes.categories ?? []
                self?.populars = alldishes.populars ?? []
                self?.specials = alldishes.specials ?? []

                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
