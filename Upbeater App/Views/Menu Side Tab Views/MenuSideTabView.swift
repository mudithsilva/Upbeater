//
//  MenuSideTabView.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MenuSideTabView: UIView {
    
    @IBOutlet weak var menuTableSideTabView: UIView!
    @IBOutlet weak var userName: UILabel!
    
    private var menuTableView: UITableView!
    
    
    let menuItems: [String] = ["Meetings", "Team", "Task List", "Team Chat", "Contact HR"]
    let menuIcons: [String] = ["leadsIcon", "campaignsIcon" , "myProfileIcon", "taskListIcon", "noContactsIcon"]
    
    let selectionColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    
    
    public class func getView() -> MenuSideTabView {
        let cellNib = UINib(nibName: "MenuSideTabView", bundle: Bundle(for: MenuSideTabView.self))
        return cellNib.instantiate(withOwner: nil, options: nil)[0] as! MenuSideTabView
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.configUserData()
        self.menuTableView = UITableView()
        self.menuTableView.frame = self.menuTableSideTabView.frame
        self.menuTableView.register(UINib(nibName: "SideMenuItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuItemsTableViewCell")
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
        self.menuTableView.backgroundColor = UIColor.clear
        self.menuTableView.tableFooterView = UIView()
        self.menuTableSideTabView.addSubview(menuTableView)
        
        self.menuTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.menuTableView.leadingAnchor.constraint(equalTo: self.menuTableSideTabView.leadingAnchor, constant: 0),
            self.menuTableView.trailingAnchor.constraint(equalTo: self.menuTableSideTabView.trailingAnchor, constant: 0),
            self.menuTableView.topAnchor.constraint(equalTo: self.menuTableSideTabView.topAnchor, constant: 0),
            self.menuTableView.bottomAnchor.constraint(equalTo: self.menuTableSideTabView.bottomAnchor, constant: 0),
            ])
    }
    
    func configUserData() {
        self.userName.text = ""
    }
    
    @IBAction func userLogout(_ sender: Any) {
        try! Auth.auth().signOut()
        HomePageViewParams.mainMenuViewController.dismiss(animated: true, completion: nil)
    }
    
}


extension MenuSideTabView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemsTableViewCell", for: indexPath) as! SideMenuItemsTableViewCell
        cell.tabName.text = self.menuItems[indexPath.row]
        cell.tabImage.image = UIImage(named: self.menuIcons[indexPath.row])
        cell.selectionStyle = .none
        if self.selectedIndex == indexPath {
            cell.selectionBackgroundView.alpha = 1.0
        } else {
            cell.selectionBackgroundView.alpha = 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
}

extension MenuSideTabView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadData()
        SwiftySideMenuInfo.shared.swiftySideMenu.showClickedTab(selectedIndex: indexPath.row)
    }
}
