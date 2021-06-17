//
//  VoiceViewController.swift
//  PrepZ
//
//  Created by Riestiya Zain on 17/06/21.
//

import UIKit

class VoiceViewController: VoiceControl {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var prepziButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isRecording = false

        // Do any additional setup after loading the view.
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        checkPermissions()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func prepziTapped(_ sender: Any) {
        isRecording = true
        //trigger speech recog
//        if isRecording { stopRecording() } else { startRecording() }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
        // update button step by step preview jadi "voice turned on"
        
        // implement public setter untuk di vc selanjurnya
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
