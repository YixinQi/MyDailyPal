//
//  VisitsViewController.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/13/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData

class VisitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var visitsTableView: UITableView!
    var visits = [DoctorVisit]()
    var passData : Bool = false
    var visitToEdit : DoctorVisit?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fetchRequest: NSFetchRequest<DoctorVisit> = DoctorVisit.fetchRequest()
        do {
            let visits = try PersistenceService.context.fetch(fetchRequest)
            self.visits = visits
            self.visitsTableView.reloadData()
        } catch {}
        
        visitsTableView.delegate = self
        visitsTableView.dataSource = self


        // Do any additional setup after loading the view.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visits.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = visitsTableView.dequeueReusableCell(withIdentifier: "visitCell") as! VisitsTableViewCell
        cell.circleView.layer.cornerRadius = cell.circleView.frame.size.width/2
        cell.circleView.clipsToBounds = true
        cell.circleView.backgroundColor = UIColor.gray
        cell.visitTitle.text = visits[indexPath.row].title
        cell.visitSubTitle.text = visits[indexPath.row].doctor
        cell.deleteButton.tag = indexPath.row
        cell.editButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(myDeleteMethod(sender:)), for: UIControlEvents.touchUpInside)
        cell.editButton.addTarget(self, action: #selector(myEditMethod(sender:)), for: UIControlEvents.touchUpInside)

        return cell
    }
   
    
    @objc func myDeleteMethod(sender: UIButton!){
        let dialogMessage = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            PersistenceService.context.delete(self.visits[sender.tag])
            PersistenceService.saveContext()
            self.visits.remove(at: sender.tag)
            self.visitsTableView.reloadData()
        })
        
        let no = UIAlertAction(title: "No", style: .cancel) { (action) -> Void in
            print("not confirmed")
        }
        
        dialogMessage.addAction(yes)
        dialogMessage.addAction(no)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
//        print("Here it is to delete!")
//        print(sender.tag)
//        PersistenceService.context.delete(visits[sender.tag])
//        PersistenceService.saveContext()
//        visits.remove(at: sender.tag)
//        visitsTableView.reloadData()

    }
    
    @objc func myEditMethod(sender: UIButton!){
        print("Here it is to edit!")
        print(sender.tag)
        visitToEdit = visits[sender.tag]
        performSegue(withIdentifier: "toVisitDetails", sender: nil)
        
    }
    

    @IBAction func addNewVisitButtonPressed(_ sender: Any) {
        visitToEdit = nil
        performSegue(withIdentifier: "toVisitDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if visitToEdit != nil {
            let visitDetails = segue.destination as! VisitDetailsViewController
            
            visitDetails.currentVisit = visitToEdit!
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
