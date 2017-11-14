//
//  EnterPINViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/30/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class EnterPINViewController: UIViewController, UITextFieldDelegate {

//Inbput fields for user
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var num3: UITextField!
    @IBOutlet weak var num4: UITextField!
    
//object to store user preferences
    var preferences: Preferences?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("storedPIN is : " + preferences!.pin!)
//set the delegates of the textfields to edit and access the data
        num1.delegate = self
        num2.delegate = self
        num3.delegate = self
        num4.delegate = self
//Prevent user form entering alpha characters as PIN digits
        num1.keyboardType = UIKeyboardType.numberPad
        num2.keyboardType = UIKeyboardType.numberPad
        num3.keyboardType = UIKeyboardType.numberPad
        num4.keyboardType = UIKeyboardType.numberPad

        // Do any additional setup after loading the view.
    }

//Xcode BoilerPlate
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
//hide the keyboard when the user taps another part of the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    

//When login button is pressed, it first consolidates the inputs into one 4-digit code then checks if the PIN is correct. If it is, it navigates to the main page
    @IBAction func LoginButtonPressed(_ sender: Any) {
        var enteredPIN = num1.text! + num2.text! + num3.text! + num4.text!
        if enteredPIN == preferences!.pin! {
            performSegue(withIdentifier: "SuccessfulLogin", sender: self)
        } else {
            createAlert()
            num1.text = ""
            num2.text = ""
            num3.text = ""
            num4.text = ""
        }
    }
    
//Alerts user when the input is incorrect
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Incorrect PIN, Please try again.", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
//If user selected "Forgot PIN"
    @IBAction func forgotPINButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ForgotPINSegue", sender: self)
    }
    
//Sends data to the forgot PIN screen to validate security questions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ForgotPINSegue" {
            let forgotPIN = segue.destination as! ForgotPINViewController
            
            forgotPIN.preferences = preferences!
        }
    }
    


}
