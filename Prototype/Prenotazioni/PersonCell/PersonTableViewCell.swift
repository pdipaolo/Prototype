//
//  PersonTableViewCell.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 06/01/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCollectionViewCell
        return cell
    }
    

    @IBOutlet weak var buttonCollection: UICollectionView!
    var numberCell = 10
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
        let nib = UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
        buttonCollection.register(nib, forCellWithReuseIdentifier: "buttonCell")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
