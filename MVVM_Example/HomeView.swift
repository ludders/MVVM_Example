//
//  HomeView.swift
//  MVVM_Example
//
//  Created by Ludlow, David (D.) on 29/03/2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
         
                List {
                    HStack {
                        TextField("Search text", text: $viewModel.searchText)
                            .textFieldStyle(.roundedBorder)
                        if viewModel.isSearchEnabled {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
         
                    ForEach(viewModel.results, id: \.trackId) {
                        let viewModel = SearchResultVM(model: $0)
                        SearchResultRow(resultVM: viewModel)
                    }
                }
                .listStyle(.inset)
                
                Button {
                    viewModel.performSearch()
                } label: {
                    Text("SEARCH MUSIC")
                        .frame(width: 250, height: 40)
                }
                .buttonStyle(.bordered)
                .disabled(!viewModel.isSearchEnabled)
                .padding(.bottom, 8)
            }
            .navigationTitle("MVVM DEMO")
        }
    }
}
