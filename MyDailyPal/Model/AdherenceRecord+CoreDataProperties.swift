//
//  AdherenceRecord+CoreDataProperties.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 12/4/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
//

import Foundation
import CoreData


extension AdherenceRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AdherenceRecord> {
        return NSFetchRequest<AdherenceRecord>(entityName: "AdherenceRecord")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var didTake: Bool
    @NSManaged public var treatmentName: String?
    @NSManaged public var sideEffects: SideEffect?

}
