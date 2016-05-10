//
//  ViewController.swift
//  eyesFree
//
//  Created by Zaid Haque on 4/18/16.
//  Copyright © 2016 Zaid Haque. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputTextField: UITextField!
    var start : NSDate?
    var STARTTIME = 280319.0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        //outputTextField.text = "i like cheese"
        
        start = NSDate()
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000 + STARTTIME
        
        print("<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>")
        print()
        print("<TextTest version=\"2.0.2\" time=\"\(timePassed)\" date=\"Tuesday, May 10, 2016 06:30:56\">")
        print()
        print("<task number=\"1\" testing=\"False\">")
        print()
        print("<presented>____________</presented>")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTup (sender: UIButton) {

        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000 + STARTTIME
        let char = sender.currentTitle! as NSString
        
        print()
        print("<entry char=\"\(char)\" value=\"\(char.characterAtIndex(0))\" time=\"\(timePassed)\" />")
        outputTextField.text = outputTextField.text!.stringByAppendingString(sender.currentTitle!)
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        let utterance = AVSpeechUtterance(string: sender.currentTitle!)
        synthesizer.speakUtterance(utterance)

    }
    
    @IBAction func didSwipeLeft(sender: AnyObject) {
        
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000 + STARTTIME
        
        print()
        print("<entry char=\"&#008;\" value=\"8\" time=\"\(timePassed)\" />")
        outputTextField.text = String(outputTextField.text!.characters.dropLast())
        
        let utterance = AVSpeechUtterance(string: "backspace")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
    
    @IBAction func didSwipeRight(sender: AnyObject) {
        
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000 + STARTTIME
        let char = " " as NSString
        
        print()
        print("<entry char=\"\(char)\" value=\"\(char.characterAtIndex(0))\" time=\"\(timePassed)\" />")
        outputTextField.text = outputTextField.text!.stringByAppendingString(" ")
        
        let utterance = AVSpeechUtterance(string: "space")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000
        
        print()
        print("<close error=\"0\" time=\"\(timePassed)\" date=\"Tuesday, May 10, 2016 06:30:56\"/>")
        print()
        print("</TextTest>")
    }
    
    @IBAction func didSwipeUp(sender: AnyObject) {
        
        print()
        print("<transcribed>\(outputTextField.text!)</transcribed>")
        print()
        print("</task>")
        print()
        print("<task number=\"1\" testing=\"False\">")
        print()
        print("<presented>____________</presented>")
        
        outputTextField.text = ""
        
        let utterance = AVSpeechUtterance(string: "submit")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
    
    @IBAction func didSwipeDown(sender: AnyObject) {
        
        print()
        print("didSwipeDown")
        print()
        
        let utterance = AVSpeechUtterance(string: outputTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.7
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
        
    }
    
    
}


