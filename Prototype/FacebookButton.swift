//
//  FacebookButton.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 23/12/20.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class FacebookButton: UIButton {
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setup()
        }

     required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setup()
        }

     private func setup() {
        self.addTarget(nil, action: #selector(click), for: .touchUpInside)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth=0.02
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        }
    

    @objc func click(){
        let facebookManager = LoginManager()
        facebookManager.logIn()
    }

    
}
