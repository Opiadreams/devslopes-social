//
//  RoundBtn.swift
//  devslopes-social
//
//  Created by Willie Fatimehin on 3/5/17.
//  Copyright © 2017 Opia. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    // use for shadows
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        //how much shadow expands out(blurs out)
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //scale programatically
        imageView?.contentMode = .scaleAspectFit
        //layer.cornerRadius = 5.0(works for slightly cornered but not perfecty round)
    }
    
    //To make completly round
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
}
