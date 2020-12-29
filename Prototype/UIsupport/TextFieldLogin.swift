//
//  TextFieldLogin.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 23/12/20.
//

import Foundation
import UIKit

class TextFieldLogin: UITextField {
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setup()
        }

     required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setup()
        }

     private func setup() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth=1
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        }
    
}
