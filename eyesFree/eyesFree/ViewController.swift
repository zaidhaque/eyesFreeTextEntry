//
//  ViewController.swift
//  eyesFree
//
//  Created by Zaid Haque on 4/18/16.
//  Copyright © 2016 Zaid Haque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTup (sender: UIButton) {
        print("didTup \(sender.currentTitle!)")
        print("<entry char=\"\(sender.currentTitle!)\" value=\"116\" time=\"166978.836\" />")
        outputTextField.text = outputTextField.text!.stringByAppendingString(sender.currentTitle!)
    }
}


