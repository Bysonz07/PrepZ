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

    @IBOutlet weak var noteOutlet: UILabel!
    private var player: AVQueuePlayer!
    private var playerLayer: AVPlayerLayer!
    private var playerItem: AVPlayerItem!
    private var playerLooper: AVPlayerLooper!
    
    var currentPage = 0
    var lastString = ""

    
    // EDIT KONTEN STEP BY STEP DISINI ATAU DI StepByStepSlide
    var slides: [StepByStepSlide] = [
        StepByStepSlide(image: UIImage(named: "CHIOPPING_BOK_CHOY")!, stepCount: "Step 1/3", stepDetails: "Cut and take off the bottom. Then pull off the leaves.", step: "Take off Bottom"),
        StepByStepSlide(image: UIImage(named: "CHIOPPING_BOK_CHOY")!, stepCount: "Step 2/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Separate the leaves"),
        StepByStepSlide(image: UIImage(named: "CHIOPPING_BOK_CHOY")!, stepCount: "Step 3/3", stepDetails: "You have successfuly cut bok choy while following the food safety standard. When you want to saute or cook it, put the stem around 2-3 minutes befor the leaves to tender it.\nNow that you’re done, be sure to wash up thoroughly and use disinfecting soap!", step: "You are done!")
    ]
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        print(lastString)
        doneButton.isHidden = true
        doneButton.layer.cornerRadius = 12
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
        for data in indexPath {
            let path = Bundle.main.path(forResource: "bokChoy_Step2", ofType: "mp4")
                let pathURL = URL(fileURLWithPath: path!)
                let duration = Int64( ( (Float64(CMTimeGetSeconds(AVAsset(url: pathURL).duration)) *  10.0) - 1) / 10.0 )

            player = AVQueuePlayer()
            playerLayer = AVPlayerLayer(player: player)
            playerItem = AVPlayerItem(url: pathURL)
            playerLooper = AVPlayerLooper(player: player, templateItem: playerItem,
                                          timeRange: CMTimeRange(start: CMTime.zero, end: CMTimeMake(value: duration, timescale: 1)) )
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer.frame = CGRect(x: 0, y: 10, width: 391, height: 260)
    //        view.layer.insertSublayer(playerLayer, at: 1)
            player.volume = 0
            player.play()
        }
        
        cell.layer.insertSublayer(playerLayer, at: 1)
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
