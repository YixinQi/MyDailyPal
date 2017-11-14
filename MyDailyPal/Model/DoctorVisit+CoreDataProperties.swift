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


extension DoctorVisit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoctorVisit> {
        return NSFetchRequest<DoctorVisit>(entityName: "DoctorVisit")
    }

    @NSManaged public var title: String?
    @NSManaged public var doctor: String?
    @NSManaged public var dateTime: NSDate?
    @NSManaged public var remindMe: Bool

}
