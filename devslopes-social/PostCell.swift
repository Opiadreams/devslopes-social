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
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
    }
    

}
