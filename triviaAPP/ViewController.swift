//
//  ViewController.swift
//  triviaAPP
//
//  Created by Rahul on 16/03/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startApp() {
        //lets make it
        let vc = storyboard?.instantiateViewController(identifier: "Quest") as! QusteViewController
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }

}
