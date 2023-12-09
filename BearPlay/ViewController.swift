//
//  ViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        return cell
    }
}
