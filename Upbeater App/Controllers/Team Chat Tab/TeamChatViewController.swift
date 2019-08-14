//
//  TeamChatViewController.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit

class TeamChatViewController: UIViewController {
    
    @IBOutlet weak var menuNavigationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftySideMenuImageView.addMenuImageView(addMenuViewTo: menuNavigationView)
        // Do any additional setup after loading the view.
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
