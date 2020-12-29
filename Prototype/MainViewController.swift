//
//  MainViewController.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 24/12/20.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
class MainViewController: UIViewController {
    
// Logout button
    @IBAction func logOut(_ sender: UIButton) {
        if let _ = AccessToken.current {
            let facebookManager = LoginManager()
            facebookManager.logOut()
            self.navigationController?.popViewController(animated: true)
        }
        
        if let _ = GIDSignIn.sharedInstance()?.currentUser{
            GIDSignIn.sharedInstance().signOut()
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
