//
//  Response.swift
//  MVVM_Example
//
//  Created by Ludlow, David (D.) on 29/03/2023.
//

import Foundation

// MARK: - Main Object
struct SearchResponse: Codable {
    let resultCount: Int?
    let results: [SearchResult]?
}

// MARK: - Result Item
struct SearchResult: Codable {

    var trackId: Int?
    var trackName: String?
    var collectionName: String?
    var trackPrice: Double?
    var currency: String?
    var artworkUrl60: String?
}

#if DEBUG
// MARK: - Example Item
extension SearchResult {
    
    static var example: SearchResult {

        SearchResult(
            trackId: 157487434,
            trackName: "Home",
            collectionName: "Joe Satriani",
            trackPrice: 1.29,
            currency: "USD",
            artworkUrl60: "https://is5-ssl.mzstatic.com/image/thumb/Music113/v4/c4/c1/a2/c4c1a2ad-8777-20d8-a4ef-ecddabe0de1b/source/60x60bb.jpg"
        )
    }
}
#endif
