//
//  MyTreatmentPlanTableViewCell.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/6/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class MyTreatmentPlanTableViewCell: UITableViewCell {

  @IBOutlet weak var MyTreatmentPlan: UILabel!
  
  func setTreatment(treatmentplan: MyTreatmentPlan) {
    MyTreatmentPlan.text = treatmentplan.treatmentPlan
  }
}
