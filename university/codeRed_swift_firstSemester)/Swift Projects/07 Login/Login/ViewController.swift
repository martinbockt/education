//
//  ViewController.swift
//  Login
//
//  Created by Martin Bock on 18.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotUsernameBtn: UIButton!
    
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! LoggedInViewController
        
        guard let sender = sender as? UIButton else {return}

        if sender == forgotPasswordBtn {
            segue.destination.navigationItem.title = "Forgot Password!"
            controller.text = "Reset your password!"
            controller.textVisible = false
        } else if sender == forgotUsernameBtn {
            segue.destination.navigationItem.title = "Forgot Username"
            controller.text = "Reset your username!"
            controller.textVisible = false
        }   else {
            segue.destination.navigationItem.title = username.text
            controller.text = "Hello \(username.text!), you are logged in"
            controller.textVisible = true
        }
    }
    
    @IBAction func forgotUsternameAction(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: sender)
       
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: sender)
     
    }
    
    @IBAction func logInBtn(_ sender: Any) {
        if !username.text!.isEmpty && !password.text!.isEmpty {
            performSegue(withIdentifier: "LogInSegue", sender: sender)
        }
    }
}

