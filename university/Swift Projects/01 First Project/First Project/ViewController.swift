//
//  ViewController.swift
//  First Project
//
//  Created by Martin Bock on 25.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button1(_ sender: Any) {
        label.text = "Hello " + textfield.text!
    }

}
