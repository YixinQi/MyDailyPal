//
//  Screen12TableViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class Screen12TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var adherenceRecords = [AdherenceRecord]()
    var dateSelected: NSDate = NSDate()
    var record = [AdherenceRecord]()
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var onTrack: UILabel!
    @IBOutlet weak var roundImg: UIImageView!
    @IBOutlet weak var adherenceRecordsTableVIew: UITableView!
    var adherenceReport: Bool = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        //dateFormatter.timeStyle = DateFormatter.Style.short
//        let dateAsText = dateFormatter.string(from: self.dateSelected as Date)
//        date.text = "My Medication History for \(dateAsText)"
//
//        let adherenceRecordFetchRequest: NSFetchRequest<AdherenceRecord> = AdherenceRecord.fetchRequest()
//        do {
//            let adherence = try PersistenceService.context.fetch(adherenceRecordFetchRequest)
//            self.adherenceRecords = adherence
//            // print("Number of adh   ",adherenceRecords.count)
//
//        } catch {}
//        if (adherenceRecords.count > 0){
//
//            for adhRecord in adherenceRecords{
//                if Calendar.current.compare(adhRecord.date! as Date, to:dateSelected as Date , toGranularity: .day) == .orderedSame
//                {
//                    //print("dates checked fine")
//                    self.record.append(adhRecord)
//                }
//            }
//        }
//        for rec in self.record{
//            if rec.didTake == false {
//                self.adherenceReport = false
//            }
//        }
//
//        roundImg.layer.cornerRadius = roundImg.frame.size.width/2
//        roundImg.clipsToBounds = true
//
//        if self.adherenceReport == true {
//            self.onTrack.text = "On Track"
//            self.roundImg.backgroundColor = UIColor.green
//        } else {
//            self.onTrack.text = "Missed"
//            self.roundImg.backgroundColor = UIColor.red
//        }
        self.adherenceRecordsTableVIew.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("The date that is being passed is: \(dateSelected)")
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        //dateFormatter.timeStyle = DateFormatter.Style.short
        let dateAsText = dateFormatter.string(from: self.dateSelected as Date)
        date.text = "My Medication History for \(dateAsText)"

        let adherenceRecordFetchRequest: NSFetchRequest<AdherenceRecord> = AdherenceRecord.fetchRequest()
        do {
            let adherence = try PersistenceService.context.fetch(adherenceRecordFetchRequest)
            self.adherenceRecords = adherence
           // print("Number of adh   ",adherenceRecords.count)
            
        } catch {}
        if (adherenceRecords.count > 0){
            
            for adhRecord in adherenceRecords{
                if Calendar.current.compare(adhRecord.date! as Date, to:dateSelected as Date , toGranularity: .day) == .orderedSame
                {
                    //print("dates checked fine")
                    self.record.append(adhRecord)
                }
            }
        }
        for rec in self.record{
            if rec.didTake == false {
                self.adherenceReport = false
            }
        }
        
        roundImg.layer.cornerRadius = roundImg.frame.size.width/2
        roundImg.clipsToBounds = true
        
        if self.adherenceReport == true {
            self.onTrack.text = "On Track"
            self.roundImg.backgroundColor = UIColor.green
        } else {
            self.onTrack.text = "Missed"
            self.roundImg.backgroundColor = UIColor.red
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        adherenceRecordsTableVIew.delegate = self
        adherenceRecordsTableVIew.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print("Number of records ",record.count)
        return record.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("in table cell creation")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Screen12TableViewCell", for: indexPath)
            as? Screen12TableViewCell else {
                fatalError("The dequed cell is not an instance of Screen12TableViewController")
        }
        
        // Configure the cell...
        let adherenceRecord = record[indexPath.row]
        cell.DrugName.text = adherenceRecord.treatmentName;
        var sideEffectButtonimage: UIImage?
        if adherenceRecord.sideEffects != nil {
            sideEffectButtonimage = UIImage(named: "ic_add_side_effect_red") as UIImage?
            cell.sideEffectsButton.setImage(sideEffectButtonimage, for: .normal)
        } else {
            sideEffectButtonimage = UIImage(named: "ic_add_side_effect_gray") as UIImage?
            cell.sideEffectsButton.setImage(sideEffectButtonimage, for: .normal)
        }
        
        let dateFormatter = DateFormatter()
        //dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let takenTimeAsText = dateFormatter.string(from: adherenceRecord.date! as Date)
        
        if adherenceRecord.didTake == true {
            cell.drugScheduledTime.text = "Taken at \(takenTimeAsText)"
            cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
            cell.roundImg.clipsToBounds = true
            cell.roundImg.backgroundColor = UIColor.green
        }else {
            cell.drugScheduledTime.text = "Missed dose at \(takenTimeAsText)"
            cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
            cell.roundImg.clipsToBounds = true
            cell.roundImg.backgroundColor = UIColor.red
        }
        cell.sideEffectsButton.tag = indexPath.row
        cell.sideEffectsButton.addTarget(self, action: #selector(AlertWindow(sender: )), for: UIControlEvents.touchUpInside)
        //print("reached here")
        return cell
    }
    

    
    @objc func AlertWindow(sender: UIButton){
        let alert = UIAlertController(title: "", message: "This facility is to record side effects on your phone for your doctor", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            let adherenceRecord = self.record[sender.tag]
            let storyboard = UIStoryboard(name:"Main", bundle:nil)
            let myVC = storyboard.instantiateViewController(withIdentifier: "Screen13ViewController") as! Screen13ViewController
            myVC.adherenceRecord = adherenceRecord
            if (adherenceRecord.sideEffects != nil){
                myVC.sideEffect = adherenceRecord.sideEffects
            } else {
                myVC.sideEffect = nil
            }
            self.navigationController?.pushViewController(myVC, animated: true)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
