//
//  DoctorVisit.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/13/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class DoctorVisit {
    var title : String
    var doctor : String?
    var dateTime : Date?
    var remindMe : Bool?
    
    init(){
        title = ""
        doctor = ""
        dateTime = nil
        remindMe = false
    }
    
    init(title: String, doctor: String, dateTime: Date, remindMe: Bool){
        self.title = title
        self.doctor = doctor
        self.dateTime = dateTime
        self.remindMe = remindMe
    }
}
