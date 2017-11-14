//
//  VisitDetailsViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/14/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class VisitDetailsViewController: UIViewController {
    var currentVisit : DoctorVisit?
    var selectedDate : Date?
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var doctorLabel: UITextField!
    @IBOutlet weak var whenLabel: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    
    let datePicker = UIDatePicker()
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @objc func donePressed() {
        selectedDate = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        whenLabel.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
            performSegue(withIdentifier: "saveVisit", sender: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
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
