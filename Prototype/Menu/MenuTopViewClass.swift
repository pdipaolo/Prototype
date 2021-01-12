//
//  MenuTopviewClass.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 04/01/21.
//

import UIKit

class MenuTopView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    
     func initView() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
    }
}
