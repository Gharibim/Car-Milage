//
//  AddGasViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/9/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit

class AddGasViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var FullGas: UIButton!
    @IBOutlet weak var Ptank: UIButton!
    @IBOutlet weak var mpaid: UIButton!
    
    @IBOutlet weak var gasEnter: UIButton!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var gasTextF: UITextField!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var moneyTextF: UITextField!
    @IBOutlet weak var moneyEnter: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var trueLabel: UILabel!
    
    
    @IBAction func PtankAction(_ sender: Any) {
        errorLabel.isHidden = true
        trueLabel.isHidden = true
        moneyLabel.isHidden = true
        moneyTextF.isHidden = true
        moneyEnter.isHidden = true
        gasEnter.applyDesign()
        gasEnter.applySlide()
        gasTextF.applySlide()
        gasLabel.applySlide()
        
    }
    
    @IBAction func mpaidAction(_ sender: Any) {
        errorLabel.isHidden = true
        trueLabel.isHidden = true
        gasEnter.isHidden = true
        gasTextF.isHidden = true
        gasLabel.isHidden = true
        moneyEnter.applyDesign()
        moneyEnter.applySlide()
        moneyTextF.applySlide()
        moneyLabel.applySlide()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        FullGas.applyDesign()
        Ptank.applyDesign()
        mpaid.applyDesign()
        gasEnter.isHidden = true
        gasTextF.isHidden = true
        gasLabel.isHidden = true
        moneyLabel.isHidden = true
        moneyTextF.isHidden = true
        moneyEnter.isHidden = true
        errorLabel.isHidden = true
        trueLabel.isHidden = true
        
     
    }
    
    
    
    @IBAction func gotFullAction(_ sender: Any) {
        let amount = String(15 * 23)
        myArrayDataStructure.myArray.append(amount)
        UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
        trueLabel.text = "A full tank of gas was added"
        trueLabel.isHidden = false
        
    }
    
    
    @IBAction func gasEnterAction(_ sender: Any) {
            if let sContent = gasTextF.text{
                if let amount = Int(sContent){
                    let result = String(amount * 23)
                    // append it to the global singleton array
                    myArrayDataStructure.myArray.append(result)
                    UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
                    trueLabel.text = "Gas amount was calculated and saved"
                    trueLabel.isHidden = false
                    errorLabel.isHidden = true
                    print(myArrayDataStructure.myArray)
                }else{
                    errorLabel.text = "Please enter a valid gas amount"
                    errorLabel.isHidden = false
                    trueLabel.isHidden = true
                }
            }else{
               errorLabel.text = "Please Enter a value"
                errorLabel.isHidden = false
                trueLabel.isHidden = true
            }
    gasTextF.text = ""
    }
    
    @IBAction func moneyEnterAction(_ sender: Any) {
        if let sContent = moneyTextF.text{
            if let amount = Int(sContent){
                let result = String((amount/2) * 23)
                // append it to the global singleton array
                myArrayDataStructure.myArray.append(result)
                UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
                trueLabel.text = "Money amount was calculated and saved"
                trueLabel.isHidden = false
                errorLabel.isHidden = true
                print(myArrayDataStructure.myArray)
            }else{
                errorLabel.text = "Please enter a valid amount of money"
                errorLabel.isHidden = false
                trueLabel.isHidden = true
            }
        }else{
            errorLabel.text = "Please Enter a value"
            errorLabel.isHidden = false
            trueLabel.isHidden = true
        }
        gasTextF.text = ""
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
extension UIButton{
    func applyDesign(){
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.setTitleColor(UIColor.blue, for: .normal)
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func applySlide(){
        self.isHidden = false
        self.center = CGPoint(x: self.center.x - 500, y: self.center.y)
        UIView.animate(withDuration: 2){
            self.center = CGPoint(x: self.center.x + 500, y: self.center.y)
        }
    }
}
extension UITextField{
    func applySlide(){
        self.isHidden = false
        self.center = CGPoint(x: self.center.x - 500, y: self.center.y)
        UIView.animate(withDuration: 2){
            self.center = CGPoint(x: self.center.x + 500, y: self.center.y)
        }
    }
}
extension UILabel{
    func applySlide(){
        self.isHidden = false
        self.center = CGPoint(x: self.center.x - 500, y: self.center.y)
        UIView.animate(withDuration: 2){
            self.center = CGPoint(x: self.center.x + 500, y: self.center.y)
        }
    }
}


