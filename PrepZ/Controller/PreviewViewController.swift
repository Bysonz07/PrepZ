//
//  PreviewViewController.swift
//  PrepZ
//
//  Created by Difa N Pratama on 04/06/21.
//

import UIKit

class PreviewViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var howToOutlet: UICollectionView!
    
    let previewCollectionCellId = "PreviewCollectionViewCell"
    let sectionHeaderViewid = "SectionHeaderView"
    var meats = [Meats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup collectionView
//        howToOutlet.dataSource = self
//        howToOutlet.delegate = self
//        howToOutlet.register(CategoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: previewCollectionCellId, bundle: nil)
        
        howToOutlet.register(nibCell, forCellWithReuseIdentifier: previewCollectionCellId)
        
        for _ in 1...4 {
            let meat = Meats()
            meat?.title = "Meat meat meat meat meat meat meat/n meat meat meat meat meat meat meat meat"
            meat?.desc = "How to prepare meat"
            meats.append(meat!)
        }
        
        howToOutlet.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meats.count
    }
    
    
    func collectionView(_ collectionview: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 123)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCollectionCellId, for: indexPath) as! PreviewCollectionViewCell
        let meat = meats[indexPath.row]
        cell.previewImage.image = UIImage(named: "meat")
        cell.titleLabel.text = meat.title
        cell.descriptionLabel.text = meat.desc
        
        return cell
    }
    
    // SectionHeader View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionHeaderViewid, for: indexPath) as! SectionHeaderView
        sectionHeaderView.headerImageView.image = UIImage(named: "meat")
        sectionHeaderView.foodSafetyLabel.text = "Lorem Impsum"
        sectionHeaderView.howToCategoryLabel.text = "Lorem Impsum"
        sectionHeaderView.nutritionLabel.text = "Lorem ipsum"
        sectionHeaderView.thingsToConcernLabel.text = "Lorem ipsum"
        
        return sectionHeaderView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "previewToStepByStep", sender: nil)
    }
}

