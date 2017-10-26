//
//  MenuViewController.swift
//  MyDailyPal
//
//  Created by mingfei on 10/9/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var trainingConstraint: NSLayoutConstraint!
    var showMenu = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func openMenu(_ sender: Any) {
        if(showMenu){
            trainingConstraint.constant = 375
            UIView.animate(withDuration: 0.3,
               animations: {
                self.view.layoutIfNeeded()
            })
        }else{
            trainingConstraint.constant = 25
            UIView.animate(withDuration: 0.3,
               animations: {
                self.view.layoutIfNeeded()
            })
        }
       showMenu = !showMenu
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
