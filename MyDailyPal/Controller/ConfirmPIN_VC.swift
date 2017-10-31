//
//  ConfirmPIN_VC.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class ConfirmPIN_VC: UIViewController, UITextFieldDelegate {
    
    var data: String = ""
    
    @IBOutlet weak var num4Confirm: UITextField!
    @IBOutlet weak var num3Confirm: UITextField!
    @IBOutlet weak var num2Confirm: UITextField!
    @IBOutlet weak var num1Confirm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        num1Confirm.delegate = self
        num2Confirm.delegate = self
        num3Confirm.delegate = self
        num4Confirm.delegate = self
        num1Confirm.keyboardType = UIKeyboardType.numberPad
        num2Confirm.keyboardType = UIKeyboardType.numberPad
        num3Confirm.keyboardType = UIKeyboardType.numberPad
        num4Confirm.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToSecurityQuestions" {
            let securityQuestionsSetupVC = segue.destination as! SecurityQuestionsSetup_VC
            securityQuestionsSetupVC.code = data
        }
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        var confirmPIN = num1Confirm.text! + num2Confirm.text! + num3Confirm.text! + num4Confirm.text!
        
        if confirmPIN == data {
            print("PINS are the same")
            performSegue(withIdentifier: "SegueToSecurityQuestions", sender: self)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
