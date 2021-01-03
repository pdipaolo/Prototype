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
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            
            self.view.addSubview(imageView)
            
        }
    }
}
