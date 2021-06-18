//
//  StepPreviewViewController.swift
//  PrepZ
//
//  Created by Riestiya Zain on 16/06/21.
//

import UIKit

class StepPreviewViewController: VoiceControl {

    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var voiceNavigateButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var toolsLabel: UILabel!
    @IBOutlet weak var howToTitleLabel: UILabel!
    
    // variabel untuk nampung data dari sender
    var imageName: String = ""
    var titleHowTo: String = ""
    var timeNeed: String = ""
    var tools: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // uncomment ini kalau data udah di set dari sender VC
        imageName = "brining chicken"
        titleHowTo = "Brining Chicken"
        timeNeed = "1 Day"
        // string separated with \n
        tools = "- A large Stock Pot\n- A whole chicken\n"
        
        // update ui dari data sender
        previewImage.image = UIImage(named: imageName)
        howToTitleLabel.text = titleHowTo
        timeLabel.text = timeNeed
        toolsLabel.text = tools
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
