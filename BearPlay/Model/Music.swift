//
//  Music.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//
import UIKit

class Music{
    
    let title: String
    let artist: String
    let albumImg: UIImage?
    let length: TimeInterval
    
    init(_ title: String, _ artist: String?,_ albumImg: UIImage?,_ length: TimeInterval) {
        self.title = title
        self.artist = artist ?? "Anonymous"
        self.albumImg = albumImg
        self.length = length
    }
    
    static var dummyMusicList = [
        Music("노래1", nil ,nil, TimeInterval(10.0)),
        Music("노래2", nil ,nil, TimeInterval(60.0)),
        Music("노래3", nil ,nil, TimeInterval(80.0)),
        Music("노래4", nil ,nil, TimeInterval(20.0))
    ]
}
