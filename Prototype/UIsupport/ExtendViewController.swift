//
//  ExtendViewController.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 02/01/21.
//

import UIKit

extension UIViewController {
    
    func setup(){
        navigationController?.isNavigationBarHidden = true
        
        
        if let image = UIImage(named: "sfondo.pdf") {
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            imageView.image = image
            imageView.layer.anchorPointZ = 1
            self.view.addSubview(imageView)
            
        }
    }
}


