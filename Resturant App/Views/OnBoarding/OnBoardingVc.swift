//
//  OnBoardingVc.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import UIKit

class OnBoardingVc: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var pageController: UIPageControl!
    
    var slides = [OnBoardingSlide]()
    
    var currentPage = 0 {
        didSet{
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnBoardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
        pageController.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = currentPage
        }
        
    }
}


extension OnBoardingVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
//        pageController.currentPage = currentPage
    }
    
}
