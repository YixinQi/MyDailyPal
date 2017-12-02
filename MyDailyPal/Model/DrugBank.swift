//
//  DrugBank.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 11/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class DrugBank {
    var drugList = [[String]]()
    var filename = String()
    var medicineName = String()
    
    init() {
        // Create a FileManager instance
        
        let fileManager = FileManager.default
        
        // Get contents in directory: '.' (current one)
        do {
        // tried relative path
            let path = Bundle.main.path(forResource: "assets", ofType: nil)
            let files = try fileManager.contentsOfDirectory(atPath: path!)
            for file in files{
                filename = file
                drugList.append([filename])
            }
            print(drugList)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
   
}
