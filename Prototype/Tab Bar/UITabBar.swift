//
//  UITabBar.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 02/01/21.
//

import Foundation

import UIKit


class CustomTabBar: UITabBar {
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

    }
    
}
