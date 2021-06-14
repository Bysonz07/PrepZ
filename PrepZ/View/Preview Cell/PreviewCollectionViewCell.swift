//
//  PreviewCollectionViewCell.swift
//  PrepZ
//
//  Created by Shiddiq Syuhada on 11/06/21.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var previewImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    var onMoreButtonClick: (() -> ())?
    static let identifier = "PreviewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    public func configure(named: String, with image : UIImage){
        previewImage.image = image
        titleLabel.text = named
        descriptionLabel.text = named
    }
    
    static func nib() -> UINib {
    return UINib(nibName:"PreviewCollectionViewCell", bundle: nil)
    }

}
