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
    
    @IBOutlet weak var drugLabel: UILabel!
    
    @IBOutlet weak var scheduleLabelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
