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
  @IBOutlet weak var calendarView: JTAppleCalendarView!
  @IBOutlet weak var Year: UILabel!
  @IBOutlet weak var Month: UILabel!
  //let formatter = DateFormatter()
  override func viewDidLoad() {
    super.viewDidLoad()
    calendarView.calendarDataSource = self
    calendarView.calendarDelegate = self
    self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
      self.setupViewsOfCalendar(from: visibleDates)
    }
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
    let date = calendarView.visibleDates().monthDates.first!.date
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy"
    Year.text = formatter.string(from: date)
   
    formatter.dateFormat = "MMMM"
    Month.text = formatter.string(from: date)
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
  
//  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//    formatter.dateFormat = "yyyy MM dd"
//    formatter.timeZone = Calendar.current.timeZone
//    formatter.locale = Calendar.current.locale
//    let startDate = formatter.date(from: "2017 01 01")!
//    let endDate = formatter.date(from: "2017 12 31")!
//    let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
//    return parameters
//  }
  
  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy MM dd"
    
    let startDate = formatter.date(from: "2016 02 01")! // You can use date generated from a formatter
    let endDate = Date()                                // You can also use dates created from this function
    let parameters = ConfigurationParameters(startDate: startDate,
                                             endDate: endDate,
                                             numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
      calendar: Calendar.current,
      generateInDates: .forAllMonths,
      generateOutDates: .tillEndOfGrid,
      firstDayOfWeek: .sunday)
    return parameters
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
    cell.dateLabel.text = cellState.text
    if cellState.dateBelongsTo == .thisMonth {
      cell.dateLabel.textColor = UIColor.black
    } else {
      cell.dateLabel.textColor = UIColor.white
    }
    if cellState.isSelected {
      
    }
    return cell
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
    self.setupViewsOfCalendar(from: visibleDates)
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    //performSegue(withIdentifier: "tomytreatment", sender: self)
  }
}
