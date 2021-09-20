//
//  Constants.swift
//  youtube-onedb
//
//  Created by Omega on 10/8/21.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyAUaSBQ_4b7EaMM6ssKASHtJ1ldDtxS0ak"
    static var PLAYLIST_ID = "PLX6gBVSAR-Ih0lGx2Wg1hadwvkb1iTaOu"
    static var API_URL =
        "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"

    static var VIDEOCELL_ID = "VideoCell"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
