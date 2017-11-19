//
//  LoadingScreenViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/30/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData
//This is a screen that the user will never see, it holds the logic to determine the first screen that the user will see
class LoadingScreenViewController: UIViewController {

//Will hold previous preferences set by the user (PIN, skip PIN, security questions, etc.)
    var preferences: Preferences?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//Load data from the device locally
        let fetchRequest: NSFetchRequest<Preferences> = Preferences.fetchRequest()
        
//Check if a PIN has been set up previously or if it is first time opening app or if user opted out of security question
        do {
            let preferences = try PersistenceService.context.fetch(fetchRequest)
            if preferences.count <= 0 {
                print("No data loaded")
                DispatchQueue.main.async(execute:  {
                    self.performSegue(withIdentifier: "SegueToFirstTimeOpeningApp", sender: nil)
                })
                
            } else {
                self.preferences = preferences[preferences.count-1]
                
                if self.preferences!.pinActivated == true {
                    print("Here is their PIN: " + self.preferences!.pin!)
                    DispatchQueue.main.async(execute:  {
                        self.performSegue(withIdentifier: "SegueToEnterPINPage", sender: nil)
                    })
                } else {
                    DispatchQueue.main.async(execute:  {
                        self.performSegue(withIdentifier: "NoPINToMainScreen", sender: nil)
                    })
                }
                //performSegue(withIdentifier: "SegueToEnterPin", sender: self)
            }
        } catch {
            print("ERRORR!")
            
        }
        // Do any additional setup after loading the view.
    }

//Xcode BoilerPlate
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Send preferences data to enter PIN page for validation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToEnterPINPage" {
            let enterPINVC = segue.destination as! EnterPINViewController
            
            enterPINVC.preferences = preferences!
        }
    }
    

}
