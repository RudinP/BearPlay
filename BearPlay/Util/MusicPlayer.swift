import Foundation
import MediaPlayer

class MusicPlayer{
    private let player: MPMusicPlayerController = MPMusicPlayerController.applicationMusicPlayer
    
    init() {
        player.setQueue(with: MPMediaQuery.songs())
    }
    
    func getNowPlaying() -> MPMediaItem?{
        return player.nowPlayingItem ?? nil
    }
    
    func getCurrentPlaybackTime() -> TimeInterval{
        return player.currentPlaybackTime
    }
    
    func setCurrentPlaybackTime(_ time: TimeInterval) {
        player.currentPlaybackTime = time
    }
    
    func play(_ song:MPMediaItem?){
        player.stop()
        player.nowPlayingItem = song
        player.prepareToPlay()
        player.play()
    }
        
    func resume(){
        player.play()
    }
    
    func pause(){
        player.pause()
    }
    
    func forward(){
        player.skipToNextItem()
    }
    
    func backward(){
        player.skipToPreviousItem()
    }
    
    func rewind(){
        player.skipToBeginning()
    }
}
