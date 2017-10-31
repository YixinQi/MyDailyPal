//
//  Preferences+CoreDataProperties.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/30/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//
//

import Foundation
import CoreData


extension Preferences {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Preferences> {
        return NSFetchRequest<Preferences>(entityName: "Preferences")
    }

    @NSManaged public var pin: String?
    @NSManaged public var question1: String?
    @NSManaged public var question2: String?
    @NSManaged public var answer1: String?
    @NSManaged public var answer2: String?
    @NSManaged public var pinActivated: Bool

}
