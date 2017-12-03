//
//  sideEffectViewController.swift
//  MyDailyPal
//
//  Created by mingfei on 11/27/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class sideEffectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideEffects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideEffectCell", for: indexPath) as! SideEffectsTableViewCell
        cell.sideEffectLabel.text = sideEffects[indexPath.row]
        cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
        cell.roundImg.clipsToBounds = true
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "Screen13ViewController") as! Screen13ViewController
        DetailVC.getText = sideEffects[indexPath.row] as! String
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to delete this side effect?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
                self.sideEffects.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alertController.addAction(deleteAction)
            
            let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
            //PersistenceService.context.delete(self.treatmentPlan[indexPath.row])
            PersistenceService.saveContext()
        }
    }
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    var showMenu = false
    var sideEffects = [String]()
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
    var adherence: AdherenceRecord?
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"AdherenceRecord")
        request.returnsObjectsAsFaults = false
        let fetchRequest: NSFetchRequest<AdherenceRecord> = AdherenceRecord.fetchRequest()
        do {
            let adherenceRecords = try PersistenceService.context.fetch(fetchRequest)
            if adherenceRecords.count <= 0 {
                print("No data loaded")
                
            } else {
                self.adherence = adherenceRecords[adherenceRecords.count-1]
                var title = "unassigned"
                self.sideEffects.append("For test1")
                self.sideEffects.append("For test2")
                // for testing
                for record in adherenceRecords{
                    sideEffects.append(record.treatmentName!)
                }
                // for adding data
                for record in adherenceRecords{
                    var sideEffectArray = record.sideEffects
                    for effect in sideEffectArray!{
                        sideEffects.append(effect.effectName!)
                    }
                }
            }
        } catch {
            print("ERRORR!")
            
        }

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
