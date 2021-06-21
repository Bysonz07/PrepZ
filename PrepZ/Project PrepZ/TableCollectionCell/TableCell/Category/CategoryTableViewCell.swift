//
//  CategoryTableViewCell.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 20/06/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var ctImageView: UIImageView!
    
    static let identifier = "CategoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
