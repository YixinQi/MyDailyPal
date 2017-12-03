//
//  Screen12TableViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen12TableViewController: UITableViewController {
    var adherenceRecords = [AdherenceRecord]()
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var onTrack: UILabel!
    @IBOutlet weak var roundImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = "My Medicine history for "
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return adherenceRecords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Screen12TableViewCell", for: indexPath)
            as? Screen12TableViewCell else {
                fatalError("The dequed cell is not an instance of Screen12TableViewController")
        }
        
        // Configure the cell...
        let adherenceRecord = adherenceRecords[indexPath.row]
        cell.DrugName.text = adherenceRecord.treatmentName;
        if adherenceRecord.didTake == true {
            let formatter = DateFormatter()
            cell.drugScheduledTime.text = "Taken at "+formatter.string(from: adherenceRecord.date as! Date)
            cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
            cell.roundImg.clipsToBounds = true
            cell.roundImg.backgroundColor = UIColor.green
        }else {
            let formatter = DateFormatter()
            cell.drugScheduledTime.text = "Missed dose at "+formatter.string(from: adherenceRecord.date as! Date)
            cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
            cell.roundImg.clipsToBounds = true
            cell.roundImg.backgroundColor = UIColor.red
        }
        cell.sideEffectsButton.tag = indexPath.row
        cell.sideEffectsButton.addTarget(self, action: #selector(AlertWindow(sender: )), for: UIControlEvents.touchUpInside)
        return cell
    }
    @objc func AlertWindow(sender: UIButton){
        let alert = UIAlertController(title: "", message: "This facility is to record side effects on your phone for your doctor", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
//            let adherenceRecord = self.adherenceRecords[sender.tag]
//            let storyboard = UIStoryboard(name:"Main", bundle:nil)
//            let myVC = storyboard.instantiateViewController(withIdentifier: "Screen13ViewController") as! Screen13ViewController
//            myVC.adherenceRecord= adherenceRecord
//            navigationController?.pushViewController(myVC, animated: true)
            
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