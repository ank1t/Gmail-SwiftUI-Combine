//
//  SearchView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-12
//
        
import Foundation
import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
            VStack {
                HStack {
                    Image(.backChevron)
                        .resizable()
                        .frame(width: Constants.Frame.size10,
                               height: Constants.Frame.size15)
                        .padding(.leading, Constants.Padding.padding15)
                    Spacer()
                    Image(.mic)
                        .resizable()
                        .frame(width: Constants.Frame.size15,
                               height: Constants.Frame.size20)
                        .padding(.trailing, Constants.Padding.padding15)
                }
            }
        }
    }
}
