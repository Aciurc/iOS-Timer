//
//  ViewController.swift
//  Timer
//
//  Created by Anson Ciurcovich on 2016-01-29.
//  Copyright © 2016 Anson Ciurcovich. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0
    @IBOutlet var voiceEnableLabel: UILabel!
    @IBOutlet var countingLabel: UILabel!
    @IBOutlet var timeInputField: UITextField!
    @IBOutlet var voiceSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(sender: AnyObject) {
        let num = Int(timeInputField.text!)
        if num != nil && num > 0 && num < Int(INT_MAX) {
            counter = num!
            countingLabel.text = formatTime(counter) as String
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        } else {
            countingLabel.text = "Invalid Number"
        }
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        timer.invalidate()
        countingLabel.text = "00:00:00"
    }
    
    func updateCounter() {
        countingLabel.text = formatTime(--counter) as String
        if counter <= 0 {
            timer.invalidate()
        }
        if voiceSwitch.on {
            var utterance: AVSpeechUtterance
        
            if counter >= 1 {
                if counter <= 10 {
                    utterance = AVSpeechUtterance(string: String(counter))
                } else {
                    utterance = AVSpeechUtterance(string: "")
                }
            } else {
                utterance = AVSpeechUtterance(string: "Ding ding ding ding ding. Your timer is done")
            }
        
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speakUtterance(utterance)
        }
    }
    @IBAction func voiceEnabled() {
        if voiceSwitch.on {
            voiceEnableLabel.text = "Voice Enabled"
        } else {
            voiceEnableLabel.text = "Voice Disabled"
        }
    }
    func formatTime(interval:Int) -> NSString {
    
    let time = interval
    let seconds = time % 60
    let minutes = (time / 60) % 60
    let hours = (time / 3600)

    return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
}

