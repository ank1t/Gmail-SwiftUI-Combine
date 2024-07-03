//
//  RecentSearchItem.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-23
//
        

import SwiftUI

struct RecentSearchItem: View {
    let searchText: String
    var body: some View {
        HStack {
            ZStack {
                Color.gray
                    .frame(width: Constants.Frame.size35,
                           height: Constants.Frame.size35)
                    .clipShape(Circle())
                
                Image(.history)
                    .resizable()
                    .frame(width: Constants.Frame.size15,
                           height: Constants.Frame.size15)
                    .background(.gray)
                    .clipShape(Circle())
                
            }
            Text(searchText)
            Spacer()
        }
    }
}
