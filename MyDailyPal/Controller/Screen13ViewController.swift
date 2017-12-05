//
//  Screen13ViewController.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class Screen13ViewController: UIViewController {
    
    
    var adherenceRecord: AdherenceRecord?
    var sideEffect: SideEffect?
    var getText = String()
    

    @IBOutlet weak var sideEffectDetails: UITextView!
    @IBOutlet weak var sideEffectName: UITextField!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var treatmentName: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideEffectDetails.layer.borderWidth = 1.0
        
        if sideEffect != nil{
            sideEffectName.text = sideEffect?.effectName
            sideEffectDetails.text = sideEffect?.details
        }else{
            print("In else")
            treatmentName.text = adherenceRecord!.treatmentName;
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            let dateAsText = dateFormatter.string(from: adherenceRecord!.date! as Date)
            date.text = dateAsText
        }
        

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(saveTapped))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func saveTapped(sender: UIBarButtonItem){
        //print("in screen 9 toScreen10")
        print("Starting Save Method")
        if (sideEffect != nil){
            
        }else {
            sideEffect = SideEffect(context: PersistenceService.context)
            sideEffect!.treatmentName = adherenceRecord!.treatmentName
            sideEffect!.date = adherenceRecord!.date
            sideEffect!.occurence = adherenceRecord
            adherenceRecord!.sideEffects = sideEffect
        }

        sideEffect!.effectName = sideEffectName.text
        sideEffect!.details = sideEffectDetails.text

        PersistenceService.saveContext()
        print("working till here")
        self.navigationController?.popViewController(animated: true)
//        let storyboard = UIStoryboard(name:"Main", bundle:nil)
//        let myVC = storyboard.instantiateViewController(withIdentifier: "Screen12TableViewController") as! Screen12TableViewController
//        self.navigationController?.pushViewController(myVC, animated: true)
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
