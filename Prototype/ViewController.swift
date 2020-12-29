//
//  ViewController.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 23/12/20.
//

import UIKit
import Foundation
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn

class ViewController: UIViewController,GIDSignInDelegate {
    
//    Google sign in
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
          } else {
            print("\(error.localizedDescription)")
          }
          return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        openViewController()
//        print(email)
    }
    
    
    @IBAction func loginButton(_ sender: LoginSocialButton) {
    }
    
    @IBAction func googleSignIn(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBOutlet weak var googleSignIn: GIDSignInButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Open view controller when Facebook Access Token change
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            self.facebookUserData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        facebookUserData()
    }
    
    func facebookUserData(){
    //    Open view controller if you are logged with Facebook
        if let _ = AccessToken.current {
            getUserDataFromFacebook()
            openViewController()
        }
    }
    
    func openViewController(){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            navigationController?.pushViewController(newViewController, animated: false)
        
    }
}






