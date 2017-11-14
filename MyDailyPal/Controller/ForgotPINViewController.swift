//
//  ForgotPINViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/30/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class ForgotPINViewController: UIViewController, UITextFieldDelegate {
    
    var preferences: Preferences?
    
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question1.text = preferences!.question1
        question2.text = preferences!.question2
        
        answer2.delegate = self
        answer1.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetPINButtonPressed(_ sender: Any) {
        if answer1.text == preferences!.answer1 && answer2.text == preferences!.answer2
        {
           performSegue(withIdentifier: "SegueToResetPIN", sender: self)
        } else {
            createAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToResetPIN" {
            let resetPIN = segue.destination as! Screen18ViewController
            
            resetPIN.resettingPin = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Entered Security Questions Answers are Wrong", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1.5
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
