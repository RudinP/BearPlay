//
//  Music.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//
import UIKit

class Music{
    let albumImg: UIImage?
    let title: String
    let length: TimeInterval
    
    init(_ albumImg: UIImage?, _ title: String, _ length: TimeInterval) {
        self.albumImg = albumImg
        self.title = title
        self.length = length
    }
    
    static var dummyMusicList = [
        Music(nil, "노래1", TimeInterval(10.0)),
        Music(nil, "노래2", TimeInterval(60.0)),
        Music(nil, "노래3", TimeInterval(80.0)),
        Music(nil, "노래4", TimeInterval(20.0))
    ]
}
