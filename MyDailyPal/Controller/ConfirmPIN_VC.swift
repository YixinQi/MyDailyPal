//
//  ConfirmPIN_VC.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class ConfirmPIN_VC: UIViewController, UITextFieldDelegate {
    
//data is populated with the first PIN they enter on the previous screen
    var data: String = ""
    
//Used to determine if first time setting up PIN or if they are resetting PIN
    var resettingPin: Bool = false
    
//Will be used to store PIN and security question information
    var preferences: Preferences?
    
//Input fields for PIN digits
    @IBOutlet weak var num4Confirm: UITextField!
    @IBOutlet weak var num3Confirm: UITextField!
    @IBOutlet weak var num2Confirm: UITextField!
    @IBOutlet weak var num1Confirm: UITextField!
    
//Actions that occur when the view is first loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        
//Delegates for the textfields must be set to edit/access their data
        num1Confirm.delegate = self
        num2Confirm.delegate = self
        num3Confirm.delegate = self
        num4Confirm.delegate = self
        
//Prevents alpha characters from being entered for PIN digits
        num1Confirm.keyboardType = UIKeyboardType.numberPad
        num2Confirm.keyboardType = UIKeyboardType.numberPad
        num3Confirm.keyboardType = UIKeyboardType.numberPad
        num4Confirm.keyboardType = UIKeyboardType.numberPad
    }

//Xcode BoilerPlate
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// The following method was taken from StackOverflow. It does a few things:
// - limits the lenght of each PIN digit input field to only 1 digit
// - Automatically progresses the 'cursor' or textfield focus to the next digit when one is entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if ((textField.text?.characters.count)! < 1  && string.characters.count > 0){
            if(textField == num1Confirm){
                num2Confirm.becomeFirstResponder()
            }
            if(textField == num2Confirm){
                num3Confirm.becomeFirstResponder()
            }
            if(textField == num3Confirm){
                num4Confirm.becomeFirstResponder()
            }
            textField.text = string
            return false
            
        }else if ((textField.text?.characters.count)! >= 1  && string.characters.count == 0){
            // on deleting value from Textfield
            if(textField == num2Confirm){
                num1Confirm.becomeFirstResponder()
            }
            if(textField == num3Confirm){
                num2Confirm.becomeFirstResponder()
            }
            if(textField == num4Confirm) {
                num3Confirm.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }else if ((textField.text?.characters.count)! >= 1  ){
            textField.text = string
            return false
        }
        return true
    }

//Views act like stacks in SWIFT, dismissing self (a view) will pop it off of the stack and return to the previous view
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

//Send data (the PIN) to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToSecurityQuestions" {
            let securityQuestionsSetupVC = segue.destination as! SecurityQuestionsSetup_VC
            securityQuestionsSetupVC.code = data
        }
    }
    
//When nextButton is pressed
    @IBAction func nextButtonPressed(_ sender: Any) {
        
//Consolidates the PIN digits
        var confirmPIN = num1Confirm.text! + num2Confirm.text! + num3Confirm.text! + num4Confirm.text!
        
//If confirm PIN matches the initial PIN entered
        if confirmPIN == data {
            print("PINS are the same")
            
//If user is just resetting the PIN, resave the data to the device and then navigate to the main screen (not to the security questions screen)
            if resettingPin == true {
                let fetchRequest: NSFetchRequest<Preferences> = Preferences.fetchRequest()
                
                
                do {
//CoreData code to save data locally to the device
                    let preferences = try PersistenceService.context.fetch(fetchRequest)

                    self.preferences = preferences[preferences.count-1]
                    let newPreferences = Preferences(context: PersistenceService.context)
                    newPreferences.pin = data
                    newPreferences.question1 = self.preferences?.question1
                    newPreferences.question2 = self.preferences?.question2
                    newPreferences.answer1 = self.preferences?.answer1
                    newPreferences.answer2 = self.preferences?.answer2
                    newPreferences.pinActivated = true
                    PersistenceService.saveContext()
                    
//Navigate to Main Screen
                    performSegue(withIdentifier: "ResetSuccessSegue", sender: self)
                    
                } catch {
                    print("ERRORR!")
                    
                }
    
//If not resetting PIN, navigate to set up security questions screen
            } else {
               performSegue(withIdentifier: "SegueToSecurityQuestions", sender: self)
            }
            //performSegue(withIdentifier: "SegueToSecurityQuestions", sender: self)
            
//Handle user input error
        } else {
            print("PINS NOT SAME")
            num1Confirm.text = ""
            num2Confirm.text = ""
            num3Confirm.text = ""
            num4Confirm.text = ""
            num1Confirm.becomeFirstResponder()
            createAlert()
        }
    }
    
    
//Alerts user of non matching PINs
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "PINS do not match", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }


}
