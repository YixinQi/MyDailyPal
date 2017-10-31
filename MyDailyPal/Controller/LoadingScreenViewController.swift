//
//  LoadingScreenViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 10/30/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class LoadingScreenViewController: UIViewController {

    var preferences: Preferences?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest: NSFetchRequest<Preferences> = Preferences.fetchRequest()
        
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToEnterPINPage" {
            let enterPINVC = segue.destination as! EnterPINViewController
            
            enterPINVC.preferences = preferences!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
