//
//  StepByStepViewController.swift
//  PrepZ
//
//  Created by Riestiya Zain on 04/06/21.
//

import UIKit
import Speech

class StepByStepViewController: UIViewController{

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentPage = 0
    var lastString = ""

    
    // EDIT KONTEN STEP BY STEP DISINI ATAU DI StepByStepSlide
    var slides: [StepByStepSlide] = [
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 1/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Soak Chicken"),
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 2/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Remove Legs and Thighs"),
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 3/6", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Separate the Back from the Breast")
    ]
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        print(lastString)
        doneButton.isHidden = true
        navigationController?.title = "Brining Chicken"

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width)
        if currentPage == 0{
            prevButton.isEnabled = false
        }
        else if (currentPage == slides.count - 1) {
            nextButton.isEnabled = false
            doneButton.isHidden = false
        }
        else{
            doneButton.isHidden = true
            prevButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }

    // MARK: -
    
    @IBAction func prevTapped(_ sender: Any) {
        let width = collectionView.frame.size.width
        currentPage = Int(collectionView.contentOffset.x / width)
        if (currentPage != 0){
            currentPage -= 1
            collectionView.setContentOffset(CGPoint(x: Int(collectionView.frame.size.width) * currentPage, y: 0), animated: true)
            pageControl.currentPage = currentPage
        }
    }
    @IBAction func doneTapped(_ sender: Any) {
        // turn off speech recog
        // segue ke mana ya
        //navigationController?.performSegue(withIdentifier: "PreviewStoryboard", sender: sender)
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        // programmative next
        let width = collectionView.frame.size.width
        currentPage = Int(collectionView.contentOffset.x / width)
        if (currentPage != slides.count - 1){
            currentPage += 1
            collectionView.setContentOffset(CGPoint(x: Int(collectionView.frame.size.width) * currentPage, y: 0), animated: true)
            pageControl.currentPage = currentPage
        }
    }
}

    
// MARK: - Extension for display collection view

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
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}