//
//  ViewController.swift
//  First Light
//
//  Created by Martin Bock on 25.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonState: UIButton!
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkLight()
    }

    fileprivate func checkLight() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func displayClick(_ sender: UITapGestureRecognizer) {
        lightOn.toggle()
        checkLight()
    }
}

