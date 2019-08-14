//
//  Meeting.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import Foundation
import UIKit

class Meeting: Codable {
    
    var title: String = ""
    var time: String = ""
    var with: String = ""
    
    init(title: String, time: String, with: String) {
        self.title = title
        self.time = time
        self.with = with
    }
}
