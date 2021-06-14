//
//  StepByStepViewController.swift
//  PrepZ
//
//  Created by Difa N Pratama on 04/06/21.
//

import UIKit

class StepByStepViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var currentPage = 0
    var slides: [StepByStepSlide] = [
        StepByStepSlide(image: UIImage(named: "meat")!, stepCount: "Step 1/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Soak Chicken"),
        StepByStepSlide(image: UIImage(named: "meat")!, stepCount: "Step 2/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Remove Legs and Thighs"),
        StepByStepSlide(image: UIImage(named: "meat")!, stepCount: "Step 3/6", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Separate the Back from the Breast")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func micButtonTapped(_ sender: Any) {
        let width = collectionView.frame.size.width
        currentPage = Int(collectionView.contentOffset.x / width)
        if (currentPage != slides.count - 1){
            currentPage += 1
            collectionView.setContentOffset(CGPoint(x: Int(collectionView.frame.size.width) * currentPage, y: 0), animated: true)
            pageControl.currentPage = currentPage
        }
    }
    
}

extension StepByStepViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StepByStepCollectionViewCell.identifier, for: indexPath) as! StepByStepCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
