//
//  PostCellTableViewCell.swift
//  socialNetwork
//
//  Created by Donna Samuel on 25/1/18.
//  Copyright © 2018 donnasamuel. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileDesc: UITextView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var profileID: UILabel!
    @IBOutlet weak var numLikes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
