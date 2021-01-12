//
//  ImageTopView.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 04/01/21.
//

import UIKit

class ImageTopView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initImageView()
    }
    private func initImageView(){
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
