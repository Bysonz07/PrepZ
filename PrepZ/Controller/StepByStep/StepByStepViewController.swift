//
//  StepByStepViewController.swift
//  PrepZ
//
//  Created by Riestiya Zain on 04/06/21.
//

import UIKit
import Speech

class StepByStepViewController: UIViewController{

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var currentPage = 0
    
//    public private(set) var isRecording = false
//    private var audioEngine: AVAudioEngine!
//    private var inputNode: AVAudioInputNode!
//    private var audioSession: AVAudioSession!
//    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    // EDIT KONTEN STEP BY STEP DISINI ATAU DI StepByStepSlide
    var slides: [StepByStepSlide] = [
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 1/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Soak Chicken"),
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 2/3", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Remove Legs and Thighs"),
        StepByStepSlide(image: UIImage(named: "brining chicken")!, stepCount: "Step 3/6", stepDetails: "Rinse the chicken in the bowl of warm water. Leave it for 15-20 minutes. After that, wash it with running water.", step: "Separate the Back from the Breast")
    ]
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
//    override public func viewDidAppear(_ animated: Bool) {
//        checkPermissions()
//    }
    // MARK: -
    
    @IBAction func micButtonTapped(_ sender: Any) {
        // programmative next
        let width = collectionView.frame.size.width
        currentPage = Int(collectionView.contentOffset.x / width)
        if (currentPage != slides.count - 1){
            currentPage += 1
            collectionView.setContentOffset(CGPoint(x: Int(collectionView.frame.size.width) * currentPage, y: 0), animated: true)
            pageControl.currentPage = currentPage
        }
        
        //Trigger Speech recognition
//        if isRecording { stopRecording() } else { startRecording() }
//        isRecording.toggle()
//        micButton.setTitle((isRecording ? "Stop" : "Start") + " recording", for: .normal)
//    }
    
//    private func handleError(withMessage message: String) {
//        // Present an alert.
//        let ac = UIAlertController(title: "An error occured", message: message, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
//
//        // Disable record button.
//        micButton.setTitle("Not available.", for: .normal)
//        micButton.isEnabled = false
//    }

// MARK: - Speech recognition
    
//    private func startRecording() {
//        // MARK: 1. Create a recognizer.
//        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
//            handleError(withMessage: "Speech recognizer not available.")
//            return
//        }
//
//        // MARK: 2. Create a speech recognition request.
//        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
//        recognitionRequest!.shouldReportPartialResults = true
//
//        recognizer.recognitionTask(with: recognitionRequest!) { (result, error) in
//            guard error == nil else { self.handleError(withMessage: error!.localizedDescription); return }
//            guard let result = result else { return }
//
//            print("got a new result: \(result.bestTranscription.formattedString), final : \(result.isFinal)")
//
//            let bestString = result.bestTranscription.formattedString
//            //self.wordsArray.append(bestString)
//            var lastString: String = ""
//            // handle lastSring yang sama muncul lebih dari satu kali secara bersamaan
////            if (self.wordsArray.suffix(1) != self.wordsArray.suffix(0)){
////
////            }
//
//            for segment in result.bestTranscription.segments{
//                let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
//                print("segment: ", indexTo)
//                lastString = String(bestString[indexTo...])
//                lastString = lastString.lowercased()
//            }
//
//
//            print("last string: ", lastString)
//
//            if (lastString == "next"){
//                //self.spokenWord.text = "next"
//
//            }
//            if (lastString == "back"){
//                //self.spokenWord.text = "previous"
//            }
//            if (lastString == "speak"){
//                //self.spokenWord.text = "speak"
////                let speakUtterance = AVSpeechUtterance(string: "This will read the current step")
////                self.synth.speak(speakUtterance)
//            }
//
//            if result.isFinal {
//                DispatchQueue.main.async {
//                    self.updateUI(withResult: result)
//                }
//            }
//        }
//
//        // MARK: 3. Create a recording and classification pipeline.
//        audioEngine = AVAudioEngine()
//
//        inputNode = audioEngine.inputNode
//        let recordingFormat = inputNode.outputFormat(forBus: 0)
//        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
//            self.recognitionRequest?.append(buffer)
//        }
//
//        // Build the graph.
//        audioEngine.prepare()
//
//        // MARK: 4. Start recognizing speech.
//        do {
//            // Activate the session.
//            audioSession = AVAudioSession.sharedInstance()
//            try audioSession.setCategory(.record, mode: .spokenAudio, options: .duckOthers)
//            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//
//            // Start the processing pipeline.
//            try audioEngine.start()
//        } catch {
//            handleError(withMessage: error.localizedDescription)
//        }
//    }
//
//    private func updateUI(withResult result: SFSpeechRecognitionResult) {
//        // Update the UI: Present an alert.
//        let ac = UIAlertController(title: "You said:",
//                                   message: result.bestTranscription.formattedString,
//                                   preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(ac, animated: true)
//    }
//
//    private func stopRecording() {
//        // End the recognition request.
//        recognitionRequest?.endAudio()
//        recognitionRequest = nil
//
//        // Stop recording.
//        audioEngine.stop()
//        inputNode.removeTap(onBus: 0) // Call after audio engine is stopped as it modifies the graph.
//        // Stop our session.
//        try? audioSession.setActive(false)
//        audioSession = nil
//    }
//
//// MARK: - Privacy
//    private func checkPermissions() {
//        SFSpeechRecognizer.requestAuthorization { authStatus in
//            DispatchQueue.main.async {
//                switch authStatus {
//                case .authorized: break
//                default: self.handlePermissionFailed()
//                }
//            }
//        }
//    }
//
//    private func handlePermissionFailed() {
//        // Present an alert asking the user to change their settings.
//        let ac = UIAlertController(title: "This app must have access to speech recognition to work.",
//                                   message: "Please consider updating your settings.",
//                                   preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "Open settings", style: .default) { _ in
//            let url = URL(string: UIApplication.openSettingsURLString)!
//            UIApplication.shared.open(url)
//        })
//        ac.addAction(UIAlertAction(title: "Close", style: .cancel))
//        present(ac, animated: true)
//
//        // Disable the record button.
//        micButton.isEnabled = false
//        micButton.setTitle("Speech recognition not available.", for: .normal)
    }
//
}
    
// MARK: - Extension for display collection view

extension StepByStepViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StepByStepCollectionViewCell.identifier, for: indexPath) as! StepByStepCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
