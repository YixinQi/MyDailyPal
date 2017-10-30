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
  
  @IBOutlet weak var tabletPicker: UIPickerView!
  @IBOutlet weak var dosagePicker: UIPickerView!
  var dosageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var tabletArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  override func viewDidLoad() {
        super.viewDidLoad()
        dosagePicker.delegate = self
        dosagePicker.dataSource = self
        tabletPicker.delegate = self
        tabletPicker.dataSource = self
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
