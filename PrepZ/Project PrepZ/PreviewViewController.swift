//
//  PreviewViewController.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 21/06/21.
//

import UIKit

class PreviewViewController: UIViewController {

    
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var voiceSwitchOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "How To"
        startOutlet.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func voiceSwitch(_ sender: Any) {
       performSegue(withIdentifier: "previewToVoice", sender: nil)
    }

    @IBAction func startTapped(_ sender: Any) {
        performSegue(withIdentifier: "previewToStepByStep", sender: nil)
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
