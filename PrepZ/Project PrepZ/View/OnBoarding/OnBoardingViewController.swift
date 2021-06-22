//
//  OnBoardingViewController.swift
//  PrepZ
//
//  Created by Ellrica Jana on 16/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    
    var slides: [OnBoardingSlide] = []
    
    var currentPage = 0 {
        
        didSet{
            pageController.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        slides = [
            OnBoardingSlide(title: "Prepare your food in safe manner", description: "Choose the ingredients you want to prepare and follow the standarized steps", image: #imageLiteral(resourceName: "Cooking-cuate") ),
            OnBoardingSlide(title: "Get assistant to help you prepare", description: "Put your phone down and navigate each steps through voice command", image: #imageLiteral(resourceName: "Voice assistant-bro") ),
            OnBoardingSlide(title: "Have knowledge of food safety", description: "Increase your awareness of food safety by knowing things to concern when preparing particular ingredients", image: #imageLiteral(resourceName: "Eating healthy food-amico") )]
        
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
//            let controller = storyboard?.instantiateViewController(identifier: "Home") as! UINavigationController
//            controller.modalPresentationStyle = .fullScreen
//            controller.modalTransitionStyle = .flipHorizontal
//            present(controller, animated: true, completion: nil)
            performSegue(withIdentifier: "Home", sender: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
   

}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
    

