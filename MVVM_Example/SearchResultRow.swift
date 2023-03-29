//
//  SearchResultRow.swift
//  MVVM_Example
//
//  Created by Ludlow, David (D.) on 29/03/2023.
//

import Foundation
import SwiftUI

struct SearchResultRow: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        HStack {
            
            AsyncImage(url: resultVM.imgUrl) { image in
            image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
                
            Text(resultVM.trackName)
                .font(.title3)
                .lineLimit(2)

            Spacer()
            
            VStack {
                Text("Price")
                    .font(.caption2)
                Text(resultVM.fullPrice)
                    .font(.caption2.weight(.heavy))
            }
                
        }.padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(
            model: SearchResult.example)
        )
            .previewLayout(.fixed(width: 360, height: 80))
    }
}
