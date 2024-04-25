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
    @State var selectedIndex: CGFloat = 0
    
    var body: some View {
        ZStack {
            Theme.tabBarBGColor(for: colorScheme)
            
            HStack {
                Spacer()
                Image(.email)
                    .resizable()
                    .frame(width: Constants.Frame.size20,
                           height: Constants.Frame.size15)
                    .foregroundColor(viewModel.getTintColor(for: selectedIndex,
                                                            tabIndex: 0,
                                                            colorScheme: colorScheme))
                
                Spacer()
                Spacer()
                Image(.meet)
                    .resizable()
                    .frame(width: Constants.Frame.size20,
                           height: Constants.Frame.size15)
                    .foregroundColor(viewModel.getTintColor(for: selectedIndex,
                                                            tabIndex: 0,
                                                            colorScheme: colorScheme))
                Spacer()
            }
        }
    }
}

