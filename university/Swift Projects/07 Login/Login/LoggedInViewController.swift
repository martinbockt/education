//
//  LoggedInViewController.swift
//  Login
//
//  Created by Martin Bock on 18.01.22.
//

import UIKit

class LoggedInViewController: UIViewController {

    var text: String?

    var textVisible: Bool?

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        result.text = text
        if textVisible == false {
            textField.isHidden = false
            button.isHidden = false
        } else {
            textField.isHidden = true
            button.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
