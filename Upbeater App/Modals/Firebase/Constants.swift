//
//  Constants.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import Foundation
import Firebase

struct Constants {
    
    struct refs {
        static let databaseRoot = Database.database().reference()
        static let databaseMeetings = databaseRoot.child("Meetings")
    }
}
