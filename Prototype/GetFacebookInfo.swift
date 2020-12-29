//
//  GetFacebookInfo.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 24/12/20.
//

import Foundation
import FBSDKCoreKit

// Return user information from the Facebook Account
func getUserDataFromFacebook() {
    GraphRequest(graphPath: "me", parameters: ["fields": "first_name, id,email"]).start { (connection, result, error) in
        if let err = error {
            print(err.localizedDescription); return } else {
                if let fields = result as? [String:Any], let firstName = fields["first_name"] as? String, let id = fields["id"] as? String, let email = fields["email"] as? String {

                    print(firstName,id,email)
    
                }
            }
    }
}
