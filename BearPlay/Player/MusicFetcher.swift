//
//  MusicFetcher.swift
//  BearPlay
//
//  Created by 루딘 on 12/13/23.
//

import Foundation
import MediaPlayer

struct Album{
    var title: String
    var artist: String
    var artwork: UIImage
}
class MusicFetcher{

    static let instance = MusicFetcher()
    
    private var albumsCollection: [MPMediaItemCollection]?
    private var albums = [Album]()
    
    func refreshAlbums(){
        self.makeAlbumsQuery()
        self.setAlbums()
    }
    
    private func makeAlbumsQuery(){
        if let collections = MPMediaQuery.albums().collections{
            self.albumsCollection = collections
        } else {
            self.albumsCollection = nil
        }
    }
    
    private func setAlbums(){
        albums.removeAll()
        albumsCollection?.forEach({libraryAlbumItem in
            let libraryRepresentativeItem = libraryAlbumItem.representativeItem
            let newAlbumTitle = libraryRepresentativeItem?.albumTitle ?? ""
            let newAlbumArtist = libraryRepresentativeItem?.albumArtist ?? ""
            let newAlbumArtwork = libraryRepresentativeItem?.artwork?.image(at: CGSize(width: 500, height: 500)) ?? UIImage()
            
            let newLibraryAlbum = Album(title: newAlbumTitle, artist: newAlbumArtist, artwork: newAlbumArtwork)
            
            albums.append(newLibraryAlbum)
        })
    }
}
