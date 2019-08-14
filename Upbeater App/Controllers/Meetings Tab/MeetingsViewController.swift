//
//  MeetingsViewController.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MeetingsViewController: UIViewController {
    
    @IBOutlet weak var menuNavigationView: UIView!
    
    @IBOutlet weak var meetingTableView: UITableView!
    
    var meetingsArray: [Meeting] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftySideMenuImageView.addMenuImageView(addMenuViewTo: menuNavigationView)
        
        self.getMeetingList()
        // Do any additional setup after loading the view.
    }
    
    
    func getMeetingList() {
        
        Constants.refs.databaseMeetings.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            
            // Any Print Statement if Needed to Debug
            
            var tempMeetingsArray: [Meeting] = []
            
            if snapshot.childrenCount > 0 {
                for meeting in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let meetingObject = meeting.value as! [String: AnyObject]
                    
                    let newMeeting = Meeting(title: meetingObject["title"] as! String,
                                             time: meetingObject["time"] as! String,
                                             with: meetingObject["with"] as! String
                    )
                    tempMeetingsArray.append(newMeeting)
                }
                self.meetingsArray = tempMeetingsArray
            }
            self.meetingTableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MeetingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meetingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingTableViewCell", for: indexPath) as! MeetingTableViewCell
        cell.meetingTitle.text = self.meetingsArray[indexPath.row].title
        cell.meetingWith.text = self.meetingsArray[indexPath.row].with
        cell.meetingTime.text = self.meetingsArray[indexPath.row].time
        return cell
    }
    
}

extension MeetingsViewController: UITableViewDelegate {
    
}
