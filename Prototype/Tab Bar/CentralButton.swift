//
//  CentralButton.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 03/01/21.
//

import UIKit

class CButton: UIButton {

   override init(frame: CGRect) {
       super.init(frame: frame)
       initView()
       
   }

   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       initView()
   }
   

   private func initView() {

        self.backgroundColor = Color.primaryColor
        self.rotate(angle: 45)
        if let image = UIImage(named: "cart") {
           
            self.setImage(image, for: .normal)
        }
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 5).cgPath
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
   }

}


extension CButton {

   /**
    Rotate a view by specified degrees

    - parameter angle: angle in degrees
    */
   func rotate(angle: CGFloat) {
       let radians = angle / 180.0 * CGFloat.pi
       let rotation = self.transform.rotated(by: radians);
       self.transform = rotation
   }

}
