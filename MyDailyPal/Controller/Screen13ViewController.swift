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
    var getText = String()
    
    @IBOutlet weak var effectName: UITextField!
    
    @IBOutlet weak var sideEffects: UITextView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var treatmentName: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if !getText.isEmpty{
            treatmentName.text = getText
        }else{
            treatmentName.text = adherenceRecord.treatmentName;
            let formatter = DateFormatter()
            date.text = formatter.string(from: adherenceRecord.date! as Date)
        }
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(saveTapped))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func saveTapped(sender:UIBarButtonItem){
        //print("in screen 9 toScreen10")
        let sEffects = SideEffect()
        sEffects.treatmentName = adherenceRecord.treatmentName
        sEffects.date = adherenceRecord.date
        sEffects.effectName = effectName.text
        sEffects.details = sideEffects.text
        sEffects.adherenceRecord = adherenceRecord
        adherenceRecord.sideEffects?.append(sEffects)
        PersistenceService.saveContext()
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "Screen12TableViewController") as! Screen12TableViewController
        navigationController?.pushViewController(myVC, animated: true)
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
