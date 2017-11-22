//
//  MyTreatmentPlan.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/6/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation
import UIKit

class MyTreatmentPlan {
  var treatmentPlan: String
  var attribute: String
  var icon: UIImage

  init(iconImage: UIImage, treatmentPlan: String, descriptionText: String) {
    self.attribute = descriptionText
    self.treatmentPlan = treatmentPlan
    self.icon = iconImage
  }

}
