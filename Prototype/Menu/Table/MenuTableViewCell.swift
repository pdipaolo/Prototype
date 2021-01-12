//
//  MenuTableViewCell.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 04/01/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var prodottoImageView: ImageTopView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var ingredientiLabel: UILabel!
    @IBOutlet weak var costoLabel: UILabel!
    var id: String? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
