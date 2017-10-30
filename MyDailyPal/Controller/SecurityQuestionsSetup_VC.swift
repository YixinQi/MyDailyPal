//
//  SecurityQuestionsSetup_VC.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class SecurityQuestionsSetup_VC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

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

    @IBOutlet weak var transparentBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        q1DropDown.delegate = self
        q1DropDown.dataSource = self
        q1DropDown.backgroundColor = UIColor.white
        q1DropDown.isHidden = true
        
        q2DropDown.delegate = self
        q2DropDown.dataSource = self
        q2DropDown.backgroundColor = UIColor.white
        q2DropDown.isHidden = true
        
        transparentBackground.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureRecognizer:)))
        question1.addGestureRecognizer(tap)
        question1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tap2(gestureRecognizer:)))
        question2.addGestureRecognizer(tap2)
        question2.isUserInteractionEnabled = true
        
        questions = questionBank.securityQuestions
        question1.text = questions[0].question
        question2.text = questions[1].question
        question1arrow.text = arrow
        question2arrow.text = arrow
        
        answer2.delegate = self
        answer1.delegate = self

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tap2(gestureRecognizer: UITapGestureRecognizer){
        print("tap2 hit")
        q2DropDown.isHidden = false
        transparentBackground.isHidden = false
    }
    
    @objc func tap(gestureRecognizer: UITapGestureRecognizer){
        print("*")
        q1DropDown.isHidden = false
        transparentBackground.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            question1.text = questions[row].question
        } else {
            question2.text = questions[row].question
        }
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questions[row].question
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        q1DropDown.isHidden = true
        q2DropDown.isHidden = true
        transparentBackground.isHidden = true
        self.view.endEditing(true)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        
        
        if question1.text == question2.text {
            createAlert()
        } else {
            if answer1.text == "" || answer2.text == "" {
              createAlert2()
            } else {
                performSegue(withIdentifier: "FromSecurityQuestionsToMain", sender: self)
            }
        }
    }
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
