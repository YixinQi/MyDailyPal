//
//  Screen18ViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/7/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen18ViewController: UIViewController, UITextFieldDelegate {
    
// 4 fields for PIN inputs
    @IBOutlet weak var num4: UITextField!
    @IBOutlet weak var num3: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var num1: UITextField!
    
// This determines if this screen is being accessed for the first time to set up a PIN or for a subsequent time to reset PIN
    var resettingPin : Bool = false
    
// When Screen is loaded, this method is called
    override func viewDidLoad() {
        super.viewDidLoad()
        
// Delegates need to be set in order to edit/access the fields
        num1.delegate = self
        num2.delegate = self
        num3.delegate = self
        num4.delegate = self
        navigationController?.setNavigationBarHidden(false, animated: true)
        
// This prevents the user from entering alpha characters in PIN values
        num1.keyboardType = UIKeyboardType.numberPad
        num2.keyboardType = UIKeyboardType.numberPad
        num3.keyboardType = UIKeyboardType.numberPad
        num4.keyboardType = UIKeyboardType.numberPad

    }

// BoilerPlate code created by XCODE
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// We don't want a nav bar to appear at the top of this particular screen
    override func viewDidAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)

    }
    
// The following method was taken from StackOverflow. It does a few things:
// - limits the lenght of each PIN digit input field to only 1 digit
// - Automatically progresses the 'cursor' or textfield focus to the next digit when one is entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if ((textField.text?.characters.count)! < 1  && string.characters.count > 0){
            if(textField == num1){
                num2.becomeFirstResponder()
            }
            if(textField == num2){
                num3.becomeFirstResponder()
            }
            if(textField == num3){
                num4.becomeFirstResponder()
            }
            textField.text = string
            return false
            
        }else if ((textField.text?.characters.count)! >= 1  && string.characters.count == 0){
            // on deleting value from Textfield
            if(textField == num2){
                num1.becomeFirstResponder()
            }
            if(textField == num3){
                num2.becomeFirstResponder()
            }
            if(textField == num4) {
                num3.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }else if ((textField.text?.characters.count)! >= 1  ){
            textField.text = string
            return false
        }
        return true
    }
    
//This is how we pass data to the next view. resettingPin determines if we are setting it for the first time or if we are resetting it
//confirmPINVC.data will be used to check if the first PIN is equal to the PIN entered on the ConfirmScreen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToConfirmPIN" {
            let confirmPINVC = segue.destination as! ConfirmPIN_VC
            if resettingPin == true {
                confirmPINVC.resettingPin = true
            }
            confirmPINVC.data = num1.text! + num2.text! + num3.text! + num4.text!
        }
    }
    
//Views act like stacks in SWIFT, dismissing self (a view) will pop it off of the stack and return to the previous view
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//Checks if all of the fields have input, if they do, progress to next confirm screen, if they don't prompt user
    @IBAction func NextButtonPressed(_ sender: Any) {
        if num1.text == "" || num2.text == "" || num3.text == "" || num4.text == "" {
            createAlert()
            print("one of the fields is blank")
        } else {
            performSegue(withIdentifier: "SegueToConfirmPIN", sender: self)
        }
    }
  
//Prompts user to fix input
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Please input values into all fields", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // the '1' here is how long the pop up lasts, change as you feel fit.
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
