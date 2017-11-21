//
//  TreatmentPlan+CoreDataProperties.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 11/20/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
//

import Foundation
import CoreData


extension TreatmentPlan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TreatmentPlan> {
        return NSFetchRequest<TreatmentPlan>(entityName: "TreatmentPlan")
    }

    @NSManaged public var medication: String?
    @NSManaged public var noOfDosage: Int16
    @NSManaged public var noOfTablet: Int16
    @NSManaged public var startDate: NSDate?
    @NSManaged public var repeate: String?

}
