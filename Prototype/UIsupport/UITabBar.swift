//
//  UITabBar.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 02/01/21.
//

import Foundation

import UIKit

class CustomTabBar: UITabBar {

    let centralView = CentralButton(frame: CGRect(x: (Int(UIScreen.main.bounds.width) / 2) - (60 / 2) , y: -50, width: 60 , height: 60))
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 25.0
    override func draw(_ rect: CGRect) {
         addShape()
     }
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0   , height: -3);
        shapeLayer.shadowOpacity = 0.2
        layer.insertSublayer(shapeLayer, at: 0)
    
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [],
            cornerRadii: CGSize(width: radii, height: 0.0))

        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isTranslucent = true
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })


    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initBar()
    }
    
    func initBar() {
        
        self.addSubview(centralView)
        
    }
}


class CentralButton: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    func initView() {
        if let image = UIImage(named: "cart") {
            self.backgroundColor = UIColor(patternImage: image)
        }
        self.backgroundColor = Color.primaryColor
        self.rotate(angle:45)
        layer.cornerRadius = 5
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
}

extension UIView {

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
