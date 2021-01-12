//
//  SitTableViewCell.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 06/01/21.
//

import UIKit

class SitTableViewCell: UITableViewCell {

    @IBOutlet weak var button1: DesignPrenotazioniButton!
    @IBOutlet weak var button2: DesignPrenotazioniButton!
    @IBOutlet weak var button3: DesignPrenotazioniButton!
    
    @IBAction func button1(_ sender: DesignPrenotazioniButton) {
    }
    @IBAction func button2(_ sender: DesignPrenotazioniButton) {
    }
    @IBAction func button3(_ sender: DesignPrenotazioniButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
