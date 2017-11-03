//
//  TIpsTableViewCell.swift
//  MyDailyPal
//
//  Created by mingfei on 11/3/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class TIpsTableViewCell: UITableViewCell {
   
  
    @IBOutlet weak var roundImg: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
