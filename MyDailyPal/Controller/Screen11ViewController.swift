//
//  Screen11ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/21/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
<<<<<<< HEAD

import UIKit

class Screen11ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

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

=======
import UIKit
import JTAppleCalendar

class Screen11ViewController: UIViewController {
  let formatter = DateFormatter()
  override func viewDidLoad() {
    super.viewDidLoad()
    
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

extension Screen11ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
  
  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
    formatter.dateFormat = "yyyy MM dd"
    formatter.timeZone = Calendar.current.timeZone
    formatter.locale = Calendar.current.locale
    let startDate = formatter.date(from: "2017 01 01")!
    let endDate = formatter.date(from: "2017 12 31")!
    let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
    return parameters
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomeCell", for: indexPath) as! CustomeCell
    cell.dateLabel.text = cellState.text
    return cell
  }
>>>>>>> d38c8f61b971c2c80ef536071f88006804e812a3
}
