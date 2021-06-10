//
//  RecentlyCollectionViewCell.swift
//  PrepZ
//
//  Created by Difa N Pratama on 10/06/21.
//

import UIKit

class RecentlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    var onMoreButtonClick: (()-> ())?
    static let identifier = "RecentlyViewedCell"
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    public func configure(named: String, with image : UIImage){ //dequeing
        imageOutlet.image = image
        labelOutlet.text = named
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RecentlyCollectionViewCell", bundle: nil)
    }

}
