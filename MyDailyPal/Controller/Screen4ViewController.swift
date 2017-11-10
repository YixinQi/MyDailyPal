//
//  Screen4ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/6/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen4ViewController: UIViewController {
  var treatmentPlan: [MyTreatmentPlan] = []
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
      MyTreatmentProcess.image = UIImage(named: "1")
      line.image = UIImage(named: "line")
      plusButton.image = UIImage(named: "plusButton")
      let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureRecognizer:)))
      plusButton.addGestureRecognizer(tap)
      plusButton.isUserInteractionEnabled = true
      super.viewDidLoad()
      treatmentPlan = creatArray()
      treatmentTableView.delegate = self
      treatmentTableView.dataSource = self
    }
  
  @objc func tap(gestureRecognizer: UITapGestureRecognizer){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "Screen8")
    self.present(vc, animated: true, completion: nil)
  }
  
  func creatArray() -> [MyTreatmentPlan] {
    var tempTreatment: [MyTreatmentPlan] = []
    let treatment1 = MyTreatmentPlan(iconImage: UIImage(named: "1")!, treatmentPlan: "Lopinavir/ritonavir 100/25mg Tablets")
    let treatment2 = MyTreatmentPlan(iconImage: UIImage(named: "1")!, treatmentPlan: "Tenofovir/Lamivudine/Efavirenz 300/300/600mg Tablets.")
    let treatment3 = MyTreatmentPlan(iconImage: UIImage(named: "1")!, treatmentPlan: "Lamivudine/Nevirapine/Zidovudine 30/50/60mg Dispersible Tablets")
    tempTreatment.append(treatment1)
    tempTreatment.append(treatment2)
    tempTreatment.append(treatment3)
    return tempTreatment
  }
  

}

extension Screen4ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return treatmentPlan.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let treatment = treatmentPlan[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "TreatmentCell") as! MyTreatmentPlanTableViewCell
    cell.setTreatment(treatmentplan: treatment)
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
    }
  }
  
  

}
