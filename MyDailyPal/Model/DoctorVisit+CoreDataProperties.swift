//
//  DoctorVisit+CoreDataProperties.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/14/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
//

import Foundation
import CoreData

//This is created as an NSManaged Object and required to save and load data using CoreData functionality
//Data structure to hold visit information
extension DoctorVisit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoctorVisit> {
        return NSFetchRequest<DoctorVisit>(entityName: "DoctorVisit")
    }

    @NSManaged public var title: String?
    @NSManaged public var doctor: String?
    @NSManaged public var dateTime: NSDate?
    @NSManaged public var remindMe: Bool

}
