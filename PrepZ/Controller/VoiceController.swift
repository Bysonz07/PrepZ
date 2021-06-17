//
//  VoiceController.swift
//  PrepZ
//
//  Created by Riestiya Zain on 15/06/21.
//

import UIKit
import Speech



class VoiceControl: UIViewController, SFSpeechRecognizerDelegate {
    
//    @IBOutlet weak var recordButton: UIButton!
//    @IBOutlet weak var spokenLabel: UILabel!
    
    var isRecording = false

    var audioEngine: AVAudioEngine!
    var inputNode: AVAudioInputNode!
    var audioSession: AVAudioSession!

    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        checkPermissions()
    }
    
    // MARK: - User interface
//    @IBAction func recordButtonTapped(_ sender: UIButton) {
//        if isRecording { stopRecording() } else { startRecording() }
//        isRecording.toggle()
//        sender.setTitle((isRecording ? "Stop" : "Start") + " recording", for: .normal)
//    }
//
    func handleError(withMessage message: String) {
        // Present an alert.
        let ac = UIAlertController(title: "An error occured", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)

//        // Disable record button.
//        recordButton.setTitle("Not available.", for: .normal)
//        recordButton.isEnabled = false
    }
    
    // MARK: - Speech recognition
    func startRecording() {
        // MARK: 1. Create a recognizer.
        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            handleError(withMessage: "Speech recognizer not available.")
            return
        }

        // MARK: 2. Create a speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest!.shouldReportPartialResults = true

        recognizer.recognitionTask(with: recognitionRequest!) { (result, error) in
            guard error == nil else { self.handleError(withMessage: error!.localizedDescription); return }
            guard let result = result else { return }

            print("got a new result: \(result.bestTranscription.formattedString), final : \(result.isFinal)")
            
            let bestString = result.bestTranscription.formattedString
            //self.wordsArray.append(bestString)
            var lastString: String = ""
            // handle lastSring yang sama muncul lebih dari satu kali secara bersamaan
//            if (self.wordsArray.suffix(1) != self.wordsArray.suffix(0)){
//
//            }

            for segment in result.bestTranscription.segments{
                let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                print("segment: ", indexTo)
                lastString = String(bestString[indexTo...])
                lastString = lastString.lowercased()
            }
            
            
//            print("last string: ", lastString)
//
//            if (lastString == "next"){
//                self.spokenLabel.text = "next"
//
//            }
//            if (lastString == "back"){
//                self.spokenLabel.text = "previous"
//            }
//            if (lastString == "speak"){
//                self.spokenLabel.text = "speak"
//                let speakUtterance = AVSpeechUtterance(string: "This will read the current step")
//                self.synth.speak(speakUtterance)
//            }
            
            if result.isFinal {
                DispatchQueue.main.async {
                    self.updateUI(withResult: result)
                }
            }
        }

        // MARK: 3. Create a recording and classification pipeline.
        audioEngine = AVAudioEngine()

        inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }

        // Build the graph.
        audioEngine.prepare()

        // MARK: 4. Start recognizing speech.
        do {
            // Activate the session.
            audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .spokenAudio, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)

            // Start the processing pipeline.
            try audioEngine.start()
        } catch {
            handleError(withMessage: error.localizedDescription)
        }
    }

    func updateUI(withResult result: SFSpeechRecognitionResult) {
        // Update the UI: Present an alert.
        let ac = UIAlertController(title: "You said:",
                                   message: result.bestTranscription.formattedString,
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }

    func stopRecording() {
        // End the recognition request.
        recognitionRequest?.endAudio()
        recognitionRequest = nil

        // Stop recording.
        audioEngine.stop()
        inputNode.removeTap(onBus: 0) // Call after audio engine is stopped as it modifies the graph.
        // Stop our session.
        try? audioSession.setActive(false)
        audioSession = nil
    }

    // MARK: - Privacy
    func checkPermissions() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized: break
                default: self.handlePermissionFailed()
                }
            }
        }
    }

    func handlePermissionFailed() {
        // Present an alert asking the user to change their settings.
        let ac = UIAlertController(title: "This app must have access to speech recognition to work.",
                                   message: "Please consider updating your settings.",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Open settings", style: .default) { _ in
            let url = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(url)
        })
        ac.addAction(UIAlertAction(title: "Close", style: .cancel))
        present(ac, animated: true)

        // Disable the record button.
//        recordButton.isEnabled = false
//        recordButton.setTitle("Speech recognition not available.", for: .normal)
    }
    
//    public func setIsRecording(setter: Bool){
//        self.isRecording = setter
//    }
}
