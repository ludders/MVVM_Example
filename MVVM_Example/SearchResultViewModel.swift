//
//  SearchResultViewModel.swift
//  MVVM_Example
//
//  Created by Ludlow, David (D.) on 29/03/2023.
//

import Foundation

struct SearchResultVM {
    
    let model: SearchResult
    
    var trackName: String {
        model.trackName ?? ""
    }
    
    var imgUrl: URL? {
        URL(string: model.artworkUrl60 ?? "")
    }
    
    var fullPrice: String {
        guard let gPrice = model.trackPrice,
                let gCurrency = model.currency else { return "NA"}
        return gPrice.formatted(.currency(code: gCurrency))
    }
}
