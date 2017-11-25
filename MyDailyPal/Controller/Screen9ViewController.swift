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
        let MedicineName = drugDetails[0].uppercased()
        let index = MedicineName.index(of: ".") ?? MedicineName.endIndex
        let beginning = MedicineName[..<index]
        let htmlPath = Bundle.main.path(forResource: "/assets/"+beginning, ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        DrugWebView.load(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Screen10NextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "Screen10ViewController") as! Screen10ViewController
        //DetailVC.Medication = drugName
        self.navigationController?.pushViewController(DetailVC, animated: true)
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
