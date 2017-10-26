//
//  Screen18ViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/7/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen18ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var num4: UITextField!
    @IBOutlet weak var num3: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var num1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        num1.delegate = self
        num2.delegate = self
        num3.delegate = self
        num4.delegate = self
        navigationController?.setNavigationBarHidden(false, animated: true)
        num1.keyboardType = UIKeyboardType.numberPad
        num2.keyboardType = UIKeyboardType.numberPad
        num3.keyboardType = UIKeyboardType.numberPad
        num4.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        //self.navigationController?.navigationBar.set
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToConfirmPIN" {
            let confirmPINVC = segue.destination as! ConfirmPIN_VC
            
            confirmPINVC.data = num1.text! + num2.text! + num3.text! + num4.text!
        }
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func NextButtonPressed(_ sender: Any) {
        if num1.text == "" || num2.text == "" || num3.text == "" || num4.text == "" {
            createAlert()
            print("one of the fields is blank")
        } else {
            performSegue(withIdentifier: "SegueToConfirmPIN", sender: self)
        }
    }
    
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Please input values into all fields", preferredStyle: .alert)
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
