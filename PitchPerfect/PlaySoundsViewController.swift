//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Akshay Gangwar on 22/03/16.
//  Copyright © 2016 Akshay Gangwar. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController:UIViewController {
    
    var recordedAudioURL:NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType:Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    
    @IBOutlet weak var snailButton:UIButton!
    @IBOutlet weak var rabbitButton:UIButton!
    @IBOutlet weak var chipmunkButton:UIButton!
    @IBOutlet weak var vaderButton:UIButton!
    @IBOutlet weak var echoButton:UIButton!
    @IBOutlet weak var reverbButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!
    
    @IBAction func playSoundForButton(sender:UIButton) {
        
        print("play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate:0.5)
        case .Fast:
            playSound(rate:1.5)
        case .Chipmunk:
            playSound(pitch:1000)
        case .Vader:
            playSound(pitch:-1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    
    }
    
    @IBAction func stopButtonPressed(sender:UIButton){
        print("stop button pressed")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Play Sounds VC loaded")
        setupAudio()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

}