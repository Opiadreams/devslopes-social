//
//  CirlceView.swift
//  devslopes-social
//
//  Created by Willie Fatimehin on 3/18/17.
//  Copyright © 2017 Opia. All rights reserved.
//

import UIKit

class CirlceView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
