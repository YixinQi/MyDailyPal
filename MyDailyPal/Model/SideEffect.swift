//
//  SideEffect.swift
//  MyDailyPal
//
//  Created by mingfei on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation
import CoreData

public class SideEffect: NSManagedObject{
    @NSManaged var treatmentName: String?
    @NSManaged var effectName: String?
    @NSManaged var details: String?
    @NSManaged var date: NSDate?
    @NSManaged var adherenceRecord: AdherenceRecord?
}
