//
//  PrenotazioneCollectionViewCell.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 06/01/21.
//

import UIKit

class PrenotazioneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    override var isSelected: Bool {
        didSet {
            
            self.backgroundColor = isSelected ? Color.primaryColor : Color.secondaryColor
        }
    }
    func setup(){
        self.backgroundColor = Color.secondaryColor
        image.image = UIImage(named: "menu")
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
