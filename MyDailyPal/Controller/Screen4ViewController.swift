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
    override func viewDidLoad() {
      super.viewDidLoad()
      treatmentPlan = creatArray()
      treatmentTableView.delegate = self
      treatmentTableView.dataSource = self
    }
  
  func creatArray() -> [MyTreatmentPlan] {
    var tempTreatment: [MyTreatmentPlan] = []
    let treatment1 = MyTreatmentPlan(treatmentPlan: "Plan1")
    let treatment2 = MyTreatmentPlan(treatmentPlan: "Plan2")
    let treatment3 = MyTreatmentPlan(treatmentPlan: "Plan3")
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
}
