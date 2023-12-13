//
//  ViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        musicTableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Music.dummyMusicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        
        cell.titleLabel.text = Music.dummyMusicList[indexPath.row].title
        cell.lengthLabel.text = String(Music.dummyMusicList[indexPath.row].length)
        if let img = Music.dummyMusicList[indexPath.row].albumImg{
            cell.albumImg.image = img
        }
        
        return cell
    }
    
}


