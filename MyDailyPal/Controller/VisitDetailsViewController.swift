//
//  VisitDetailsViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/14/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class VisitDetailsViewController: UIViewController {
//variable to store a DoctorVisit object
    var currentVisit : DoctorVisit?
//variable to keep a date in the correct datatype for easier parsing
    var selectedDate : Date?
    
//UI Elements
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var doctorLabel: UITextField!
    @IBOutlet weak var whenLabel: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    
//Will be used to select date
    let datePicker = UIDatePicker()
    
//When view is loaded, date picker is set up and fields are prepopulated if user is editing an existing visit.
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        if currentVisit != nil {
            locationLabel.text = currentVisit?.title
            doctorLabel.text = currentVisit?.doctor
            selectedDate = currentVisit?.dateTime as! Date
            
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = DateFormatter.Style.short
            dateformatter.timeStyle = DateFormatter.Style.short
            whenLabel.text = dateformatter.string(from: (currentVisit?.dateTime)! as Date)
            remindMeSwitch.isOn = (currentVisit?.remindMe)!
        }

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool){
//        super.viewWillAppear(true)
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    override func viewWillDisappear(_ animated: Bool){
//        super.viewWillAppear(true)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Sets up the date picker
    func createDatePicker() {
        //Uncomment this line if you want military time in the datePicker
        //datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        whenLabel.inputAccessoryView = toolbar
        
        whenLabel.inputView = datePicker
    }
   
//Sets the date when one is picked
    @objc func donePressed() {
        selectedDate = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        whenLabel.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

//pops a view off the view stack and returns to the previous view
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//When save button is pressed, the user input is validated and then the visit is created and saved in the phones local storage
    @IBAction func SaveButtonPressed(_ sender: Any) {
        if locationLabel.text == "" || doctorLabel.text == "" || whenLabel.text == ""  {
            createAlert()
            print("one of the fields is blank")
        } else {
            if currentVisit == nil {
                currentVisit = DoctorVisit(context: PersistenceService.context)
            }
            currentVisit?.dateTime = selectedDate as! NSDate
            currentVisit?.doctor = doctorLabel.text
            currentVisit?.title = locationLabel.text!
            currentVisit?.remindMe = remindMeSwitch.isOn
            PersistenceService.saveContext()
            
//If user selected to be reminded, they will schedule an in app notification for that time.
            if currentVisit?.remindMe == true {
                UNUserNotificationCenter.current().getNotificationSettings {(settings) in
                    if (settings.authorizationStatus == .authorized) {
                        self.scheduleNotification(visit: self.currentVisit!)
                    } else {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: { (granted, error) in
                            if let error = error {
                                print(error)
                            } else {
                                if (granted) {
                                    self.scheduleNotification(visit: self.currentVisit!)
                                }
                            }
                        })
                    }
                }
            }
            self.navigationController?.popViewController(animated: true)
            //confirmNewAppointment()
            //performSegue(withIdentifier: "saveVisit", sender: self)
        }
    }
    func confirmNewAppointment() {
        let alert = UIAlertController(title: "Visit Scheduled", message: "Your visit details have been saved! You can now add another visit or return to your list of visits", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
        
        whenLabel.text = ""
        doctorLabel.text = ""
        locationLabel.text = ""
    }
//Method for creating in app notifications for visits
    func scheduleNotification(visit: DoctorVisit){
//Formatting date of visit details into string for notification
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let contentDate = dateFormatter.string(from: selectedDate!)
        
//Notification Body and content
        let contentBody = "You have scheduled a visit with \(visit.doctor!) at \(visit.title!) on \(contentDate)"
        let content = UNMutableNotificationContent()
        content.title = "MyDailyPal"
        content.body = contentBody
        
//Creating the timestamps for when the reminders should fire (day before and hour before)
        let dayBeforeReminder = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate!)
        let dayBeforeComps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dayBeforeReminder!)
        let hourBeforeReminder = Calendar.current.date(byAdding: .hour, value: -1, to: selectedDate!)
        let hourBeforeComps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: hourBeforeReminder!)

//Creating the triggers based off of these timestamps
        let dayBeforeTrigger = UNCalendarNotificationTrigger(dateMatching: dayBeforeComps, repeats: false)
        let hourBeforeTrigger = UNCalendarNotificationTrigger(dateMatching: hourBeforeComps, repeats: false)

        
//Scheduling the day before notification
        let dayBeforeNotificationRequest = UNNotificationRequest(identifier: "\(contentBody) dayBefore", content: content, trigger: dayBeforeTrigger)
        UNUserNotificationCenter.current().add(dayBeforeNotificationRequest){ (error) in
            if let error = error {
                print(error)
            } else {
                print("Day Before Notification Scheduled");
            }
        }
        
//Scheduling the hour before notification
        let hourBeforeNotificationRequest = UNNotificationRequest(identifier: "\(contentBody) hourBefore", content: content, trigger: hourBeforeTrigger)
        UNUserNotificationCenter.current().add(hourBeforeNotificationRequest){ (error) in
            if let error = error {
                print(error)
            } else {
                print("Hour Before Notification Scheduled");
            }
        }
    }

//Hides the input fields when user taps somewhere else on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//Alerts the user if they entered incorrect information
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Please input values into all fields", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    

    
}
