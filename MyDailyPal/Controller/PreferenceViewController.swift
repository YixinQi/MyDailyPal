//
//  PreferenceViewController.swift
//  MyDailyPal
//
//  Created by mingfei on 11/19/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class PreferenceViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var notifyTimeBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var targetBtn: UIButton!
    @IBOutlet weak var settingPicker: UIPickerView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var pwdView: UIView!
    @IBOutlet weak var newPinView: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var pwdText: UITextField!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var tipSwitch: UISwitch!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    var preferences : Preferences?
    var currentPwd : String?
    var array = ["Last 30 Days (Default)","Last 7 Days","Since Date"]
    var showMenu = false
    @IBAction func showMenu(_ sender: Any) {
        if(showMenu){
            trailingConstraint.constant = 375
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }else{
            trailingConstraint.constant = 25
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
        showMenu = !showMenu
    }
    @IBAction func changePin(_ sender: Any) {
        mainView.backgroundColor = UIColor.lightGray
        pwdView.isHidden = false
    }
    
    @IBAction func cancelChangePin(_ sender: Any) {
        mainView.backgroundColor = UIColor.white
        pwdView.isHidden = true
    }
    
    @IBAction func confirmPin(_ sender: Any) {
        var password = pwdText.text
        if password == currentPwd {
            performSegue(withIdentifier: "changePin", sender: self)
        } else {
            createAlert()
        }
    }
    
    @IBAction func turnOffPin(_ sender: Any) {
        newPinView.isHidden = false
        self.preferences!.pinActivated = false
    }
    
    @IBAction func newPin(_ sender: Any) {
        performSegue(withIdentifier: "changePin", sender: self)
    }
    
    @IBAction func changeSecurityAnswer(_ sender: Any) {
        performSegue(withIdentifier: "changeAnswer", sender: self)
    }
    @IBAction func selectTarget(_ sender: Any) {
        settingPicker.isHidden = false
        settingPicker.backgroundColor = UIColor.white
        //mainView.backgroundColor = UIColor.lightGray
    }
    @IBAction func selectTime(_ sender: Any) {
        datePicker.isHidden = false
        datePicker.backgroundColor = UIColor.white
        mainView.backgroundColor = UIColor.lightGray
        newPinView.backgroundColor = UIColor.lightGray
        toolBar.isHidden = false
        toolBar.backgroundColor = UIColor.white
    }
    @IBAction func doneTimeSelect(_ sender: Any) {
        toolBar.isHidden = true
        datePicker.isHidden = true
        mainView.backgroundColor = UIColor.white
        newPinView.backgroundColor = UIColor.white
        //let timeSelected = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let timeSelected = formatter.string(from: datePicker.date)
        notifyTimeBtn.setTitle(timeSelected, for: .normal)
        let preference = Preferences(context: PersistenceService.context)
        preference.notificationTime = timeSelected
        PersistenceService.saveContext()
    }
    
    @IBAction func notificationSwitch(_ sender: UISwitch) {
        let preference = Preferences(context: PersistenceService.context)
        preference.showNotification = sender.isOn
        PersistenceService.saveContext()
    }
    
    @IBAction func tipSwitch(_ sender: UISwitch) {
        let preference = Preferences(context: PersistenceService.context)
        preference.showTips = sender.isOn
        PersistenceService.saveContext()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pwdView.isHidden = true
        newPinView.isHidden = true
        mainView.backgroundColor = UIColor.white
        //img1.layer.cornerRadius = img1.frame.size.width/2
        //img1.clipsToBounds = true
        setRoungImg(image:img1)
        setRoungImg(image:img2)
        setRoungImg(image:img3)
        setRoungImg(image:img4)
        setRoungImg(image:img5)
        setRoungImg(image:img6)
        setRoungImg(image:img7)
        //print("current pin is: "+preferences!.pin!)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Preferences")
        request.returnsObjectsAsFaults = false
        let fetchRequest: NSFetchRequest<Preferences> = Preferences.fetchRequest()
        do {
            let preferences = try PersistenceService.context.fetch(fetchRequest)
            if preferences.count <= 0 {
                print("No data loaded")
                
            } else {
                self.preferences = preferences[preferences.count-1]
                print(self.preferences!)
                if  self.preferences!.showTarget.isEmpty{
                    targetBtn.setTitle("Last 30 Days (Default)", for: .normal)
                } else{
                    let target = self.preferences!.showTarget
                    targetBtn.setTitle(target, for: .normal)
                }
                
                if  self.preferences!.notificationTime.isEmpty{
                    notifyTimeBtn.setTitle("09:00 AM", for: .normal)
                } else{
                    let time = self.preferences!.notificationTime
                    notifyTimeBtn.setTitle(time, for: .normal)
                }
                
                if self.preferences!.pinActivated == true {
                    print("Here is their PIN: " + self.preferences!.pin!)
                    currentPwd = self.preferences!.pin!
                } else {
                    newPinView.isHidden = false
                }
                notifySwitch.setOn(self.preferences!.showNotification, animated: true)
                tipSwitch.setOn(self.preferences!.showTips, animated: true)
                
                
                //performSegue(withIdentifier: "SegueToEnterPin", sender: self)
            }
        } catch {
            print("ERRORR!")
            
        }
        toolBar.isHidden = true
        datePicker.isHidden = true
        settingPicker.isHidden = true
        settingPicker.delegate = self
        settingPicker.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setRoungImg (image:UIImageView){
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
    }
    
    func createAlert(){
        let alert = UIAlertController(title: "Incorrect Entry", message: "Incorrect PIN, Please try again.", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = array[row]
        targetBtn.setTitle(selected, for: .normal)
        let preference = Preferences(context: PersistenceService.context)
        preference.showTarget = selected
        PersistenceService.saveContext()
        settingPicker.isHidden = true
        mainView.backgroundColor = UIColor.white
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
