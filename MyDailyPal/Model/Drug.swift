//
//  Drug.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 11/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class Drug {
    var name : String
    var dosageInformation : String
    var foodRestrictions : String
    var commonSideEffects : String
    var uncommonSideEffects : String
    var precautions : String
    var drugInteractions : String
    var pregnancyCategory : String
    
    init(name: String, dosageInformation: String, foodRestrictions : String,commonSideEffects : String, uncommonSideEffects : String, precautions : String, drugInteractions : String, pregnancyCategory : String) {
        self.name = name
        self.dosageInformation = dosageInformation
        self.foodRestrictions = foodRestrictions
        self.commonSideEffects = commonSideEffects
        self.uncommonSideEffects = uncommonSideEffects
        self.precautions = precautions
        self.drugInteractions = drugInteractions
        self.pregnancyCategory = pregnancyCategory
    }
}
