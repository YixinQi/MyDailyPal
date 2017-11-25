//
//  Screen10ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 10/29/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen10ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  @IBOutlet weak var Monday: UILabel!
  @IBOutlet weak var Tuesday: UILabel!
  @IBOutlet weak var Wendsday: UILabel!
  @IBOutlet weak var Thursday: UILabel!
  @IBOutlet weak var Friday: UILabel!
  @IBOutlet weak var Saturday: UILabel!
  @IBOutlet weak var Sunday: UILabel!
  
  @IBOutlet weak var Medication: UILabel!
  @IBOutlet weak var timePicker: UIDatePicker!
  @IBOutlet weak var transparentBackgound: UIView!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var timePickerBackground: UIView!
  @IBOutlet weak var setTimeLabel: UILabel!
  @IBOutlet weak var saveTimeButton: UIButton!
  @IBOutlet weak var cancelTimeButton: UIButton!
  @IBOutlet weak var tabletPicker: UIPickerView!
  @IBOutlet weak var dosagePicker: UIPickerView!
  @IBOutlet weak var setTimeButton: UILabel!
  //var medication: String
  var dosageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var tabletArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var treatmentPlan = TreatmentPlan(context: PersistenceService.context)
  override func viewDidLoad() {
        super.viewDidLoad()
        dosagePicker.delegate = self
        dosagePicker.dataSource = self
        tabletPicker.delegate = self
        tabletPicker.dataSource = self
        timePicker.isHidden = true
        timePickerBackground.isHidden = true
        transparentBackgound.isHidden = true
        saveTimeButton.isHidden = true
        cancelTimeButton.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureRecognizer:)))
        setTimeLabel.addGestureRecognizer(tap)
        setTimeLabel.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tap1(gestureRecognizer:)))
        Monday.addGestureRecognizer(tap1)
        Monday.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tap2(gestureRecognizer:)))
        Tuesday.addGestureRecognizer(tap2)
        Tuesday.isUserInteractionEnabled = true
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tap3(gestureRecognizer:)))
        Wendsday.addGestureRecognizer(tap3)
        Wendsday.isUserInteractionEnabled = true
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(tap4(gestureRecognizer:)))
        Thursday.addGestureRecognizer(tap4)
        Thursday.isUserInteractionEnabled = true
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(tap5(gestureRecognizer:)))
        Friday.addGestureRecognizer(tap5)
        Friday.isUserInteractionEnabled = true
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(tap6(gestureRecognizer:)))
        Saturday.addGestureRecognizer(tap6)
        Saturday.isUserInteractionEnabled = true
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(tap7(gestureRecognizer:)))
        Sunday.addGestureRecognizer(tap7)
        Sunday.isUserInteractionEnabled = true
        treatmentPlan.repeate = ""
        // Do any additional setup after loading the view.
    }

  @IBAction func next(_ sender: Any) {
    treatmentPlan.medication = Medication.text
    //treatmentPlan.attribute = "b"
    treatmentPlan.noOfDosage = Int16(dosagePicker.selectedRow(inComponent: 0))
    treatmentPlan.noOfTablet = Int16(tabletPicker.selectedRow(inComponent: 0))
    treatmentPlan.startDate = datePicker.date as NSDate
    //treatmentPlan.remindTime = timePicker.date as NSDate
    PersistenceService.saveContext()
    performSegue(withIdentifier: "tomytreatment", sender: self)
  }
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if (pickerView == dosagePicker) {
      return dosageArray[row]
    } else if (pickerView == tabletPicker){
      return tabletArray[row]
    }
    return ""
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if (pickerView == dosagePicker) {
      return dosageArray.count
    } else if (pickerView == tabletPicker){
      return tabletArray.count
    }
    return 0
  }
  @objc func tap(gestureRecognizer: UITapGestureRecognizer){
    timePicker.isHidden = false
    timePickerBackground.isHidden = false
    transparentBackgound.isHidden = false
    saveTimeButton.isHidden = false
    cancelTimeButton.isHidden = false
    //transparentBackground.isHidden = false
  }
  @objc func tap1(gestureRecognizer: UITapGestureRecognizer){
    Monday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Monday.text!
  }
  @objc func tap2(gestureRecognizer: UITapGestureRecognizer){
    Tuesday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Tuesday.text!
  }
  @objc func tap3(gestureRecognizer: UITapGestureRecognizer){
    Wendsday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Wendsday.text!
  }
  @objc func tap4(gestureRecognizer: UITapGestureRecognizer){
    Thursday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Thursday.text!
  }
  @objc func tap5(gestureRecognizer: UITapGestureRecognizer){
    Friday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Friday.text!
  }
  @objc func tap6(gestureRecognizer: UITapGestureRecognizer){
    Saturday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Saturday.text!
  }
  @objc func tap7(gestureRecognizer: UITapGestureRecognizer){
    Sunday.textColor = UIColor.red
    treatmentPlan.repeate = treatmentPlan.repeate! + Sunday.text!
  }

  @IBAction func clickSaveButton(_ sender: UIButton) {
    timePicker.isHidden = true
    timePickerBackground.isHidden = true
    saveTimeButton.isHidden = true
    cancelTimeButton.isHidden = true
    transparentBackgound.isHidden = true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let myTreatmentViewControler = segue.destination as! Screen4ViewController
    myTreatmentViewControler.treatmentPlan.append(treatmentPlan)
  }
  
  @IBAction func clickCancelButton(_ sender: UIButton) {
    timePicker.isHidden = true
    timePickerBackground.isHidden = true
    saveTimeButton.isHidden = true
    cancelTimeButton.isHidden = true
    transparentBackgound.isHidden = true
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
