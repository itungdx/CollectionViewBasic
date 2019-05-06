
//
//  MenuViewController.swift
//  HelloWorld
//
//  Created by iTung on 5/3/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
    }
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        cell.nameCollectionView.text = "Dogstagram"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let destinationVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "DogstagramNavigationController") as? DogstagramNavigationController {
                self.present(destinationVC, animated: true, completion: nil)
            }
        } else {
            if let destinationVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "DogsPinterestNavigationViewController") as? DogsPinterestNavigationViewController {
                self.present(destinationVC, animated: true, completion: nil)
            }
        }
    }
}
