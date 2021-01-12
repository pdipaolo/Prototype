//
//  MenuViewController.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 04/01/21.
//

import UIKit

struct Item {
    var id: String
    var nome: String
    var ingredienti: String
    var costo: String
    var foto: String
}
struct Section {
    var nome: String
    var item: [Item]
}
class MenuViewController: UIViewController {
    
    let item1 = Item(id: "1", nome: "Panino", ingredienti: "", costo: "5,00 €", foto: "")
    let item2 = Item(id: "2", nome: "Primo", ingredienti: "", costo: "5,00 €", foto: "")
    let item3 = Item(id: "3", nome: "Secondo", ingredienti: "", costo: "5,00 €", foto: "")
    let item4 = Item(id: "4", nome: "Dolce", ingredienti: "", costo: "5,00 €", foto: "")
    let item5 = Item(id: "5", nome: "Bibita", ingredienti: "", costo: "5,00 €", foto: "")
    lazy var arraySection = [Section(nome: "Panini", item: [item1,item1,item1]),Section(nome: "Primo", item: [item2,item2]),Section(nome: "Secondo", item: [item3,item3,item3]),Section(nome: "Dolce", item: [item4,item4]),Section(nome: "Bibita", item: [item5,item5,item5])] {
        didSet {
            menuTableView.reloadData()
        }
    }
    

    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        // Do any additional setup after loading the view.
    }
    
    func setupTable(){
        menuTableView.delegate=self
        menuTableView.dataSource=self
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        setup()
    }

}
