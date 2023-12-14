//
//  ViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var musicTableView: UITableView!
    
    @IBOutlet weak var nowPlayingTitle: UILabel!
    
    var selected: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        MusicFetcher.instance.refreshAlbums()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController{
            vc.music = selected
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = Music.dummyMusicList[indexPath.row]
        
        print(selected?.title)
        nowPlayingTitle.text = selected?.title
    }
}
