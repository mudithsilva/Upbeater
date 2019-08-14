//
//  MainMenuViewController.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit

class MainMenuViewController: SwiftySideMenuViewController, SwiftySideMenuDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        SwiftySideMenuInfo.shared.swiftySideMenu = self
        HomePageViewParams.mainMenuViewController = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuNavigationTabs(subviewFor sideMenu: UIView) -> UIView {
        let view = MenuSideTabView.getView()
        return view
    }
    
    func menuNavigationTabs(_ sideView: UIView) -> [SwiftySideMenuChildViewControllers] {
        var childViews: [SwiftySideMenuChildViewControllers] = []
        
        let childView1 = SwiftySideMenuChildViewControllers()
        childView1.tabName = "Meetings"
        childView1.storyboardName = "Meetings"
        childView1.viewControllerIdentifier = "MeetingTab"
        childViews.append(childView1)
        
        let childView2 = SwiftySideMenuChildViewControllers()
        childView2.tabName = "Team"
        childView2.storyboardName = "Team"
        childView2.viewControllerIdentifier = "TeamTab"
        childViews.append(childView2)
        
        let childView3 = SwiftySideMenuChildViewControllers()
        childView3.tabName = "Task List"
        childView3.storyboardName = "TaskList"
        childView3.viewControllerIdentifier = "TaskListTab"
        childViews.append(childView3)
        
        let childView4 = SwiftySideMenuChildViewControllers()
        childView4.tabName = "Team Chat"
        childView4.storyboardName = "TeamChat"
        childView4.viewControllerIdentifier = "TeamChatTab"
        childViews.append(childView4)
        
        let childView5 = SwiftySideMenuChildViewControllers()
        childView5.tabName = "Contact HR"
        childView5.storyboardName = "ContactHR"
        childView5.viewControllerIdentifier = "ContactHRTab"
        childViews.append(childView5)

        return childViews
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
