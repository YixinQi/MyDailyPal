//
//  Screen12TableViewCell.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 12/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class Screen12TableViewCell: UITableViewCell {
    
    @IBOutlet weak var sideEffectsButton: UIButton!
    @IBOutlet weak var drugScheduledTime: UILabel!
    @IBOutlet weak var DrugName: UILabel!
    @IBOutlet weak var roundImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
