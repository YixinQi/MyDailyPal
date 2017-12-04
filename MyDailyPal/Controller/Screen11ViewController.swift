//
//  Screen11ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/21/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
import UIKit
import JTAppleCalendar
import CoreData

class Screen11ViewController: UIViewController {
  var adherenceRecords = [AdherenceRecord]()
  var visitRecords = [DoctorVisit]()
  @IBOutlet weak var calendarView: JTAppleCalendarView!
  @IBOutlet weak var Year: UILabel!
  @IBOutlet weak var Month: UILabel!
    
  @IBOutlet weak var trailingContraint: NSLayoutConstraint!
  var showMenu = false
    @IBAction func showMenu(_ sender: Any) {
        if(showMenu){
            trailingContraint.constant = 375
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }else{
            trailingContraint.constant = 25
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
        showMenu = !showMenu
    }
    var selectedDate = Date();
  //let formatter = DateFormatter()
  override func viewDidLoad() {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName:"AdherenceRecord")
    request.returnsObjectsAsFaults = false
    let adherenceRecordFetchRequest: NSFetchRequest<AdherenceRecord> = AdherenceRecord.fetchRequest()
    do {
      let adherence = try PersistenceService.context.fetch(adherenceRecordFetchRequest)
      self.adherenceRecords = adherence
      
    } catch {}
    let visitRecordFetchRequest: NSFetchRequest<DoctorVisit> = DoctorVisit.fetchRequest()
    do {
      let visits = try PersistenceService.context.fetch(visitRecordFetchRequest)
      self.visitRecords = visits
    } catch {}
    calendarView.scrollToDate(Date())
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

  func checkAdherence(date: Date) -> Int {
    for record in adherenceRecords {
      if Calendar.current.compare(record.date! as Date, to: date, toGranularity: .day) == .orderedSame {
        print("found")
        if record.didTake  {
          return 1
        } else {
          return 2
        }
      }
    }
    return 3
  }
  
  func checkVisit(date: Date) -> Bool {
    for record in visitRecords {
      if Calendar.current.compare(record.dateTime! as Date, to: date, toGranularity: .day) == .orderedSame {
        return true
      }
    }
    return false
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
    cell.dateLabel.text = cellState.text
    if cellState.dateBelongsTo == .thisMonth {
      cell.dateLabel.textColor = UIColor.black
    }
    if checkAdherence(date: date) == 1 {
      cell.dateLabel.textColor = UIColor.green
    }
    if checkAdherence(date: date) == 2{
      cell.dateLabel.textColor = UIColor.red
    }
    if cellState.dateBelongsTo != .thisMonth {
      cell.dateLabel.textColor = UIColor.white
    }
    if checkVisit(date: date) {
      cell.backgroundColor = UIColor(red: 66/255.0, green: 209/255.0, blue: 244/255.0, alpha: 1.0)
    }
    if cellState.isSelected {
      
    }
    return cell
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
    self.setupViewsOfCalendar(from: visibleDates)
  }
  
  func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    let storyboard = UIStoryboard(name:"Main", bundle:nil)
    let myVC = storyboard.instantiateViewController(withIdentifier: "Screen12TableViewController") as! Screen12TableViewController
    //navigationController?.pushViewController(myVC, animated: true)
    selectedDate = cellState.date
    myVC.selectedDate = selectedDate
    performSegue(withIdentifier: "Screen12TableViewController", sender: self)
  }
}
