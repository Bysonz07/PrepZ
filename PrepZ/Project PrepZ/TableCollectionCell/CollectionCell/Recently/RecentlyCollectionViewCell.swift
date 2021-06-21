//
//  RecentlyCollectionViewCell.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 20/06/21.
//

import UIKit

class RecentlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var rcImageView: UIImageView!
    static let identifier = "RecentlyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RecentlyCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: Model){
        self.rcImageView.image = UIImage(named: model.imageName)
    }
    
}
