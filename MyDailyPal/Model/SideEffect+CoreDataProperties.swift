//
//  SideEffect+CoreDataProperties.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 12/4/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
//

import Foundation
import CoreData


extension SideEffect {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SideEffect> {
        return NSFetchRequest<SideEffect>(entityName: "SideEffect")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var effectName: String?
    @NSManaged public var treatmentName: String?
    @NSManaged public var occurence: AdherenceRecord?

}
