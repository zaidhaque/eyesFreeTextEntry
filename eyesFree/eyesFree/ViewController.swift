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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        outputTextField.text = "i like cheese"
        
        start = NSDate()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTup (sender: UIButton) {

        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000
        let char = sender.currentTitle! as NSString
        
        print()
        print("<entry char=\"\(char)\" value=\"\(char.characterAtIndex(0))\" time=\"\(timePassed)\" />")
        outputTextField.text = outputTextField.text!.stringByAppendingString(sender.currentTitle!)
    }
    
    @IBAction func didSwipeLeft(sender: AnyObject) {
        
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000
        
        print()
        print("<entry char=\"&#008;\" value=\"116\" time=\"\(timePassed)\" />")
        outputTextField.text = String(outputTextField.text!.characters.dropLast())
    }
    
    @IBAction func didSwipeRight(sender: AnyObject) {
        
        let timePassed = NSDate().timeIntervalSinceDate(start!) * 1000
        let char = " " as NSString
        
        print()
        print("<entry char=\"\(char)\" value=\"116\" time=\"\(timePassed)\" />")
        outputTextField.text = outputTextField.text!.stringByAppendingString(" ")
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        
        print()
        print("<transcribed>\(outputTextField.text!)</transcribed>")
        print()
        print("</task>")
    }
    
    @IBAction func didSwipeUp(sender: AnyObject) {
        
        print()
        print("<transcribed>\(outputTextField.text!)</transcribed>")
        print()
        print("</task>")
        
        outputTextField.text = ""
    }
    
    @IBAction func didSwipeDown(sender: AnyObject) {
        
        let utterance = AVSpeechUtterance(string: outputTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.7
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
    
    
}


