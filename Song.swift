//
//  Song.swift
//  TestCodable
//
//  Created by Yvonne on 2019/12/11.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import Foundation


struct Song: Codable {
    var artistName: String
    var trackName: String
    var previewUrl: URL
    var artworkUrl100: URL
    var trackPrice: Double?
}

struct SongResults:Codable {
    var resultCount: Int
    var results: [Song]
}
