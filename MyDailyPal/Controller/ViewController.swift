//
//  ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 9/26/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

//This is the initial screen that the user sees the first time they open the app
class ViewController: UIViewController {                                                                                            

    @IBOutlet weak var skipThisStepLabel: UILabel!
    
//Hide the navigation bar on this screen
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//Hide the navigation bar on this screen
    override func viewDidAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }

//This is just the segue to the next screen, additional code can be placed in here if ever neccesary
    @IBAction func setupSecurePinButtonPressed(_ sender: Any) {
        
    }
   
    
//Boilerplate code provided by XCODE
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//If the user decides to forego setting up a PIN, the setting is saved to the device and then they are navigated to the main dashboard
    @IBAction func SkipPressed(_ sender: Any) {
        let preferences = Preferences(context: PersistenceService.context)
        preferences.pinActivated = false
        PersistenceService.saveContext()
        performSegue(withIdentifier: "SkipThisStepPressed", sender: self)
    }
    
}

