//
//  SecurityQuestionsSetup_VC.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class SecurityQuestionsSetup_VC: UIViewController {

    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    var questionBank = SecurityQuestionBank()
    var questions = [SecurityQuestion]()
    let arrow = "\u{25BC}"

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = questionBank.securityQuestions
        question1.text = questions[0].question + " " + arrow
        question2.text = questions[1].question + " " + arrow

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
