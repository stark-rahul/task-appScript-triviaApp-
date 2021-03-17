//
//  SecondViewController.swift
//  triviaAPP
//
//  Created by Rahul on 17/03/21.
//

import UIKit

class SecondViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
}
extension SecondViewController :UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
