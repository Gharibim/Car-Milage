//
//  LoginViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/11/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var carMileage: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordT: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = button.layer.frame.height / 2
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.shadowColor = UIColor.red.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        shouldPerformSegue(withIdentifier: "FirstS", sender: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if userName.text == "admin" {
            if passwordT.text == "12345" {
                return true
            }
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}
