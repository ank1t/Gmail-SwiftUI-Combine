//
//  RecentSearches.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-23
//
        

import SwiftUI

struct RecentSearches: View {
    var body: some View {
        HStack {
            Image(.history)
                .resizable()
                .frame(width: Constants.Frame.size20,
                       height: Constants.Frame.size20)
                .background(.gray)
                .clipShape(Circle())
                .padding(.horizontal, Constants.Padding.padding15)
            
            Text("Recent search")
        }
    }
}
