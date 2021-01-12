//
//  PrenotazioneViewController.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 06/01/21.
//

import UIKit

class PrenotazioneViewController: UIViewController {
    let arraySection = ["BOOK YOUR TABLE","Dove vuoi sederti?","Select Person","Quante persone?", "Orario"]
    
    @IBOutlet weak var prenotazioniCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    func setupTable(){
        prenotazioniCollection.delegate=self
        prenotazioniCollection.dataSource=self
        
        
        let buttonNib = UINib(nibName: "PrenotazioneCollectionViewCell", bundle: nil)
        prenotazioniCollection.register(buttonNib, forCellWithReuseIdentifier: "PrenotazioneCell")
        let calendarNib = UINib(nibName: "CalendarCollectionViewCell", bundle: nil)
        prenotazioniCollection.register(calendarNib, forCellWithReuseIdentifier: "CalendarCell")
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = centerItemsInCollectionView(cellWidth: 80, numberOfItems: 3, spaceBetweenCell: 30, collectionView: prenotazioniCollection)
        self.prenotazioniCollection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        
        prenotazioniCollection.collectionViewLayout = layout
        prenotazioniCollection.translatesAutoresizingMaskIntoConstraints=true
        prenotazioniCollection.allowsMultipleSelection = true
    }
}

extension PrenotazioneViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberCell = 0
        switch section {
        case 0:
            numberCell = 1
        case 1:
            numberCell = 2
        case 2:
            numberCell = 3
        case 3:
            numberCell = 3
        case 4:
            numberCell = 9
        default:
            break
        }
        return numberCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
            
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrenotazioneCell", for: indexPath) as! PrenotazioneCollectionViewCell
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrenotazioneCell", for: indexPath) as! PrenotazioneCollectionViewCell
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrenotazioneCell", for: indexPath) as! PrenotazioneCollectionViewCell
        case 4:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrenotazioneCell", for: indexPath) as! PrenotazioneCollectionViewCell
        default:
            break
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize(width: 80, height: 80 )
        switch indexPath.section {
        case 0:
            size = CGSize(width: 300, height: 300 )
        case 1:
            size = CGSize(width: 80, height: 80 )
        case 2:
            size = CGSize(width: 80, height: 80 )
        case 3:
            size = CGSize(width: 80, height: 80 )
        case 4:
            size = CGSize(width: 80, height: 80 )
        default:
            break
        }
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        print("UICollectionViewDelegateFlowLayout")
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        
            
    
        headerView.titleLabel.text = arraySection[indexPath.section]
            return headerView
        
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        
            
            footerView.titleLabel.text = "Footer"
            return footerView
        
        default:
            assert(false, "Unexpected element kind")
        }
    }


    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.indexPathsForSelectedItems?.filter({ $0.section == indexPath.section }).forEach({ collectionView.deselectItem(at: $0, animated: false) })
        return true
    }
    

}

class HeaderCollectionReusableView: UICollectionReusableView {

    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        // Customize here
        addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
    }
}
