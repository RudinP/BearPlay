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
    
    @IBOutlet weak var playPauseBtn: UIButton!

    var selected: Music?
    var selectedIndex: Int?{
        didSet{
            if(oldValue != selectedIndex){
                startNowPlayingTitleAnim()
            }
        }
    }
    var player: MusicPlayer?
    var token: NSObjectProtocol?

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let token = token{
            NotificationCenter.default.removeObserver(token)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = MusicPlayer()
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        MusicFetcher.instance.refreshMusics()
        
        initPlayPauseBtn()
        
        token = NotificationCenter.default.addObserver(forName: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: .main, using: {[weak self] _ in self?.syncSelectedRow()})
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController{
            vc.music = selected
            vc.player = player
            vc.isPlaying = playPauseBtn.isSelected
        }
    }
    
    
    func initPlayPauseBtn(){
        playPauseBtn.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        playPauseBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    @IBAction func toBackward(_ sender: Any) {
        player?.backward()
    }
    
    @IBAction func playPause(_ sender: Any) {
        if(playPauseBtn.isSelected){
            player?.pause()
            playPauseBtn.isSelected = false
        } else {
            if (selected != nil){
                player?.resume()
                playPauseBtn.isSelected = true
            } else {
                let index = Int.random(in: 0...MusicFetcher.instance.getMusicsCount())
                selected = MusicFetcher.instance.getMusic(at: index)
                playPauseBtn.isSelected = true
                player?.play(selected?.file)
            }
        }
    }
    @IBAction func toForward(_ sender: Any) {
        player?.forward()
    }
    
    func syncSelectedRow(){
        if let music = player?.getNowPlaying(){
            let index = MusicFetcher.instance.indexForMusic(music.persistentID)
            musicTableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .none)
            
            selected = MusicFetcher.instance.getMusic(at: index)
            selectedIndex = index
        }
    }
    
    func startNowPlayingTitleAnim(){
        nowPlayingTitle.text = selected?.title
        nowPlayingTitle.layer.layoutIfNeeded()
        nowPlayingTitle.showAll()
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
        cell.lengthLabel.text = music.length.toString()
        cell.albumImg.alpha = 0
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = MusicFetcher.instance.getMusic(at: indexPath.row)
        selectedIndex = indexPath.row
            
        if let song = selected{
            if let file = song.file{
                player?.play(file)
                playPauseBtn.isSelected = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if selectedIndex == indexPath.row{
                return nil
            }
            return indexPath
        }
}

