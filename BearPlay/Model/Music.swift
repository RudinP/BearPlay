//
//  Music.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//
import UIKit
import MediaPlayer

class Music{
    
    let title: String
    let artist: String
    let artwork: UIImage?
    let length: TimeInterval
    let file: MPMediaItem?
    
    init(_ title: String, _ artist: String?,_ albumImg: UIImage?,_ length: TimeInterval, _ file: MPMediaItem?) {
        self.title = title
        self.artist = artist ?? "Anonymous"
        self.artwork = albumImg
        self.length = length
        self.file = file ?? nil
    }
}


