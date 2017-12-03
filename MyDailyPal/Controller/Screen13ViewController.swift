//
//  Screen13ViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen13ViewController: UIViewController {
    var adherenceRecord = AdherenceRecord()
    @IBOutlet weak var sideEffects: UITextView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var treatmentName: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        treatmentName.text = adherenceRecord.treatmentName;
        let formatter = DateFormatter()
        date.text = formatter.string(from: adherenceRecord.date! as Date)
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
