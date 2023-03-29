//
//  HomeViewModel.swift
//  MVVM_Example
//
//  Created by Ludlow, David (D.) on 29/03/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var results = [SearchResult]()
    @Published var searchText: String = "" {
        didSet { isSearchEnabled = (searchText.count > 2) }
    }
    @Published var isSearchEnabled = false

    func performSearch() {
        
        let search = searchText.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        
        guard let gUrl = URL(
            string: "https://itunes.apple.com/search?term=\(search)"
        ) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode(SearchResponse.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.results = response.results ?? []
                }
            } catch {
                print("*** ERROR ***")
            }
        }
    }
}
