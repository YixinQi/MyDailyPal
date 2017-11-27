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

//Table that will hold the visits
    @IBOutlet weak var visitsTableView: UITableView!
    
    @IBOutlet weak var trailingConstraints: NSLayoutConstraint!
    var showMenu = false
    
    @IBAction func menuButtonAction(_ sender: Any) {
        if(showMenu){
            trailingConstraints.constant = 375
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }else{
            trailingConstraints.constant = 25
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
        showMenu = !showMenu
    }
    //Data Structure that holds the actual data for the table
    var visits = [DoctorVisit]()
    
//Used to determine if we are adding a new visit or editing an existing one
    var passData : Bool = false
    var visitToEdit : DoctorVisit?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//Loads visits from the devices local storage
        let fetchRequest: NSFetchRequest<DoctorVisit> = DoctorVisit.fetchRequest()
        do {
            let visits = try PersistenceService.context.fetch(fetchRequest)
            self.visits = visits
            self.visitsTableView.reloadData()
        } catch {}
        
        visitsTableView.delegate = self
        visitsTableView.dataSource = self

    }

//Used to comform as a subclass of TableView
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visits.count
    }
 
//Used to comform as a subclass of TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
//Used to comform as a subclass of TableView - Sets each cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//References the code class for each cell
        let cell = visitsTableView.dequeueReusableCell(withIdentifier: "visitCell") as! VisitsTableViewCell
//Creates the grey circle
        cell.circleView.layer.cornerRadius = cell.circleView.frame.size.width/2
        cell.circleView.clipsToBounds = true
        cell.circleView.backgroundColor = UIColor.gray
//Sets cell details
        cell.visitTitle.text = visits[indexPath.row].title
        cell.visitSubTitle.text = visits[indexPath.row].doctor
//Tags that are used to edit and remove rows from data
        cell.deleteButton.tag = indexPath.row
        cell.editButton.tag = indexPath.row

//Add the functionality to the buttons
        cell.deleteButton.addTarget(self, action: #selector(myDeleteMethod(sender:)), for: UIControlEvents.touchUpInside)
        cell.editButton.addTarget(self, action: #selector(myEditMethod(sender:)), for: UIControlEvents.touchUpInside)

        return cell
    }
   
//Method to delete a row
    @objc func myDeleteMethod(sender: UIButton!){
//Prompts user to confirm their choice
        let dialogMessage = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
//If user says "yes" then it deletes it from the devices local storage and reloads the table
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            PersistenceService.context.delete(self.visits[sender.tag])
            PersistenceService.saveContext()
            self.visits.remove(at: sender.tag)
            self.visitsTableView.reloadData()
        })
//Nothing happens if user hits no
        let no = UIAlertAction(title: "No", style: .cancel) { (action) -> Void in
            print("not confirmed")
        }
        
        dialogMessage.addAction(yes)
        dialogMessage.addAction(no)
        
        self.present(dialogMessage, animated: true, completion: nil)
        

    }
    
//Method to edit a visit
    @objc func myEditMethod(sender: UIButton!){
        print("Here it is to edit!")
        print(sender.tag)
        visitToEdit = visits[sender.tag]
        performSegue(withIdentifier: "toVisitDetails", sender: nil)
        
    }
    
//when they click to add a new visit, it removes any object that would've been passed as edittable and then navigates to details screen
    @IBAction func addNewVisitButtonPressed(_ sender: Any) {
        visitToEdit = nil
        performSegue(withIdentifier: "toVisitDetails", sender: nil)
    }
  
//This is used to differentiate between editing or adding a new visit
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
