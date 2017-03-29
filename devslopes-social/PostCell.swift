//
//  PostCell.swift
//  devslopes-social
//
//  Created by Willie Fatimehin on 3/20/17.
//  Copyright © 2017 Opia. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //For indiviual posts(could be helpful with Opia)
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
