//
//  VoiceViewController.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 21/06/21.
//

import UIKit

class VoiceViewController: UIViewController {

    @IBOutlet weak var voiceSwitchOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        isRecording = false
        voiceSwitchOutlet.layer.cornerRadius = 18
        // Do any additional setup after loading the view.
    }
    
//    override public func viewDidAppear(_ animated: Bool) {
//        checkPermissions()
//    }

    @IBAction func voiceSwitch(_ sender: Any) {
//        isRecording = false
//        //trigger speech recog
//        if isRecording { stopRecording() } else { startRecording() }
//        navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
//
        let ac = UIAlertController(title: "PrepZ", message: "Voice command turned on", preferredStyle: .alert)
        
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            self.navigationController!.popToRootViewController(animated: true)
            
        }
        ac.addAction(submitButton)
        present(ac, animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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
