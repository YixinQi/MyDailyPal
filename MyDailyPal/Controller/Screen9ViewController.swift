//
//  Screen9ViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 11/13/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import WebKit
class Screen9ViewController: UIViewController {

  
    @IBOutlet weak var DrugWebView: WKWebView!
    @IBOutlet weak var SetupNewTreatmentLabel: UILabel!
    @IBOutlet weak var staticImageView: UIImageView!
    var drugDetails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
