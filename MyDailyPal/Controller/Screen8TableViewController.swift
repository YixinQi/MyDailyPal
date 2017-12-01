//
//  Screen8TableViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 10/9/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen8TableViewController: UITableViewController {
    
    
    var drugBank = DrugBank()
    var drugs = [[String]]()
    var drug = [String]()
    //var sImage = UIImage(named: "timer")
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(addTapped))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        drugs = drugBank.drugList
        return drugs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DrugsTableViewCell", for: indexPath) as? DrugsTableViewCell else {
            fatalError("The dequed cell is not an instance of DrugsTableViewCell")
        }

        // Configure the cell...
        let drug = drugs[indexPath.row]
        if drug[0] != "mystyle.css" {
            cell.drugLabel.text = substringString(string: drug[0])
            cell.drugLabelMini.text = substringString(string: drug[0])
            //cell.scheduleImage.image = sImage
            cell.ToScreen10ScheduleButton.tag = indexPath.row
            cell.ToScreen10ScheduleButton.addTarget(self, action: #selector(toScreen10(sender: )), for: UIControlEvents.touchUpInside)
            cell.drugScheduler.backgroundColor = UIColor.lightGray
        }
        return cell
    }
    func substringString(string: String) -> String {
        let index = string.index(of: ".") ?? string.endIndex
        let beginning = string[..<index]
        return String(beginning)
    }
    var drugName = String()
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "Screen9ViewController") as! Screen9ViewController
        let drug = drugs[indexPath.row]
        DetailVC.drugDetails = drug
        self.navigationController?.pushViewController(DetailVC, animated: true)
        
    }
    @objc func toScreen10(sender: UIButton){
        //print("in screen 8 toScreen10")
        let drugDet = self.drugs[sender.tag]
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "Screen10ViewController") as! Screen10ViewController
        myVC.drugName = substringString(string: drugDet[0])
        navigationController?.pushViewController(myVC, animated: true)
    }
    // to navigate to screen 4
    @objc func addTapped(sender:UIBarButtonItem){
        //print("in screen 9 toScreen10")
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "Screen4ViewController") as! Screen4ViewController
        navigationController?.pushViewController(myVC, animated: true)
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

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      var myTreatmentViewControler = segue.destination as! Screen10ViewController
//      myTreatmentViewControler.treatmentPlan.medication = drugs[indexPath.row].text
//    }
 

}
