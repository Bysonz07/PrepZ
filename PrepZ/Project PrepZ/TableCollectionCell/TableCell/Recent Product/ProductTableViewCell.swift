//
//  ProductTableViewCell.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 20/06/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rcCollectionView: UICollectionView!
    var models = [Model]()
    
    static let identifier = "ProductTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductTableViewCell", bundle: nil)
    }
    
    func configure(with models: [Model]){
        self.models = models
        rcCollectionView.reloadData()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
        rcCollectionView.register(RecentlyCollectionViewCell.nib(), forCellWithReuseIdentifier: RecentlyCollectionViewCell.identifier)
        rcCollectionView.dataSource = self
        rcCollectionView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyCollectionViewCell.identifier, for: indexPath) as! RecentlyCollectionViewCell
        
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 228, height: 170)
    }
    
}
