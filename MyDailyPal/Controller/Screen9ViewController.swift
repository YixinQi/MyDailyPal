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
    var drugName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        drugName = drugDetails[0]
        let MedicineName = drugDetails[0].uppercased()
        let index = MedicineName.index(of: ".") ?? MedicineName.endIndex
        let beginning = MedicineName[..<index]
        let htmlPath = Bundle.main.path(forResource: String(beginning), ofType: "html", inDirectory:"assets")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        DrugWebView.load(request)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(addTapped))
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func addTapped(sender:UIBarButtonItem){
        //print("in screen 9 toScreen10")
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "Screen10ViewController") as! Screen10ViewController
        myVC.drugName = drugDetails[0]
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
