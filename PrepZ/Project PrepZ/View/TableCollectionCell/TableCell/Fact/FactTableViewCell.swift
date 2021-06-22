//
//  FactTableViewCell.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 20/06/21.
//

import UIKit

class FactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var mySubTitle: UILabel!
    @IBOutlet weak var myTimer: UIButton!
    
    static let identifier = "FactTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FactTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myTitle.lineBreakMode = .byWordWrapping
        self.myTitle.numberOfLines = 0
        self.mySubTitle.lineBreakMode = .byWordWrapping
        self.mySubTitle.numberOfLines = 0
        // Initialization code
    }
    
    public func configure(with image: String, title: String, subTitle: String,timer: String ){
        self.myImageView.image = UIImage(named: image)
        
        self.myTitle.text = title
        self.mySubTitle.text = subTitle
        self.myTimer.setTitle(timer, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
