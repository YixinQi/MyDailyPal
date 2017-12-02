//
//  Screen4ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/6/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class Screen4ViewController: UIViewController {
  var treatmentPlan = [TreatmentPlan]()
  @IBOutlet weak var treatmentTableView: UITableView!
  @IBOutlet weak var MyTreatmentProcess: UIImageView!
  @IBOutlet weak var line: UIImageView!
  @IBOutlet weak var plusButton: UIImageView!
  @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    var showMenu = false
    @IBAction func menuButton(_ sender: Any) {
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
    override func viewDidLoad() {
      let fetchRequest: NSFetchRequest<TreatmentPlan> = TreatmentPlan.fetchRequest()
      do {
        let visits = try PersistenceService.context.fetch(fetchRequest)
        self.treatmentPlan = visits
        self.treatmentTableView.reloadData()
      } catch {}
      MyTreatmentProcess.image = UIImage(named: "1")
      line.image = UIImage(named: "line")
      plusButton.image = UIImage(named: "plusButton")
      let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureRecognizer:)))
      plusButton.addGestureRecognizer(tap)
      plusButton.isUserInteractionEnabled = true
      super.viewDidLoad()
      treatmentTableView.delegate = self
      treatmentTableView.dataSource = self
    }
  
  @objc func tap(gestureRecognizer: UITapGestureRecognizer){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "Screen8")
    self.present(vc, animated: true, completion: nil)
  }
}

extension Screen4ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return treatmentPlan.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TreatmentCell") as! MyTreatmentPlanTableViewCell
    cell.MyTreatmentPlan.text = treatmentPlan[indexPath.row].medication
    cell.Description.text = treatmentPlan[indexPath.row].medication
    cell.Icon.image = UIImage(named: "1")
    return cell
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
      
      let deleteAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
        self.treatmentPlan.remove(at: indexPath.row)
        self.treatmentTableView.reloadData()
      })
      alertController.addAction(deleteAction)
      
      let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
      alertController.addAction(cancelAction)
      
      present(alertController, animated: true, completion: nil)
      PersistenceService.context.delete(self.treatmentPlan[indexPath.row])
      PersistenceService.saveContext()
    }
  }
  
  

}
