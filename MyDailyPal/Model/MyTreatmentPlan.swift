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
  var icon: UIImage

  init(iconImage: UIImage, treatmentPlan: String) {
    self.treatmentPlan = treatmentPlan
    self.icon = iconImage
  }

}
