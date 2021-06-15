//
//  PreviewHeaderCollectionView.swift
//  PrepZ
//
//  Created by Shiddiq Syuhada on 15/06/21.
//

import Foundation
import UIKit

class SectionHeaderView : UICollectionReusableView {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var foodSafetyLabel: UILabel!
    @IBOutlet weak var thingsToConcernLabel: UILabel!
    @IBOutlet weak var howToCategoryLabel: UILabel!
    
    var headerImage: UIImage!
    var nutritionDesc: String!
    var foodSafetyDesc: String!
    var thingsToConcernDesc: String!
    var howToCategory: String!
    
}
