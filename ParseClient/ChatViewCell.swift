//
//  ChatViewCell.swift
//  ParseClient
//
//  Created by Akifumi Shinagawa on 10/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {

    @IBOutlet weak var chatViewMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
