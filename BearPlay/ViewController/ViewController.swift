//
//  ViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var musicTableView: UITableView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var nowPlayingTitle: UILabel!
    
    var selected: Music?
    let formatter = DateComponentsFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        MusicFetcher.instance.refreshMusics()
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController{
            vc.music = selected
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicFetcher.instance.getMusicsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        let music = MusicFetcher.instance.getMusic(at: indexPath.row)
        
        if music.title.count > 30 {
            cell.titleLabel.text = String(music.title.prefix(30)) + "..."
        } else {
            cell.titleLabel.text = music.title
        }
        cell.lengthLabel.text = formatter.string(from: music.length)
        cell.albumImg.alpha = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = MusicFetcher.instance.getMusic(at: indexPath.row)
        
        nowPlayingTitle.text = selected?.title
        nowPlayingTitle.showAll()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        nowPlayingTitle.stopShowAll()
    }
}
