//
//  DrugsTableViewCell.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 10/9/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class DrugsTableViewCell: UITableViewCell {
    //MARK: Properties
    /*
     drugScheduler is a circular image view that changes color to blue or grey depending on whether they are schduled or not
     */
    @IBOutlet weak var drugScheduler: UIImageView!
    
    @IBOutlet weak var drugLabel: UILabel!
    
    @IBOutlet weak var scheduleImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        drugScheduler.layer.cornerRadius = drugScheduler.frame.size.width/2
        drugScheduler.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
