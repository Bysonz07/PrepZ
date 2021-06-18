//
//  StepByStepCollectionViewCell.swift
//  PrepZ
//
//  Created by Riestiya Zain on 14/06/21.
//

import UIKit

class StepByStepCollectionViewCell: UICollectionViewCell {
    
    // define the identifier
    static let identifier = String(describing: StepByStepCollectionViewCell.self)
    
    @IBOutlet weak var slideStepDetailsLabel: UILabel!
    @IBOutlet weak var slideStepLabel: UILabel!
    @IBOutlet weak var slideStepCountLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    
    func setup(_ slide: StepByStepSlide){
        slideStepLabel.text = slide.step
        slideImageView.image = slide.image
        slideStepCountLabel.text = slide.stepCount
        slideStepDetailsLabel.text = slide.stepDetails
    }
    
}
