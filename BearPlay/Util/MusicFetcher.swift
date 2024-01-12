//
//  MusicFetcher.swift
//  BearPlay
//
//  Created by 루딘 on 12/13/23.
//

import Foundation
import MediaPlayer

class MusicFetcher{

    static let instance = MusicFetcher()
    
    var musicsCollection: [MPMediaItemCollection]?
    private var musics = [Music]()
    
    func getMusic(at index: Int) -> Music {
        if index < 0 || index >= musics.count {
            return Music("", "", UIImage(), 0, nil)
        }
        return musics[index]
    }
    
    func getMusicsCount() -> Int{
        return musics.count
    }
    
    func refreshMusics(){
        self.makeMusicsQuery()
        self.setMusics()
    }
    
    private func makeMusicsQuery(){
        if let collections = MPMediaQuery.songs().collections{
            self.musicsCollection = collections
        } else {
            self.musicsCollection = nil
        }
    }
    
    private func setMusics(){
        musics.removeAll()
        musicsCollection?.forEach({libraryMusicItem in
            let libraryRepresentativeItem = libraryMusicItem.representativeItem
            let newMusicTitle = libraryRepresentativeItem?.title ?? ""
            let newMusicArtist = libraryRepresentativeItem?.artist ?? ""
            let newMusicArtwork = libraryRepresentativeItem?.artwork?.image(at: CGSize(width: 500, height: 500)) ?? UIImage()
            let newMusicLength = libraryRepresentativeItem?.playbackDuration ?? 0
            let newMusicFile = libraryMusicItem.representativeItem ?? nil
            
            let newLibraryMusic = Music(newMusicTitle, newMusicArtist, newMusicArtwork, newMusicLength, newMusicFile)
            
            musics.append(newLibraryMusic)
        })
    }
}
