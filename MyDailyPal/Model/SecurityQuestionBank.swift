//
//  SecurityQuestionBank.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/25/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class SecurityQuestionBank {
    var securityQuestions = [SecurityQuestion]()
    
    init(){
        securityQuestions.append(SecurityQuestion(question: "What was your childhood nickname?"))
        securityQuestions.append(SecurityQuestion(question: "In what city did you meet your spouse/significant other?"))
        securityQuestions.append(SecurityQuestion(question: "What was your dream job?"))
        securityQuestions.append(SecurityQuestion(question: "What was the name of your first pet?"))
        securityQuestions.append(SecurityQuestion(question: "What is the name of your favorite childhood friend?"))
        securityQuestions.append(SecurityQuestion(question: "What school did you attend for sixth grade?"))
        securityQuestions.append(SecurityQuestion(question: "In what city or town did your mother and father meet?"))
        securityQuestions.append(SecurityQuestion(question: "Who is your favorite teacher?"))
        securityQuestions.append(SecurityQuestion(question: "In what city does your friend live?"))
        securityQuestions.append(SecurityQuestion(question: "In what city or town was your first job?"))
        securityQuestions.append(SecurityQuestion(question: "What is your favorite movie?"))
        securityQuestions.append(SecurityQuestion(question: "What is your favorite food?"))
        securityQuestions.append(SecurityQuestion(question: "Who is your favorite leader?"))
    }
}
