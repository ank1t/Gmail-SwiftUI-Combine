//
//  GCCTabbar.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-17
//
        
import Foundation
import SwiftUI

struct GCCTabar: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var viewModel = ViewModel()
    var body: some View {
        ZStack {
            Theme.tabBarBGColor(for: colorScheme)
            
            HStack {
                Spacer()
                Image(.email)
                    .resizable()
                    .frame(width: Constants.Frame.size25,
                           height: Constants.Frame.size25)
                Spacer()
                Spacer()
                Image(.meet)
                    .resizable()
                    .frame(width: Constants.Frame.size25,
                           height: Constants.Frame.size25)
                Spacer()
            }
        }
    }
}

