//
//  RoundButton.swift
//  MyDailyPal
//
//  Created by mingfei on 11/3/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.blue{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    

}
