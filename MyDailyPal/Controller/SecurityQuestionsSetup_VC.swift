//
//  SecurityQuestionsSetup_VC.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class SecurityQuestionsSetup_VC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
//UI Screen elements
    @IBOutlet weak var q2arrow: UILabel!
    @IBOutlet weak var q1arrow: UILabel!
    @IBOutlet weak var q2DropDown: UIPickerView!
    @IBOutlet weak var q1DropDown: UIPickerView!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var question1arrow: UILabel!
    @IBOutlet weak var question2arrow: UILabel!
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    var questionBank = SecurityQuestionBank()
    var questions = [SecurityQuestion]()
    let arrow = "\u{25BC}"
    
//This is the pin passed from the previous confirm PIN screen
    var code: String?

//This is used to black out screen when alert comes up
    @IBOutlet weak var transparentBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Have to set delegates and datasources for inputs
        q1DropDown.delegate = self
        q1DropDown.dataSource = self
        q1DropDown.backgroundColor = UIColor.white
        q1DropDown.isHidden = true
        
        q2DropDown.delegate = self
        q2DropDown.dataSource = self
        q2DropDown.backgroundColor = UIColor.white
        q2DropDown.isHidden = true
        
        transparentBackground.isHidden = true
        
//Assign what happens when the text fields are clicked (to ultimately make the drop down PickerView of questions appear)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureRecognizer:)))
        question1.addGestureRecognizer(tap)
        question1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tap2(gestureRecognizer:)))
        question2.addGestureRecognizer(tap2)
        question2.isUserInteractionEnabled = true
        
//Initially set the two questions
        questions = questionBank.securityQuestions
        question1.text = questions[0].question
        question2.text = questions[1].question
        question1arrow.text = arrow
        question2arrow.text = arrow
        
        answer2.delegate = self
        answer1.delegate = self
    }

//BoilerPlate Xcode
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
//Makes DropDown with Questions appear for question 2
    @objc func tap2(gestureRecognizer: UITapGestureRecognizer){
        print("tap2 hit")
        q2DropDown.isHidden = false
        transparentBackground.isHidden = false
    }
    
//Makes DropDown with Questions appear for question 1
    @objc func tap(gestureRecognizer: UITapGestureRecognizer){
        print("*")
        q1DropDown.isHidden = false
        transparentBackground.isHidden = false
    }
  
//method must be overriden to conform to PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

//method must be overriden to conform to PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
//method must be overriden to conform to PickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            question1.text = questions[row].question
        } else {
            question2.text = questions[row].question
        }
        self.view.endEditing(true)
    }
 
//method must be overriden to conform to PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questions[row].question
    }
 
//Closes pickerView when user taps away
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 
//Closes pickerView when user taps away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        q1DropDown.isHidden = true
        q2DropDown.isHidden = true
        transparentBackground.isHidden = true
        self.view.endEditing(true)
        
    }
   
//pop view off stack return to previous view
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//Validates user input then creates new preference object and saves it to device locally and navigates to next screen
    @IBAction func NextButtonPressed(_ sender: Any) {
        if question1.text == question2.text {
            createAlert()
        } else {
            if answer1.text == "" || answer2.text == "" {
              createAlert2()
            } else {
                let preferences = Preferences(context: PersistenceService.context)
                preferences.pin = code
                preferences.question1 = question1.text
                preferences.question2 = question2.text
                preferences.answer1 = answer1.text
                preferences.answer2 = answer2.text
                preferences.pinActivated = true
                PersistenceService.saveContext()
                
                performSegue(withIdentifier: "FromSecurityQuestionsToMain", sender: self)
            }
        }
    }
    
//Handles if the user tries to select the same question for both slots
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Questions must be different", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
//Handles if the user doesn't provide and answer to one or more questions
    func createAlert2(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Answers to each question much be provided", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    


}
