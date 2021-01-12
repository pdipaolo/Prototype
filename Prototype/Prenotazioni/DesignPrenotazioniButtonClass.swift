//
//  DesignPrenotazioniButtonClass.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 06/01/21.
//

import UIKit

class DesignPrenotazioniButton: UIButton {
    @IBInspectable
    var flag: Bool = false {
        didSet {
            self.layer.backgroundColor = flag ? Color.primaryColor.cgColor : UIColor.lightGray.cgColor
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    
    func setup(){
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    
    
}
