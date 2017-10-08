//
//  ViewController.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 9/26/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {                                                                                            

    @IBOutlet weak var skipThisStepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)// Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func setupSecurePinButtonPressed(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

