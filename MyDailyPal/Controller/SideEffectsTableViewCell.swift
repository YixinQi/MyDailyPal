//
//  SideEffectsTableViewCell.swift
//  MyDailyPal
//
//  Created by mingfei on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class SideEffectsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var roundImg: UIImageView!
    @IBOutlet weak var sideEffectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
