//
//  TabBarViewVontroller.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 03/01/21.
//

import UIKit

class CenterButtonTabBarController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.bringSubviewToFront(self.tabBar)
        self.addCenterButton()
    }

    private func addCenterButton() {
        let button = CButton(frame: CGRect(x: (Int(UIScreen.main.bounds.width) / 2) - (60 / 2) , y: (Int(UIScreen.main.bounds.height)) - 130, width: 60 , height: 60))

        self.view.addSubview(button)
        button.addTarget(self, action: #selector(didTouchCenterButton(_:)), for: .touchUpInside)
    }

    @objc
    private func didTouchCenterButton(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "SegueCart", sender: nil)
    }

}
