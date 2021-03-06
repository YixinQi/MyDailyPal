//
//  VisitsTableViewCell.swift
//  MyDailyPal
//
//  Created by Paul Verardi on 11/13/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class VisitsTableViewCell: UITableViewCell {

//Holds the elements of each cell in the Visits Table
    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var visitTitle: UILabel!
    @IBOutlet weak var visitSubTitle: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
 
//Xcode BoilerPlate
    override func awakeFromNib() {
        super.awakeFromNib()
        //deleteButton.addTarget(self, action: "myButtonMethod", for: .touchUpInside)
        // Initialization code
    }

//Xcode BoilerPlate
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
