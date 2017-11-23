//
//  Screen11ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/21/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

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
  func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    let mycell = cell as! CalendarCell
    mycell.dateLabel.text = cellState.text
  }
  
  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
    formatter.dateFormat = "yyyy MM dd"
    formatter.timeZone = Calendar.current.timeZone
    formatter.locale = Calendar.current.locale
    let startDate = formatter.date(from: "2017 01 01")!
    let endDate = formatter.date(from: "2116 12 31")!
    let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
    return parameters
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let mycell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
    mycell.dateLabel.text = cellState.text
    return mycell
  }
}
