//
//  DetailViewController.swift
//  BearPlay
//
//  Created by 루딘 on 12/14/23.
//

import UIKit

class DetailViewController: UIViewController {

    var music: Music?
    var player: MusicPlayer?
    var isPlaying: Bool?
    var timer : Timer?
    
    @IBOutlet weak var musicImg: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var progressBar: UISlider!
    @IBOutlet weak var playPauseBtn: UIButton!
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        progressBar.setThumbImage(UIImage(named:"thumbImg"), for: .highlighted)
        progressBar.setThumbImage(UIImage(named:"thumbImg"), for: .normal)
        
        initPlayPauseBtn()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.loadPlaybackTime()
            })
        
        NotificationCenter.default.addObserver(forName: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: .main, using: {[weak self] _ in self?.setView() })
    }
    
    func setView(){
        print("yes")
        music = nowPlayingToMusic()
        
        if let img = music?.artwork{
            musicImg.image = img
        }
        artistLabel.text = music?.artist ?? "anonymous"
        titleLabel.text = music?.title
        
        titleLabel.showAll()
        
        initSlider()
        
        durationLabel.text = TimeInterval(progressBar.value).toString()
    }
    
    func initSlider(){
        loadPlaybackTime()
        progressBar.maximumValue = Float(music?.length ?? 0)
    }
    
    func initPlayPauseBtn(){
        playPauseBtn.setImage(UIImage(systemName: "pause"), for: .selected)
        playPauseBtn.setImage(UIImage(systemName: "play"), for: .normal)
        
        if(isPlaying!){
            playPauseBtn.isSelected = true
        } else {
            playPauseBtn.isSelected = false
        }
    }
    
    func nowPlayingToMusic() -> Music?{
        if let nowPlayingID = player?.getNowPlaying()?.persistentID{
            let index = MusicFetcher.instance.indexForMusic(nowPlayingID)
            music = MusicFetcher.instance.getMusic(at: index)
            
            return music
        } else {
            return nil
        }
    }
    
    func loadPlaybackTime(){
        if let now = player?.getCurrentPlaybackTime(){
            progressBar.setValue(Float(now), animated: true)
            durationLabel.text = player?.getCurrentPlaybackTime().toString()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        
        player?.setCurrentPlaybackTime(TimeInterval(value))
        durationLabel.text = player?.getCurrentPlaybackTime().toString()
    }
    
    @IBAction func toBackward(_ sender: Any) {
        player?.backward()
        music = nowPlayingToMusic()
    }
    
    @IBAction func playPause(_ sender: Any) {
        if(playPauseBtn.isSelected){
            player?.pause()
            playPauseBtn.isSelected = false
        } else {
            if (music != nil){
                player?.resume()
                playPauseBtn.isSelected = true
            } else {
                let index = Int.random(in: 0...MusicFetcher.instance.getMusicsCount())
                music = MusicFetcher.instance.getMusic(at: index)
                playPauseBtn.isSelected = true
                player?.play(music?.file)
            }
        }
    }
    @IBAction func toForward(_ sender: Any) {
        player?.forward()
        music = nowPlayingToMusic()
    }
}

