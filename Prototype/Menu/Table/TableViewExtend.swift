//
//  TableViewExtend.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 04/01/21.
//

import UIKit

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySection[section].item.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 40))
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.text = arraySection[section].nome
        view.addSubview(label)
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.nomeLabel.text = arraySection[indexPath.section].item[indexPath.row].nome + " \(indexPath.row)"
        cell.ingredientiLabel.text = "Ingredienti: \(arraySection[indexPath.section].item[indexPath.row].nome) \(indexPath.row)"
        cell.costoLabel.text = " \(arraySection[indexPath.section].item[indexPath.row].costo) "
        cell.id = arraySection[indexPath.section].item[indexPath.row].id
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        open add cart
        let slideUpView = UIView()
        slideUpView.backgroundColor = .white
        let screenSize = UIScreen.main.bounds.size
        let slideUpViewHeight: CGFloat = 200
        slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: slideUpViewHeight)
        let containerView = UIView()
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView.frame = self.view.frame
        containerView.alpha = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseIn, animations: {
          containerView.alpha = 0.8
          slideUpView.frame = CGRect(x: 0, y: screenSize.height - slideUpViewHeight, width: screenSize.width, height: slideUpViewHeight)
        }, completion: nil)
        
        window?.addSubview(containerView)
        window?.addSubview(slideUpView)
    }
}
