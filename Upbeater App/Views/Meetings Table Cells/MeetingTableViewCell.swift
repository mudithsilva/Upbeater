//
//  MeetingTableViewCell.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit

class MeetingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var meetingTitle: UILabel!
    @IBOutlet weak var meetingWith: UILabel!
    @IBOutlet weak var meetingTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
