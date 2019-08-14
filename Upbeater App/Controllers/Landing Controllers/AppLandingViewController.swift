//
//  AppLandingViewController.swift
//  Upbeater App
//
//  Created by Mudith Chathuranga on 8/14/19.
//  Copyright © 2019 chathuranga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class AppLandingViewController: UIViewController, FUIAuthDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Authentication manager
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "ShowHome", sender: nil)
        } else {
            let authUI = FUIAuth.defaultAuthUI()

            authUI?.delegate = self
            let providers: [FUIAuthProvider] = [
                FUIGoogleAuth(),
                FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
            ]
            
            authUI?.providers = providers
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: true, completion: nil)
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
