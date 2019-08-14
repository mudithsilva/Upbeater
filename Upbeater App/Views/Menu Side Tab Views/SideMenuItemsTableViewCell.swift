//
//  SideMenuItemsTableViewCell.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit

class SideMenuItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tabImage: UIImageView!
    @IBOutlet weak var tabName: UILabel!
    @IBOutlet weak var selectionBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
