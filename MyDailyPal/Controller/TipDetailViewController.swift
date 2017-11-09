//
//  TipDetailViewController.swift
//  MyDailyPal
//
//  Created by mingfei on 11/9/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class TipDetailViewController: UIViewController {
    var getText = String()
    @IBOutlet weak var tipText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipText.text! = getText
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
